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


    [RoutePrefix("api/programs")]

    public class programsController : ApiController

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
                    var List = (from S in entity.programs
                                select new programsModel()
                                {
                                    programId = S.programId,
                                    name = S.name,
                                    details = S.details,
                                    notes = S.notes,
                                    isActive = S.isActive,
                                    createDate = S.createDate,
                                    updateDate = S.updateDate,
                                    programCode = S.programCode,
                                    createUserId = S.createUserId,
                                    updateUserId = S.updateUserId,
                                  


                                }).ToList();
                    /*

      

                    */

                    if (List.Count > 0)
                    {
                        for (int i = 0; i < List.Count; i++)
                        {
                            if (List[i].isActive == 1)
                            {
                                int programId = (int)List[i].programId;
                                var itemsI = entity.packages.Where(x => x.programId == programId).Select(b => new { b.programId }).FirstOrDefault();

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
        public IHttpActionResult GetByID(int programId)
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
                    var row = entity.programs
                   .Where(u => u.programId == programId)
                   .Select(S => new
                   {

                       S.programId,
                       S.name,
                       S.details,
                       S.notes,
                       S.isActive,
                       S.createDate,
                       S.updateDate,
                       S.programCode,
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
                programs newObject = JsonConvert.DeserializeObject<programs>(Object, new JsonSerializerSettings { DateParseHandling = DateParseHandling.None });
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
                        var locationEntity = entity.Set<programs>();
                        if (newObject.programId == 0)
                        {
                            newObject.createDate = DateTime.Now;
                            newObject.updateDate = DateTime.Now;
                            newObject.updateUserId = newObject.createUserId;


                            locationEntity.Add(newObject);
                            entity.SaveChanges();
                            message = newObject.programId.ToString();
                        }
                        else
                        {
                            var tmpObject = entity.programs.Where(p => p.programId == newObject.programId).FirstOrDefault();

                            tmpObject.updateDate = DateTime.Now;
                            tmpObject.programId = newObject.programId;
                            tmpObject.name = newObject.name;
                            tmpObject.details = newObject.details;
                            tmpObject.notes = newObject.notes;
                            tmpObject.isActive = newObject.isActive;
                        //    tmpObject.createDate = newObject.createDate;
                          
                            tmpObject.programCode = newObject.programCode;
                           // tmpObject.createUserId = newObject.createUserId;
                            tmpObject.updateUserId = newObject.updateUserId;
                          
                           


                            entity.SaveChanges();

                            message = tmpObject.programId.ToString();
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
        public string Delete(int programId, int userId, bool final)
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
                            programs objectDelete = entity.programs.Find(programId);

                            entity.programs.Remove(objectDelete);
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
                            programs objectDelete = entity.programs.Find(programId);

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