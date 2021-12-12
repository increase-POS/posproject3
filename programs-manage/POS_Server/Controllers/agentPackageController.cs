using Newtonsoft.Json;
using Programs_Server;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Programs_Server.Models;
using Programs_Server.Classes;

using Programs_Server.Models.VM;
using System.Security.Claims;
using Newtonsoft.Json.Converters;
using System.Web;

namespace Programs_Server.Controllers
{


    [RoutePrefix("api/agentPackage")]

    public class agentPackageController : ApiController

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
                        var List = (from S in entity.agentPackage
                                    join A in entity.users on S.agentId equals A.userId
                                    join P in entity.packages on S.packageId equals P.packageId
                                    select new agentPackageModel()
                                    {


                                        agentPackageId = S.agentPackageId,
                                        agentId = S.agentId,
                                        packageId = S.packageId,
                                        notes = S.notes,
                                        createUserId = S.createUserId,
                                        updateUserId = S.updateUserId,
                                        createDate = S.createDate,
                                        updateDate = S.updateDate,
                                    }).ToList();
                        /*
          
agentPackageId
agentId
packageId
notes
createUserId
updateUserId
createDate
updateDate

                        */

                        //if (List.Count > 0)
                        //{
                        //    for (int i = 0; i < List.Count; i++)
                        //    {
                        //        if (List[i].isActive == 1)
                        //        {
                        //            int packageUserId = (int)List[i].packageUserId;
                        //            var itemsI = entity.posSerials.Where(x => x.packageUserId == packageUserId).Select(b => new { b.packageUserId }).FirstOrDefault();

                        //            if ((itemsI is null))
                        //                canDelete = true;
                        //        }
                        //        List[i].canDelete = canDelete;
                        //    }
                        //}
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
        public string GetByID(string token)//int packageUserId
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
                int agentPackageId = 0;


                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "agentPackageId")
                    {
                        agentPackageId = int.Parse(c.Value);
                    }


                }
                try
                {
                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        var row = entity.agentPackage
                       .Where(u => u.agentPackageId == agentPackageId)
                       .Select(S => new
                       {

                           S.agentPackageId,
                           S.agentId,
                           S.packageId,
                           S.notes,
                           S.createUserId,
                           S.updateUserId,
                           S.createDate,
                           S.updateDate,



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
#pragma warning disable CS1591 // Missing XML comment for publicly visible type or member
        public string Save(string token)//string Object
#pragma warning restore CS1591 // Missing XML comment for publicly visible type or member
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
                agentPackage newObject = null;
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "Object")
                    {
                        Object = c.Value.Replace("\\", string.Empty);
                        Object = Object.Trim('"');
                        newObject = JsonConvert.DeserializeObject<agentPackage>(Object, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });
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
                    if (newObject.packageId == 0 || newObject.packageId == null)
                    {
                        Nullable<int> id = null;
                        newObject.packageId = id;
                    }
                    if (newObject.agentId == 0 || newObject.agentId == null)
                    {
                        Nullable<int> id = null;
                        newObject.agentId = id;
                    }
                   



                    try
                    {

                        using (incprogramsdbEntities entity = new incprogramsdbEntities())
                        {
                            var locationEntity = entity.Set<agentPackage>();
                            if (newObject.agentPackageId == 0)
                            {
                                newObject.createDate = DateTime.Now;
                                newObject.updateDate = DateTime.Now;
                                newObject.updateUserId = newObject.createUserId;


                                locationEntity.Add(newObject);
                                entity.SaveChanges();

                                // get packageuser code

                              

                                message = newObject.agentPackageId.ToString();

                            }
                            else
                            {
                                var tmpObject = entity.agentPackage.Where(p => p.agentPackageId == newObject.agentPackageId).FirstOrDefault();

                                tmpObject.updateDate = DateTime.Now;
                                tmpObject.agentPackageId = newObject.agentPackageId;
                                tmpObject.agentId = newObject.agentId;
                                tmpObject.packageId = newObject.packageId;
                                tmpObject.notes = newObject.notes;
                             
                                tmpObject.updateUserId = newObject.updateUserId;
                            
                            

                       

                                entity.SaveChanges();

                                message = tmpObject.agentPackageId.ToString();
                            }
                            //  entity.SaveChanges();

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
                    return TokenManager.GenerateToken("0");
                }

            }


        }


        [HttpPost]
        [Route("Delete")]
        public string Delete(string token)//int agentPackageId, int userId, bool final
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
                int agentPackageId = 0;
                //int userId = 0;
                //bool final = false;

                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "agentPackageId")
                    {
                        agentPackageId = int.Parse(c.Value);
                    }
                    //else if (c.Type == "userId")
                    //{
                    //    userId = int.Parse(c.Value);
                    //}
                

                }

                

                    try
                    {
                        using (incprogramsdbEntities entity = new incprogramsdbEntities())
                        {
                            agentPackage objectDelete = entity.agentPackage.Find(agentPackageId);

                            entity.agentPackage.Remove(objectDelete);
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



        [HttpPost]
        [Route("saveNewList")]
        public string saveNewList(string token)//string Object
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
                int userID = 0;
                string Object = "";
                List<agentPackage> newList = new List<agentPackage>();
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "userID")
                    {
                        userID = int.Parse(c.Value);
                    }
                    else if (c.Type == "newList")
                    {
                        Object = c.Value.Replace("\\", string.Empty);
                        Object = Object.Trim('"');
                        newList = JsonConvert.DeserializeObject<List<agentPackage>>(Object, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });
                    }
                }
                using (incprogramsdbEntities entity = new incprogramsdbEntities())
                {
                    try
                    {
                        var packages = entity.agentPackage.Where(x => x.agentId == userID).ToList();
                        entity.agentPackage.RemoveRange(packages);
                        entity.SaveChanges();
                        foreach (agentPackage package in newList)
                        {
                            package.createDate = DateTime.Now;
                            package.updateDate = DateTime.Now;
                            entity.agentPackage.Add(package);
                        }
                        entity.SaveChanges();
                        message = "1";
                    }
                    catch
                    {
                        message = "0";
                    }
                    return TokenManager.GenerateToken(message);
                }
            }
        }


    }
}