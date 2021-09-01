using Newtonsoft.Json;
using Programs_Server;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Programs_Server.Models;

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
                                    agentCode = S.agentCode,
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
                       S.agentCode,
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
                         
                            tmpObject.agentCode = newObject.agentCode;
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



    }
}