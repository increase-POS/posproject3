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


    [RoutePrefix("api/versions")]

    public class versionsController : ApiController

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
                    var List = (from S in entity.versions
                                select new versionsModel()
                                {
                                    verId = S.verId,
                                    name = S.name,
                                    details = S.details,
                                    isActive = S.isActive,
                                    versionscode = S.versionscode,
                                    createDate = S.createDate,
                                    updateDate = S.updateDate,
                                    createUserId = S.createUserId,
                                    updateUserId = S.updateUserId,
                                    programId = S.programId,
                                    programName=S.programs.name,

                                    notes =S.notes,


                                }).ToList();
                    /*


                    */

                    if (List.Count > 0)
                    {
                        for (int i = 0; i < List.Count; i++)
                        {
                            if (List[i].isActive == 1)
                            {
                                int verId = (int)List[i].verId;
                                var itemsI = entity.packages.Where(x => x.verId == verId).Select(b => new { b.verId }).FirstOrDefault();

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
        public IHttpActionResult GetByID(int verId)
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
                    var row = entity.versions
                   .Where(u => u.verId == verId)
                   .Select(S => new
                   {
                       S.verId,
                       S.name,
                       S.details,
                       S.isActive,
                       S.versionscode,
                       S.createDate,
                       S.updateDate,
                       S.createUserId,
                       S.updateUserId,
                       S.programId,
                       programName = S.programs.name,
                       S.notes,
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
                versions newObject = JsonConvert.DeserializeObject<versions>(Object, new JsonSerializerSettings { DateParseHandling = DateParseHandling.None });
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
                        var locationEntity = entity.Set<versions>();
                        if (newObject.verId == 0)
                        {
                            newObject.createDate = DateTime.Now;
                            newObject.updateDate = DateTime.Now;
                            newObject.updateUserId = newObject.createUserId;


                            locationEntity.Add(newObject);
                            entity.SaveChanges();
                            message = newObject.verId.ToString();
                        }
                        else
                        {
                            var tmpObject = entity.versions.Where(p => p.verId == newObject.verId).FirstOrDefault();

                            tmpObject.updateDate = DateTime.Now;
                            tmpObject.verId = newObject.verId;
                            tmpObject.name = newObject.name;
                            tmpObject.details = newObject.details;
                            tmpObject.isActive = newObject.isActive;
                            tmpObject.versionscode = newObject.versionscode;
                         //   tmpObject.createDate = newObject.createDate;
                           
                           // tmpObject.createUserId = newObject.createUserId;
                            tmpObject.updateUserId = newObject.updateUserId;

                            tmpObject.programId = newObject.programId;
                            tmpObject.notes = newObject.notes;
                            entity.SaveChanges();

                            message = tmpObject.verId.ToString();
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
        public string Delete(int verId, int userId, bool final)
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
                            versions objectDelete = entity.versions.Find(verId);

                            entity.versions.Remove(objectDelete);
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
                            versions objectDelete = entity.versions.Find(verId);

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