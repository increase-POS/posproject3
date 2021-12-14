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


    [RoutePrefix("api/agentCustomer")]

    public class agentCustomerController : ApiController

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
                        var List = (from S in entity.agentCustomer
                                    join A in entity.users on S.agentId equals A.userId
                                    join P in entity.customers on S.customerId equals P.custId
                                    select new agentCustomerModel()
                                    {
                                        agentCustomerId = S.agentCustomerId,
                                        agentId = S.agentId,
                                        customerId = S.customerId,
                                        notes = S.notes,
                                        createUserId = S.createUserId,
                                        updateUserId = S.updateUserId,
                                        createDate = S.createDate,
                                        updateDate = S.updateDate,

                                    }).ToList();
                 
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
                int agentCustomerId = 0;


                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "agentCustomerId")
                    {
                        agentCustomerId = int.Parse(c.Value);
                    }


                }
                try
                {
                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        var row = entity.agentCustomer
                       .Where(u => u.agentCustomerId == agentCustomerId)
                       .Select(S => new
                       {

                           S.agentCustomerId,
                           S.agentId,
                           S.customerId,
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
                agentCustomer newObject = null;
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "Object")
                    {
                        Object = c.Value.Replace("\\", string.Empty);
                        Object = Object.Trim('"');
                        newObject = JsonConvert.DeserializeObject<agentCustomer>(Object, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });
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
                    if (newObject.customerId == 0 || newObject.customerId == null)
                    {
                        Nullable<int> id = null;
                        newObject.customerId = id;
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
                            var locationEntity = entity.Set<agentCustomer>();
                            if (newObject.agentCustomerId == 0)
                            {
                                newObject.createDate = DateTime.Now;
                                newObject.updateDate = DateTime.Now;
                                newObject.updateUserId = newObject.createUserId;


                                locationEntity.Add(newObject);
                                entity.SaveChanges();

                                // get packageuser code

                              

                                message = newObject.agentCustomerId.ToString();

                            }
                            else
                            {
                                var tmpObject = entity.agentCustomer.Where(p => p.agentCustomerId == newObject.agentCustomerId).FirstOrDefault();

                                tmpObject.updateDate = DateTime.Now;
                                tmpObject.agentCustomerId = newObject.agentCustomerId;
                                tmpObject.agentId = newObject.agentId;
                                tmpObject.customerId = newObject.customerId;
                                tmpObject.notes = newObject.notes;
                           
                                tmpObject.updateUserId = newObject.updateUserId;
                                tmpObject.createDate = newObject.createDate;
                           






                                entity.SaveChanges();

                                message = tmpObject.agentCustomerId.ToString();
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
        public string Delete(string token)//int agentCustomerId, int userId, bool final
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
                int agentCustomerId = 0;
                //int userId = 0;
                //bool final = false;

                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "agentCustomerId")
                    {
                        agentCustomerId = int.Parse(c.Value);
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
                            agentCustomer objectDelete = entity.agentCustomer.Find(agentCustomerId);

                            entity.agentCustomer.Remove(objectDelete);
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
                int userId = 0;
                string Object = "";
                List<agentCustomer> newList = new List<agentCustomer>();
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "userId")
                    {
                        userId = int.Parse(c.Value);
                    }
                    else if (c.Type == "newlistobject")
                    {
                        Object = c.Value.Replace("\\", string.Empty);
                        Object = Object.Trim('"');
                        newList = JsonConvert.DeserializeObject<List<agentCustomer>>(Object, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });
                    }
                }

                using (incprogramsdbEntities entity = new incprogramsdbEntities())
                {
                    try
                    {
                
                        List<agentCustomer> oldlist = entity.agentCustomer.Where(x => x.agentId == userId).ToList();
                        entity.agentCustomer.RemoveRange(oldlist).ToString();

                       entity.SaveChanges().ToString();
                        foreach (agentCustomer package in newList)
                        {
                            package.createDate = DateTime.Now;
                            package.updateDate = DateTime.Now;
                            entity.agentCustomer.Add(package);
                        }
                        entity.SaveChanges();
                        message = "1";
                    }
                    catch 
                    {
                        message = "0";
                        return TokenManager.GenerateToken(message);
                    }
                    return TokenManager.GenerateToken(message);
                }
            }
        }


    }
}