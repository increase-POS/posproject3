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


    [RoutePrefix("api/posSerials")]

    public class posSerialsController : ApiController

    {
        // GET api/<controller>
        [HttpGet]
        [Route("GetAll")]
        public IHttpActionResult GetAll()
        {
            var re = Request;
            var headers = re.Headers;
            string token = "";
            bool canDelete = true;

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
                    var List = (from S in entity.posSerials
                                select new posSerialsModel()
                                {
                                    serialId = S.serialId,
                                    serial = S.serial,
                                    posDeviceCode = S.posDeviceCode,
                                    packageUserId = S.packageUserId,
                                    isBooked = S.isBooked,
                                    isActive = S.isActive,
                                    createDate = S.createDate,
                                    updateDate = S.updateDate,
                                    apikey = S.apikey,
                                    createUserId = S.createUserId,
                                    updateUserId = S.updateUserId,
                                    canDelete = true,



                                }).ToList();
                    /*

                    */
                    /*
                    if (List.Count > 0)
                    {
                        for (int i = 0; i < List.Count; i++)
                        {
                            if (List[i].isActive == 1)
                            {
                                int serialId = (int)List[i].serialId;
                                var itemsI = entity.packageUser.Where(x => x.customerId == serialId).Select(b => new { b.customerId }).FirstOrDefault();

                                if ((itemsI is null))
                                    canDelete = true;
                            }
                            List[i].canDelete = canDelete;
                        }
                    }
                    */

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
        public IHttpActionResult GetByID(int serialId)
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
                    var row = entity.posSerials
                   .Where(u => u.serialId == serialId)
                   .Select(S => new
                   {
                       S.serialId,
                       S.serial,
                       S.posDeviceCode,
                       S.packageUserId,
                       S.isBooked,
                       S.isActive,
                       S.createDate,
                       S.updateDate,
                       S.apikey,
                       S.createUserId,
                       S.updateUserId,
                     

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
                posSerials newObject = JsonConvert.DeserializeObject<posSerials>(Object, new JsonSerializerSettings { DateParseHandling = DateParseHandling.None });
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
                if (newObject.packageUserId == 0 || newObject.packageUserId == null)
                {
                    Nullable<int> id = null;
                    newObject.packageUserId = id;
                }
                try
                {
                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        var locationEntity = entity.Set<posSerials>();
                        if (newObject.serialId == 0)
                        {
                            newObject.createDate = DateTime.Now;
                            newObject.updateDate = DateTime.Now;
                            newObject.updateUserId = newObject.createUserId;


                            locationEntity.Add(newObject);
                            entity.SaveChanges();
                            message = newObject.serialId.ToString();
                        }
                        else
                        {
                            var tmpObject = entity.posSerials.Where(p => p.serialId == newObject.serialId).FirstOrDefault();

                            tmpObject.updateDate = DateTime.Now;
                            tmpObject.serialId = newObject.serialId;
                            tmpObject.serial = newObject.serial;
                            tmpObject.posDeviceCode = newObject.posDeviceCode;
                            tmpObject.packageUserId = newObject.packageUserId;
                            tmpObject.isBooked = newObject.isBooked;
                            tmpObject.isActive = newObject.isActive;
                        //    tmpObject.createDate = newObject.createDate;
                          
                            tmpObject.apikey = newObject.apikey;
                          //  tmpObject.createUserId = newObject.createUserId;
                            tmpObject.updateUserId = newObject.updateUserId;
                    


                            entity.SaveChanges();

                            message = tmpObject.serialId.ToString();
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
        public string Delete(int serialId, int userId, bool final)
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
                            posSerials objectDelete = entity.posSerials.Find(serialId);

                            entity.posSerials.Remove(objectDelete);
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
                            posSerials objectDelete = entity.posSerials.Find(serialId);

                            objectDelete.isActive = 0;
                            objectDelete.updateUserId = userId;
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