﻿using Newtonsoft.Json;
using Programs_Server;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Programs_Server.Models;
using System.IO;
using System.Net.Http.Headers;
using System.Web;

namespace Programs_Server.Controllers
{


    [RoutePrefix("api/users")]

    public class usersController : ApiController

    {
        // GET api/<controller>
        [HttpGet]
        [Route("GetAll")]
        public IHttpActionResult GetAll()
        {
            var re = Request;
            var headers = re.Headers;
            string token = "";
            bool canDelete = false;

            if (headers.Contains("APIKey"))
            {
                token = headers.GetValues("APIKey").First();
            }

            Validation validation = new Validation();
            bool valid = validation.CheckApiKey(token);

            if (valid) // APIKey is valid
            {
                using (incprogramsdbEntities entity = new incprogramsdbEntities())
                {
                    var List = (from S in entity.users
                                select new usersModel()
                                {
                                    userId = S.userId,
                                    name = S.name,
                                    AccountName = S.AccountName,
                                    lastName = S.lastName,
                                    company = S.company,
                                    email = S.email,
                                    phone = S.phone,
                                    mobile = S.mobile,
                                    fax = S.fax,
                                    address = S.address,
                                    agentLevel = S.agentLevel,
                                    createDate = S.createDate,
                                    updateDate = S.updateDate,
                                    code = S.code,
                                    password = S.password,
                                    type = S.type,
                                    image = S.image,
                                    notes = S.notes,
                                    balance = S.balance,
                                    createUserId = S.createUserId,
                                    updateUserId = S.updateUserId,
                                    isActive = S.isActive,
                                 




                                }).ToList();
                    /*


                    */

                    if (List.Count > 0)
                    {
                        for (int i = 0; i < List.Count; i++)
                        {
                            if (List[i].isActive == 1)
                            {
                                int userId = (int)List[i].userId;
                                var itemsI = entity.packageUser.Where(x => x.userId == userId).Select(b => new { b.userId }).FirstOrDefault();

                                if ((itemsI is null))
                                    canDelete = true;
                            }
                            List[i].canDelete = canDelete;
                        }
                    }

                    if (List == null)
                        return NotFound();
                    else
                        return Ok(List);
                }
            }
            //else
            return NotFound();
        }

        // GET api/<controller>
        [HttpGet]
        [Route("GetByID")]
        public IHttpActionResult GetByID(int userId)
        {
            var re = Request;
            var headers = re.Headers;
            string token = "";
            if (headers.Contains("APIKey"))
            {
                token = headers.GetValues("APIKey").First();
            }
            Validation validation = new Validation();
            bool valid = validation.CheckApiKey(token);

            if (valid)
            {
                using (incprogramsdbEntities entity = new incprogramsdbEntities())
                {
                    var row = entity.users
                   .Where(u => u.userId == userId)
                   .Select(S => new
                   {
                       S.userId,
                       S.name,
                       S.AccountName,
                       S.lastName,
                       S.company,
                       S.email,
                       S.phone,
                       S.mobile,
                       S.fax,
                       S.address,
                       S.agentLevel,
                       S.createDate,
                       S.updateDate,
                       S.code,
                       S.password,
                       S.type,
                       S.image,
                       S.notes,
                       S.balance,
                       S.createUserId,
                       S.updateUserId,
                       S.isActive,
                       

                   })
                   .FirstOrDefault();

                    if (row == null)
                        return NotFound();
                    else
                        return Ok(row);
                }
            }
            else
                return NotFound();
        }

        // add or update location
        [HttpPost]
        [Route("Save")]
        public string Save(string Object)
        {
            var re = Request;
            var headers = re.Headers;
            string token = "";
            string message = "";
            if (headers.Contains("APIKey"))
            {
                token = headers.GetValues("APIKey").First();
            }
            Validation validation = new Validation();
            bool valid = validation.CheckApiKey(token);

            if (valid)
            {
                Object = Object.Replace("\\", string.Empty);
                Object = Object.Trim('"');
                users newObject = JsonConvert.DeserializeObject<users>(Object, new JsonSerializerSettings { DateParseHandling = DateParseHandling.None });
                if (newObject.updateUserId == 0 || newObject.updateUserId == null)
                {
                    Nullable<int> id = null;
                    newObject.updateUserId = id;
                }
                if (newObject.createUserId == 0 || newObject.createUserId == null)
                {
                    Nullable<int> id = null;
                    newObject.createUserId = id;
                }
              

                try
                {
                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        var locationEntity = entity.Set<users>();
                        if (newObject.userId == 0)
                        {
                            newObject.createDate = DateTime.Now;
                            newObject.updateDate = DateTime.Now;
                            newObject.updateUserId = newObject.createUserId;


                            locationEntity.Add(newObject);
                            entity.SaveChanges();
                            message = newObject.userId.ToString();
                        }
                        else
                        {
                            var tmpObject = entity.users.Where(p => p.userId == newObject.userId).FirstOrDefault();

                            tmpObject.updateDate = DateTime.Now;
                            tmpObject.userId = newObject.userId;
                            tmpObject.name = newObject.name;
                            tmpObject.AccountName = newObject.AccountName;
                            tmpObject.lastName = newObject.lastName;
                            tmpObject.company = newObject.company;
                            tmpObject.email = newObject.email;
                            tmpObject.phone = newObject.phone;
                            tmpObject.mobile = newObject.mobile;
                            tmpObject.fax = newObject.fax;
                            tmpObject.address = newObject.address;
                            tmpObject.agentLevel = newObject.agentLevel;
                          //  tmpObject.createDate = newObject.createDate;
                         
                            tmpObject.code = newObject.code;
                            tmpObject.password = newObject.password;
                            tmpObject.type = newObject.type;
                            tmpObject.image = newObject.image;
                            tmpObject.notes = newObject.notes;
                            tmpObject.balance = newObject.balance;
                         //   tmpObject.createUserId = newObject.createUserId;
                            tmpObject.updateUserId = newObject.updateUserId;
                            tmpObject.isActive = newObject.isActive;
                         


                            entity.SaveChanges();

                            message = tmpObject.userId.ToString();
                        }
                        //  entity.SaveChanges();
                    }
                }
                catch
                {
                    message = "-1";
                }
            }
            return message;
        }

        [HttpPost]
        [Route("Delete")]
        public string Delete(int userId, int signuserId, bool final)
        {
            var re = Request;
            var headers = re.Headers;
            string token = "";
            int message = 0;
            if (headers.Contains("APIKey"))
            {
                token = headers.GetValues("APIKey").First();
            }

            Validation validation = new Validation();
            bool valid = validation.CheckApiKey(token);
            if (valid)
            {
                if (final)
                {
                    try
                    {
                        using (incprogramsdbEntities entity = new incprogramsdbEntities())
                        {
                            users objectDelete = entity.users.Find(userId);

                            entity.users.Remove(objectDelete);
                            message = entity.SaveChanges();

                            return message.ToString();
                        }
                    }
                    catch
                    {
                        return "-1";
                    }
                }
                else
                {
                    try
                    {
                        using (incprogramsdbEntities entity = new incprogramsdbEntities())
                        {
                            users objectDelete = entity.users.Find(userId);

                            objectDelete.isActive = 0;
                            objectDelete.updateUserId = signuserId;
                            objectDelete.updateDate = DateTime.Now;
                            message = entity.SaveChanges();

                            return message.ToString(); ;
                        }
                    }
                    catch
                    {
                        return "-2";
                    }
                }
            }
            else
                return "-3";
        }

        [Route("PostUserImage")]
        public IHttpActionResult PostUserImage()
        {

            try
            {
                var httpRequest = HttpContext.Current.Request;

                foreach (string file in httpRequest.Files)
                {

                    HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created);

                    var postedFile = httpRequest.Files[file];
                    string imageName = postedFile.FileName;
                    string imageWithNoExt = Path.GetFileNameWithoutExtension(postedFile.FileName);

                    if (postedFile != null && postedFile.ContentLength > 0)
                    {

                        int MaxContentLength = 1024 * 1024 * 1; //Size = 1 MB

                        IList<string> AllowedFileExtensions = new List<string> { ".jpg", ".gif", ".png", ".bmp", ".jpeg", ".tiff", ".jfif" };
                        var ext = postedFile.FileName.Substring(postedFile.FileName.LastIndexOf('.'));
                        var extension = ext.ToLower();

                        if (!AllowedFileExtensions.Contains(extension))
                        {

                            var message = string.Format("Please Upload image of type .jpg,.gif,.png, .jfif, .bmp , .jpeg ,.tiff");
                            return Ok(message);
                        }
                        else if (postedFile.ContentLength > MaxContentLength)
                        {

                            var message = string.Format("Please Upload a file upto 1 mb.");

                            return Ok(message);
                        }
                        else
                        {
                            //  check if image exist
                            var pathCheck = Path.Combine(System.Web.Hosting.HostingEnvironment.MapPath("~\\images\\user"), imageWithNoExt);
                            var files = Directory.GetFiles(System.Web.Hosting.HostingEnvironment.MapPath("~\\images\\user"), imageWithNoExt + ".*");
                            if (files.Length > 0)
                            {
                                File.Delete(files[0]);
                            }

                            //Userimage myfolder name where i want to save my image
                            var filePath = Path.Combine(System.Web.Hosting.HostingEnvironment.MapPath("~\\images\\user"), imageName);
                            postedFile.SaveAs(filePath);

                        }
                    }

                    var message1 = string.Format("Image Updated Successfully.");
                    return Ok(message1);
                }
                var res = string.Format("Please Upload a image.");

                return Ok(res);
            }
            catch (Exception ex)
            {
                var res = string.Format("some Message");

                return Ok(res);
            }
        }

        [HttpGet]
        [Route("GetImage")]
        public HttpResponseMessage GetImage(string imageName)
        {
            if (String.IsNullOrEmpty(imageName))
                return Request.CreateResponse(HttpStatusCode.BadRequest);

            string localFilePath;

            localFilePath = Path.Combine(System.Web.Hosting.HostingEnvironment.MapPath("~\\images\\user"), imageName);

            HttpResponseMessage response = new HttpResponseMessage(HttpStatusCode.OK);
            response.Content = new StreamContent(new FileStream(localFilePath, FileMode.Open, FileAccess.Read));
            response.Content.Headers.ContentDisposition = new System.Net.Http.Headers.ContentDispositionHeaderValue("attachment");
            response.Content.Headers.ContentDisposition.FileName = imageName;

            return response;
        }
        [HttpPost]
        [Route("UpdateImage")]
        public int UpdateImage(string userObject)
        {
            var re = Request;
            var headers = re.Headers;
            string token = "";
            if (headers.Contains("APIKey"))
            {
                token = headers.GetValues("APIKey").First();
            }
            Validation validation = new Validation();
            bool valid = validation.CheckApiKey(token);

            userObject = userObject.Replace("\\", string.Empty);
            userObject = userObject.Trim('"');

            users userObj = JsonConvert.DeserializeObject<users>(userObject, new JsonSerializerSettings { DateParseHandling = DateParseHandling.None });
            if (userObj.updateUserId == 0 || userObj.updateUserId == null)
            {
                Nullable<int> id = null;
                userObj.updateUserId = id;
            }
            if (userObj.createUserId == 0 || userObj.createUserId == null)
            {
                Nullable<int> id = null;
                userObj.createUserId = id;
            }
            if (valid)
            {
                try
                {
                    users user;
                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        var userEntity = entity.Set<users>();
                        user = entity.users.Where(p => p.userId == userObj.userId).First();
                        user.image = userObj.image;
                        entity.SaveChanges();
                    }
                    return user.userId;
                }

                catch
                {
                    return 0;
                }
            }
            else
                return 0;
        }

    }
}