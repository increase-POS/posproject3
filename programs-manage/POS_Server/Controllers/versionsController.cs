using Newtonsoft.Json;
using Programs_Server;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Programs_Server.Models;

using System.Web;


using Programs_Server.Models.VM;
using System.Security.Claims;
using Newtonsoft.Json.Converters;

namespace Programs_Server.Controllers
{


    [RoutePrefix("api/versions")]

    public class versionsController : ApiController

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
                                        programName = S.programs.name,

                                        notes = S.notes,


                                    }).ToList();


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

                        return TokenManager.GenerateToken(List);

                    }
                    }
                catch
                {
                    return TokenManager.GenerateToken("0");
                }
            }




            //var re = Request;
            //var headers = re.Headers;
            //string token = "";
            //bool canDelete = false;

            //if (headers.Contains("APIKey"))
            //{
            //    token = headers.GetValues("APIKey").First();
            //}

            //Validation validation = new Validation();
            //bool valid = validation.CheckApiKey(token);

            //if (valid) // APIKey is valid
            //{
            //    using (incprogramsdbEntities entity = new incprogramsdbEntities())
            //    {
            //        var List = (from S in entity.versions
            //                    select new versionsModel()
            //                    {
            //                        verId = S.verId,
            //                        name = S.name,
            //                        details = S.details,
            //                        isActive = S.isActive,
            //                        versionscode = S.versionscode,
            //                        createDate = S.createDate,
            //                        updateDate = S.updateDate,
            //                        createUserId = S.createUserId,
            //                        updateUserId = S.updateUserId,
            //                        programId = S.programId,
            //                        programName=S.programs.name,

            //                        notes =S.notes,


            //                    }).ToList();
            //        /*


            //        */

            //        if (List.Count > 0)
            //        {
            //            for (int i = 0; i < List.Count; i++)
            //            {
            //                if (List[i].isActive == 1)
            //                {
            //                    int verId = (int)List[i].verId;
            //                    var itemsI = entity.packages.Where(x => x.verId == verId).Select(b => new { b.verId }).FirstOrDefault();

            //                    if ((itemsI is null))
            //                        canDelete = true;
            //                }
            //                List[i].canDelete = canDelete;
            //            }
            //        }

            //        if (List == null)
            //            return NotFound();
            //        else
            //            return Ok(List);
            //    }
            //}
            ////else
            //return NotFound();
        }

        // GET api/<controller>
        [HttpPost]
        [Route("GetByID")]
        public string GetByID(string token)//int verId
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
                int verId = 0;


                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "verId")
                    {
                        verId = int.Parse(c.Value);
                    }


                }
                try
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

                    
                        return TokenManager.GenerateToken(row);
                    }

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

            //if (valid)
            //{
            //    using (incprogramsdbEntities entity = new incprogramsdbEntities())
            //    {
            //        var row = entity.versions
            //       .Where(u => u.verId == verId)
            //       .Select(S => new
            //       {
            //           S.verId,
            //           S.name,
            //           S.details,
            //           S.isActive,
            //           S.versionscode,
            //           S.createDate,
            //           S.updateDate,
            //           S.createUserId,
            //           S.updateUserId,
            //           S.programId,
            //           programName = S.programs.name,
            //           S.notes,
            //       })
            //       .FirstOrDefault();

            //        if (row == null)
            //            return NotFound();
            //        else
            //            return Ok(row);
            //    }
            //}
            //else
            //    return NotFound();
        }

        public versions GetByID(int verId)//int verId
        {


            versions ver =new versions();


         
                try
                {
                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                    List<versions> List = entity.versions.ToList();
                    ver= List.Where(u => u.verId == verId && u.isActive==1)
                       .Select(S => new versions
                       {
                           verId=S.verId,
                           name=S.name,
                           details= S.details,
                           isActive= S.isActive,
                           versionscode= S.versionscode,
                           createDate=  S.createDate,
                           updateDate= S.updateDate,
                           createUserId=  S.createUserId,
                           updateUserId=   S.updateUserId,
                           programId=   S.programId,

                           notes= S.notes,
                       })
                       .FirstOrDefault();


                        return ver;
                    }

                }
                catch
                {
                return ver;
                }

        
     
        }


        // add or update location
        [HttpPost]
        [Route("Save")]
        public string Save(string token)//string Object
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
                versions newObject = null;
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "Object")
                    {
                        Object = c.Value.Replace("\\", string.Empty);
                        Object = Object.Trim('"');
                        newObject = JsonConvert.DeserializeObject<versions>(Object, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });
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

            //var re = Request;
            //var headers = re.Headers;
            //string token = "";
            //string message = "";
            //if (headers.Contains("APIKey"))
            //{
            //    token = headers.GetValues("APIKey").First();
            //}
            //Validation validation = new Validation();
            //bool valid = validation.CheckApiKey(token);

            //if (valid)
            //{
            //    Object = Object.Replace("\\", string.Empty);
            //    Object = Object.Trim('"');
            //    versions newObject = JsonConvert.DeserializeObject<versions>(Object, new JsonSerializerSettings { DateParseHandling = DateParseHandling.None });
            //    if (newObject.updateUserId == 0 || newObject.updateUserId == null)
            //    {
            //        Nullable<int> id = null;
            //        newObject.updateUserId = id;
            //    }
            //    if (newObject.createUserId == 0 || newObject.createUserId == null)
            //    {
            //        Nullable<int> id = null;
            //        newObject.createUserId = id;
            //    }

            //    try
            //    {
            //        using (incprogramsdbEntities entity = new incprogramsdbEntities())
            //        {
            //            var locationEntity = entity.Set<versions>();
            //            if (newObject.verId == 0)
            //            {
            //                newObject.createDate = DateTime.Now;
            //                newObject.updateDate = DateTime.Now;
            //                newObject.updateUserId = newObject.createUserId;


            //                locationEntity.Add(newObject);
            //                entity.SaveChanges();
            //                message = newObject.verId.ToString();
            //            }
            //            else
            //            {
            //                var tmpObject = entity.versions.Where(p => p.verId == newObject.verId).FirstOrDefault();

            //                tmpObject.updateDate = DateTime.Now;
            //                tmpObject.verId = newObject.verId;
            //                tmpObject.name = newObject.name;
            //                tmpObject.details = newObject.details;
            //                tmpObject.isActive = newObject.isActive;
            //                tmpObject.versionscode = newObject.versionscode;
            //             //   tmpObject.createDate = newObject.createDate;

            //               // tmpObject.createUserId = newObject.createUserId;
            //                tmpObject.updateUserId = newObject.updateUserId;

            //                tmpObject.programId = newObject.programId;
            //                tmpObject.notes = newObject.notes;
            //                entity.SaveChanges();

            //                message = tmpObject.verId.ToString();
            //            }
            //            //  entity.SaveChanges();
            //        }
            //    }
            //    catch
            //    {
            //        message = "-1";
            //    }
            //}
            //return message;
        }

        [HttpPost]
        [Route("Delete")]
        public string Delete(string token)//int verId, int userId, bool final
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
                int verId = 0;
                int userId = 0;
                bool final = false;

                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "verId")
                    {
                        verId = int.Parse(c.Value);
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
                            versions objectDelete = entity.versions.Find(verId);

                            entity.versions.Remove(objectDelete);
                            message = entity.SaveChanges().ToString();

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
                            versions objectDelete = entity.versions.Find(verId);

                            objectDelete.isActive = 0;
                            objectDelete.updateUserId = userId;
                            objectDelete.updateDate = DateTime.Now;
                            message = entity.SaveChanges().ToString();

                            return TokenManager.GenerateToken(message);
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
        //                versions objectDelete = entity.versions.Find(verId);

        //                entity.versions.Remove(objectDelete);
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
        //                versions objectDelete = entity.versions.Find(verId);

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



        [HttpPost]
        [Route("GetLastNumOfCode")]
        public string GetLastNumOfCode(string token)//int programId
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
                int programId = 0;
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "programId")
                    {
                        programId = int.Parse(c.Value);
                    }


                }

                try
                {

                    List<string> numberList;
                    int lastNum = 0;
                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        numberList = entity.versions.Where(b => b.programId == programId).Select(b => b.versionscode).ToList();

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
            //        numberList = entity.versions.Where(b => b.programId== programId).Select(b => b.versionscode).ToList();

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