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


    [RoutePrefix("api/errorController")]

    public class errorController : ApiController

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
                    var List = (from S in entity.error
                                select new errorModel()
                                {

                                    errorId = S.errorId,
                                    num = S.num,
                                    msg = S.msg,
                                    stackTrace = S.stackTrace,
                                    targetSite = S.targetSite,
                                    createDate = S.createDate,
                                    createUserId = S.createUserId,


                                }).ToList();
                    /*
                   public int errorId { get; set; }
        public string num { get; set; }
        public string msg { get; set; }
        public string stackTrace { get; set; }
        public string targetSite { get; set; }
        public Nullable<System.DateTime> createDate { get; set; }
        public Nullable<int> createUserId { get; set; }
                    

errorId
num
msg
stackTrace
targetSite
createDate
createUserId


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
        public IHttpActionResult GetByID(int errorId)
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
                    var row = entity.error
                   .Where(u => u.errorId == errorId)
                   .Select(S => new
                   {

                       S.errorId,
                       S.num,
                       S.msg,
                       S.stackTrace,
                       S.targetSite,
                       S.createDate,
                       S.createUserId,


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
                error newObject = JsonConvert.DeserializeObject<error>(Object, new JsonSerializerSettings { DateParseHandling = DateParseHandling.None });
             
                if (newObject.createUserId == 0 || newObject.createUserId == null)
                {
                    Nullable<int> id = null;
                    newObject.createUserId = id;
                }
             

     

                try
                {
                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        var locationEntity = entity.Set<error>();
                        if (newObject.errorId == 0)
                        {
                            newObject.createDate = DateTime.Now;
                          


                            locationEntity.Add(newObject);
                            entity.SaveChanges();
                            message = newObject.errorId.ToString();
                        }
                        else
                        {
                            var tmpObject = entity.error.Where(p => p.errorId == newObject.errorId).FirstOrDefault();

                          
                            tmpObject.errorId = newObject.errorId;
                            tmpObject.num = newObject.num;
                            tmpObject.msg = newObject.msg;
                            tmpObject.stackTrace = newObject.stackTrace;
                            tmpObject.targetSite = newObject.targetSite;
                          




                            entity.SaveChanges();

                            message = tmpObject.errorId.ToString();
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
        public string Delete(int errorId, int userId, bool final)
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
               
                    try
                    {
                        using (incprogramsdbEntities entity = new incprogramsdbEntities())
                        {
                            error objectDelete = entity.error.Find(errorId);

                            entity.error.Remove(objectDelete);
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
                return "-3";
        }



    }
}