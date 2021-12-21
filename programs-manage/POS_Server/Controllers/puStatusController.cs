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


    [RoutePrefix("api/puStatus")]

    public class puStatusController : ApiController

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
                        var List = (from S in entity.puStatus
                                  
                                    select new puStatusModel()
                                    {
                                        stateId = S.stateId,
                                        isActive = S.isActive,
                                        packageUserId = S.packageUserId,
                                        createDate = S.createDate,
                                        updateDate = S.updateDate,
                                        createUserId = S.createUserId,
                                        updateUserId = S.updateUserId,
                                        notes = S.notes,


                                    }).ToList();
                        /*
          


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
                int stateId = 0;


                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "stateId")
                    {
                        stateId = int.Parse(c.Value);
                    }


                }
                try
                {
                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        var row = entity.puStatus
                       .Where(u => u.stateId == stateId)
                       .Select(S => new
                       {
                           S.stateId,
                           S.isActive,
                           S.packageUserId,
                           S.createDate,
                           S.updateDate,
                           S.createUserId,
                           S.updateUserId,
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
                puStatus newObject = null;
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "Object")
                    {
                        Object = c.Value.Replace("\\", string.Empty);
                        Object = Object.Trim('"');
                        newObject = JsonConvert.DeserializeObject<puStatus>(Object, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });
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
                    if (newObject.packageUserId == 0 || newObject.packageUserId == null)
                    {
                        Nullable<int> id = null;
                        newObject.packageUserId = id;
                    }
                   
                   



                    try
                    {

                        using (incprogramsdbEntities entity = new incprogramsdbEntities())
                        {
                            var locationEntity = entity.Set<puStatus>();
                            if (newObject.stateId == 0)
                            {
                                newObject.createDate = DateTime.Now;
                                newObject.updateDate = DateTime.Now;
                                newObject.updateUserId = newObject.createUserId;


                                locationEntity.Add(newObject);
                                entity.SaveChanges();

                                // get packageuser code

                              

                                message = newObject.stateId.ToString();

                            }
                            else
                            {
                                var tmpObject = entity.puStatus.Where(p => p.stateId == newObject.stateId).FirstOrDefault();

                                tmpObject.updateDate = DateTime.Now;

                                tmpObject.stateId = newObject.stateId;
                                tmpObject.isActive = newObject.isActive;
                                tmpObject.packageUserId = newObject.packageUserId;
                        
                               
                           
                                tmpObject.updateUserId = newObject.updateUserId;
                                tmpObject.notes = newObject.notes;


                                tmpObject.notes = newObject.notes;






                                entity.SaveChanges();

                                message = tmpObject.stateId.ToString();
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

        public int Save(puStatus newObject)//string Object
#pragma warning restore CS1591 // Missing XML comment for publicly visible type or member
        {


           int message =0;

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
                    if (newObject.packageUserId == 0 || newObject.packageUserId == null)
                    {
                        Nullable<int> id = null;
                        newObject.packageUserId = id;
                    }
              
                    try
                    {

                        using (incprogramsdbEntities entity = new incprogramsdbEntities())
                        {
                            var locationEntity = entity.Set<puStatus>();
                            if (newObject.stateId == 0)
                            {
                                newObject.createDate = DateTime.Now;
                                newObject.updateDate = DateTime.Now;
                                newObject.updateUserId = newObject.createUserId;

                                locationEntity.Add(newObject);
                                entity.SaveChanges();

                          

                                message = newObject.stateId;

                            }
                            else
                            {
                                var tmpObject = entity.puStatus.Where(p => p.stateId == newObject.stateId).FirstOrDefault();

                            tmpObject.updateDate = DateTime.Now;

                          //  tmpObject.stateId = newObject.stateId;
                            tmpObject.isActive = newObject.isActive;
                            tmpObject.packageUserId = newObject.packageUserId;



                            tmpObject.updateUserId = newObject.updateUserId;
                            tmpObject.notes = newObject.notes;


                            tmpObject.notes = newObject.notes;


                            entity.SaveChanges();

                                message = tmpObject.stateId ;
                            }
                            //  entity.SaveChanges();

                            return  message ;
                        }

                    }
                    catch
                    {
                        return  0 ;
                    }
                }
                else
                {
                    return  0 ;
                }


        }

        [HttpPost]
        [Route("Delete")]
        public string Delete(string token)//int stateId, int userId, bool final
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
                int stateId = 0;
                //int userId = 0;
                //bool final = false;

                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "stateId")
                    {
                        stateId = int.Parse(c.Value);
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
                            puStatus objectDelete = entity.puStatus.Find(stateId);

                            entity.puStatus.Remove(objectDelete);
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



      

    }
}