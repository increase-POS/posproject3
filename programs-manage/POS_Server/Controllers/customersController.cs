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
using Programs_Server.Models.VM;
using System.Security.Claims;
using Newtonsoft.Json.Converters;

namespace Programs_Server.Controllers
{

    [RoutePrefix("api/customers")]

    public class customersController : ApiController

    {
        // GET api/<controller>



        [HttpPost]
        [Route("GetAll")]
        public string GetAll(string token)
        {
           
            bool canDelete = false;
            token = TokenManager.readToken(HttpContext.Current.Request);
            var strP = TokenManager.GetPrincipal(token);
            if (strP != "0") //invalid authorization
            {
                return TokenManager.GenerateToken(strP);
            }
            else
            {
                try
                {
                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                {
                    var List = (from S in entity.customers
                                select new customersModel()
                                {
                                    custId = S.custId,
                                    custname = S.custname,
                                  //  custAccountName = S.custAccountName,
                                    lastName = S.lastName,
                                    company = S.company,
                                    email = S.email,
                                    phone = S.phone,
                                    mobile = S.mobile,
                                    fax = S.fax,
                                    address = S.address,
                                    custlevel = S.custlevel,
                                    createDate = S.createDate,
                                    updateDate = S.updateDate,
                                    custCode = S.custCode,
                                   // password = S.password,
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
                                int custId = (int)List[i].custId;
                                var itemsI = entity.packageUser.Where(x => x.customerId == custId).Select(b => new { b.customerId }).FirstOrDefault();

                                if ((itemsI is null))
                                    canDelete = true;
                            }
                            List[i].canDelete = canDelete;
                        }
                    }

                        return TokenManager.GenerateToken(List);
                    }
                }
                catch
                {
                    return TokenManager.GenerateToken("0");
                }
            }
        }

        // GET api/<controller>
        [HttpPost]
        [Route("GetByID")]
        public string GetByID(string token)//string token
        {
            string message = "";

            token = TokenManager.readToken(HttpContext.Current.Request);
            var strP = TokenManager.GetPrincipal(token);
            if (strP != "0") //invalid authorization
            {
                return TokenManager.GenerateToken(strP);
            }
            else
            {
                int custId = 0;


                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "custId")
                    {
                        custId = int.Parse(c.Value);
                    }


                }
                try
                {

                
                using (incprogramsdbEntities entity = new incprogramsdbEntities())
                {
                    var row = entity.customers
                   .Where(u => u.custId == custId)
                   .Select(S => new
                   {

                       S.custId,
                       S.custname,
                       // S.custAccountName,
                       S.lastName,
                       S.company,
                       S.email,
                       S.phone,
                       S.mobile,
                       S.fax,
                       S.address,
                       S.custlevel,
                       S.createDate,
                       S.updateDate,
                       S.custCode,
                       // S.password,
                       S.image,
                       S.notes,
                       S.balance,
                       S.createUserId,
                       S.updateUserId,

                       S.isActive,
                   })
                   .FirstOrDefault();
                        
 return TokenManager.GenerateToken(row);
                    }
            }
                catch
                {
                    return TokenManager.GenerateToken("0");
                }
            }
          
        }

        // add or update location
        [HttpPost]
        [Route("Save")]
        public string Save(string token)//string token//Object
        {

            string message = "";

            token = TokenManager.readToken(HttpContext.Current.Request);
            var strP = TokenManager.GetPrincipal(token);
            if (strP != "0") //invalid authorization
            {
                return TokenManager.GenerateToken(strP);
            }
            else
            {
                string Object = "";
                customers newObject = null;
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "Object")
                    {
                        Object = c.Value.Replace("\\", string.Empty);
                        Object = Object.Trim('"');
                        newObject = JsonConvert.DeserializeObject<customers>(Object, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });
                        break;
                    }
                }
                if (newObject != null)
                {

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
                            var locationEntity = entity.Set<customers>();
                            if (newObject.custId == 0)
                            {
                                newObject.createDate = DateTime.Now;
                                newObject.updateDate = DateTime.Now;
                                newObject.updateUserId = newObject.createUserId;


                                locationEntity.Add(newObject);
                                entity.SaveChanges();
                                message = newObject.custId.ToString();
                            }
                            else
                            {
                                var tmpObject = entity.customers.Where(p => p.custId == newObject.custId).FirstOrDefault();

                                tmpObject.updateDate = DateTime.Now;
                                tmpObject.updateUserId = newObject.updateUserId;
                                tmpObject.custId = newObject.custId;
                                tmpObject.custname = newObject.custname;
                                //   tmpObject.custAccountName=newObject.custAccountName;
                                tmpObject.lastName = newObject.lastName;
                                tmpObject.company = newObject.company;
                                tmpObject.email = newObject.email;
                                tmpObject.phone = newObject.phone;
                                tmpObject.mobile = newObject.mobile;
                                tmpObject.fax = newObject.fax;
                                tmpObject.address = newObject.address;
                                tmpObject.custlevel = newObject.custlevel;
                                tmpObject.createDate = newObject.createDate;

                                tmpObject.custCode = newObject.custCode;
                                //  tmpObject.password=newObject.password;
                                tmpObject.image = newObject.image;
                                tmpObject.notes = newObject.notes;
                                tmpObject.balance = newObject.balance;
                                //  tmpObject.createUserId=newObject.createUserId;
                                tmpObject.updateUserId = newObject.updateUserId;

                                tmpObject.isActive = newObject.isActive;

                                entity.SaveChanges();

                                message = tmpObject.custId.ToString();
                            }
                            //  entity.SaveChanges();
                        }
                        return TokenManager.GenerateToken(message);
                    }
                    catch
                    {
                        return TokenManager.GenerateToken("0");
                    }
                }
                else
                {
                    return TokenManager.GenerateToken("0");
                }


            }



            
        }

        [HttpPost]
        [Route("Delete")]
        public string Delete(string token)//string token//int custId, int userId, bool final
        {

            string message = "";

            token = TokenManager.readToken(HttpContext.Current.Request);
            var strP = TokenManager.GetPrincipal(token);
            if (strP != "0") //invalid authorization
            {
                return TokenManager.GenerateToken(strP);
            }
            else
            {
                int custId = 0;
                int userId = 0;
                bool final = false;

                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "custId")
                    {
                        custId = int.Parse(c.Value);
                    }
                    else if (c.Type == "userId")
                    {
                        userId = int.Parse(c.Value);
                    }
                    else if (c.Type == "final")
                    {
                        final = bool.Parse(c.Value);
                    }

                }

                if (final)
                {
                    try
                    {
                        using (incprogramsdbEntities entity = new incprogramsdbEntities())
                        {
                            customers objectDelete = entity.customers.Find(custId);

                            entity.customers.Remove(objectDelete);
                            message = entity.SaveChanges().ToString();

                           // return message;
                            return TokenManager.GenerateToken(message);
                        }
                    }
                  
                    catch
                    {
                        return TokenManager.GenerateToken("0");
                    }
                }
                else
                {
                    try
                    {
                        using (incprogramsdbEntities entity = new incprogramsdbEntities())
                        {
                            customers objectDelete = entity.customers.Find(custId);

                            objectDelete.isActive = 0;
                            objectDelete.updateUserId = userId;
                            objectDelete.updateDate = DateTime.Now;
                            message = entity.SaveChanges().ToString();

                           
                            return TokenManager.GenerateToken(message.ToString());
                        }
                    }
                    catch
                    {
                        return TokenManager.GenerateToken("0");
                    }
                }
            }

            //var re = Request;
            //var headers = re.Headers;
            //string token = "";
            //int message = 0;
            //if (headers.Contains("APIKey"))
            //{
            //    token = headers.GetValues("APIKey").First();
            //}

            //Validation validation = new Validation();
            //bool valid = validation.CheckApiKey(token);
            //if (valid)
            //{
            //    if (final)
            //    {
            //        try
            //        {
            //            using (incprogramsdbEntities entity = new incprogramsdbEntities())
            //            {
            //                customers objectDelete = entity.customers.Find(custId);

            //                entity.customers.Remove(objectDelete);
            //                message = entity.SaveChanges();

            //                return message.ToString();
            //            }
            //        }
            //        catch
            //        {
            //            return "-1";
            //        }
            //    }
            //    else
            //    {
            //        try
            //        {
            //            using (incprogramsdbEntities entity = new incprogramsdbEntities())
            //            {
            //                customers objectDelete = entity.customers.Find(custId);

            //                objectDelete.isActive = 0;
            //                objectDelete.updateUserId = userId;
            //                objectDelete.updateDate = DateTime.Now;
            //                message = entity.SaveChanges();

            //                return message.ToString(); ;
            //            }
            //        }
            //        catch
            //        {
            //            return "-2";
            //        }
            //    }
            //}
            //else
            //    return "-3";
        }

        [Route("PostCustomerImage")]
        public IHttpActionResult PostCustomerImage()
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
                            var pathCheck = Path.Combine(System.Web.Hosting.HostingEnvironment.MapPath("~\\images\\customer"), imageWithNoExt);
                            var files = Directory.GetFiles(System.Web.Hosting.HostingEnvironment.MapPath("~\\images\\customer"), imageWithNoExt + ".*");
                            if (files.Length > 0)
                            {
                                File.Delete(files[0]);
                            }

                            //Userimage myfolder name where i want to save my image
                            var filePath = Path.Combine(System.Web.Hosting.HostingEnvironment.MapPath("~\\images\\customer"), imageName);
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

            localFilePath = Path.Combine(System.Web.Hosting.HostingEnvironment.MapPath("~\\images\\customer"), imageName);

            HttpResponseMessage response = new HttpResponseMessage(HttpStatusCode.OK);
            response.Content = new StreamContent(new FileStream(localFilePath, FileMode.Open, FileAccess.Read));
            response.Content.Headers.ContentDisposition = new System.Net.Http.Headers.ContentDispositionHeaderValue("attachment");
            response.Content.Headers.ContentDisposition.FileName = imageName;

            return response;
        }
        [HttpPost]
        [Route("UpdateImage")]
        public string  UpdateImage(string token)//customerObject
        {

            string message = "";

            token = TokenManager.readToken(HttpContext.Current.Request);
            var strP = TokenManager.GetPrincipal(token);
            if (strP != "0") //invalid authorization
            {
                return TokenManager.GenerateToken(strP);
            }
            else
            {
                string Object = "";
                customers customerObj = null;
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "Object")
                    {
                        Object = c.Value.Replace("\\", string.Empty);
                        Object = Object.Trim('"');
                        customerObj = JsonConvert.DeserializeObject<customers>(Object, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });
                        break;
                    }
                }
                if (customerObj != null)
                {


                    if (customerObj.updateUserId == 0 || customerObj.updateUserId == null)
                    {
                        Nullable<int> id = null;
                        customerObj.updateUserId = id;
                    }
                    if (customerObj.createUserId == 0 || customerObj.createUserId == null)
                    {
                        Nullable<int> id = null;
                        customerObj.createUserId = id;
                    }
                    try
                    {
                        customers customer;
                        using (incprogramsdbEntities entity = new incprogramsdbEntities())
                        {
                            var customerEntity = entity.Set<customers>();
                            customer = entity.customers.Where(p => p.custId == customerObj.custId).First();
                            customer.image = customerObj.image;
                            entity.SaveChanges();
                        }
                        // return customer.custId;
                        return TokenManager.GenerateToken(customer.custId.ToString());
                    }

                    catch
                    {
                        return TokenManager.GenerateToken("0");
                    }

                }
                else
                {
                    return TokenManager.GenerateToken("0");
                }
            }



            //var re = Request;
            //var headers = re.Headers;
            //string token = "";
            //if (headers.Contains("APIKey"))
            //{
            //    token = headers.GetValues("APIKey").First();
            //}
            //Validation validation = new Validation();
            //bool valid = validation.CheckApiKey(token);

                //customerObject = customerObject.Replace("\\", string.Empty);
                //customerObject = customerObject.Trim('"');

                //customers customerObj = JsonConvert.DeserializeObject<customers>(customerObject, new JsonSerializerSettings { DateParseHandling = DateParseHandling.None });
                //if (customerObj.updateUserId == 0 || customerObj.updateUserId == null)
                //{
                //    Nullable<int> id = null;
                //    customerObj.updateUserId = id;
                //}
                //if (customerObj.createUserId == 0 || customerObj.createUserId == null)
                //{
                //    Nullable<int> id = null;
                //    customerObj.createUserId = id;
                //}
                //if (valid)
                //{
                //    try
                //    {
                //        customers customer;
                //        using (incprogramsdbEntities entity = new incprogramsdbEntities())
                //        {
                //            var customerEntity = entity.Set<customers>();
                //            customer = entity.customers.Where(p => p.custId == customerObj.custId).First();
                //            customer.image = customerObj.image;
                //            entity.SaveChanges();
                //        }
                //        return customer.custId;
                //    }

                //    catch
                //    {
                //        return 0;
                //    }
                //}
                //else
                //    return 0;
            }


        [HttpPost]
        [Route("GetLastNumOfCode")]
        public string GetLastNumOfCode(string token)//tring type
        {

            bool canDelete = false;
            token = TokenManager.readToken(HttpContext.Current.Request);
            var strP = TokenManager.GetPrincipal(token);
            if (strP != "0") //invalid authorization
            {
                return TokenManager.GenerateToken(strP);
            }
            else
            {
                string type = "";
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "type")
                    {
                        type = c.Value;
                    }


                }

                try
                {

                    List<string> numberList;
                    int lastNum = 0;
                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        numberList = entity.customers.Where(b => b.custCode.Contains(type + "-")).Select(b => b.custCode).ToList();

                        for (int i = 0; i < numberList.Count; i++)
                        {
                            string code = numberList[i];
                            string s = code.Substring(code.LastIndexOf("-") + 1);
                            numberList[i] = s;
                        }
                        if (numberList.Count > 0)
                        {
                            numberList.Sort();
                            lastNum = int.Parse(numberList[numberList.Count - 1]);
                        }
                    }

                    return TokenManager.GenerateToken(lastNum);
                }
                catch
                {
                    return TokenManager.GenerateToken("0");
                }
            }
                //var re = Request;
                //var headers = re.Headers;
                //string token = "";
                //if (headers.Contains("APIKey"))
                //{
                //    token = headers.GetValues("APIKey").First();
                //}
                //Validation validation = new Validation();
                //bool valid = validation.CheckApiKey(token);

                //if (valid) // APIKey is valid
                //{
                //    List<string> numberList;
                //    int lastNum = 0;
                //    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                //    {
                //        numberList = entity.customers.Where(b => b.custCode.Contains(type + "-")).Select(b => b.custCode).ToList();

                //        for (int i = 0; i < numberList.Count; i++)
                //        {
                //            string code = numberList[i];
                //            string s = code.Substring(code.LastIndexOf("-") + 1);
                //            numberList[i] = s;
                //        }
                //        if (numberList.Count > 0)
                //        {
                //            numberList.Sort();
                //            lastNum = int.Parse(numberList[numberList.Count - 1]);
                //        }
                //    }
                //    return Ok(lastNum);
                //}
                //return NotFound();
            }


    }
}