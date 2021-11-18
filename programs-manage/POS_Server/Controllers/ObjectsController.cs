using Newtonsoft.Json;
using Programs_Server.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Programs_Server.Models.VM;
using System.Security.Claims;
using System.Web;

using Newtonsoft.Json.Converters;

namespace Programs_Server.Controllers
{
    [RoutePrefix("api/Object")]
    public class ObjectsController : ApiController
    {
        // GET api/<controller> get all Objects
        [HttpPost]
        [Route("Get")]
        public string Get(string token)
        {

            //public string Get(string token)
            //{
            //  public string Get(string token)




          token = TokenManager.readToken(HttpContext.Current.Request); 
 var strP = TokenManager.GetPrincipal(token);
            if (strP != "0") //invalid authorization
            {
                return TokenManager.GenerateToken(strP);
            }
            else
            {
                // bool canDelete = false;

                //int mainBranchId = 0;
                //int userId = 0;

                //IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                //foreach (Claim c in claims)
                //{
                //    if (c.Type == "mainBranchId")
                //    {
                //        mainBranchId = int.Parse(c.Value);
                //    }
                //    else if (c.Type == "userId")
                //    {
                //        userId = int.Parse(c.Value);
                //    }

                //}

                bool canDelete = false;
                try
                {

                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        var List = entity.objects

                                   .Select(c => new ObjectsModel
                                   {
                                       objectId = c.objectId,
                                       name = c.name,
                                       note = c.note,
                                       createDate = c.createDate,
                                       updateDate = c.updateDate,
                                       createUserId = c.createUserId,
                                       updateUserId = c.updateUserId,
                                       parentObjectId = c.parentObjectId,
                                       objectType = c.objectType,
                                   })
                                   .ToList();
                        if (List.Count > 0)
                        {
                            for (int i = 0; i < List.Count; i++)
                            {
                                canDelete = false;
                                if (List[i].isActive == 1)
                                {
                                    int objectId = (int)List[i].objectId;
                                    var operationsL = entity.groupObject.Where(x => x.objectId == objectId).Select(b => new { b.id }).FirstOrDefault();

                                    if (operationsL is null)
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



        // GET api/<controller>  Get medal By ID 
        [HttpPost]
        [Route("GetByID")]
        public string GetByID(string token)
        {
            // public string GetUsersByGroupId(string token)
          token = TokenManager.readToken(HttpContext.Current.Request);var strP = TokenManager.GetPrincipal(token);
            if (strP != "0") //invalid authorization
            {
                return TokenManager.GenerateToken(strP);
            }
            else
            {
                int Id = 0;


                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "Id")
                    {
                        Id = int.Parse(c.Value);
                    }


                }

                // DateTime cmpdate = DateTime.Now.AddDays(newdays);
                try
                {

                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        var list = entity.objects
                       .Where(c => c.objectId == Id)
                       .Select(c => new
                       {
                           c.objectId,
                           c.name,
                           c.note,
                           c.createDate,
                           c.updateDate,
                           c.createUserId,
                           c.updateUserId,
                           c.parentObjectId,
                           c.objectType,
                       })
                       .FirstOrDefault();


                        return TokenManager.GenerateToken(list);
                    }
                    }
                catch
                {
                    return TokenManager.GenerateToken("0");
                }
            }

          }


        // add or update 
        [HttpPost]
        [Route("Save")]
        public String Save(string token)
        {
            //string Object
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
                objects newObject = null;
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "Object")
                    {
                        Object = c.Value.Replace("\\", string.Empty);
                        Object = Object.Trim('"');
                        newObject = JsonConvert.DeserializeObject<objects>(Object, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });
                        break;
                    }
                }
                if (newObject != null)
                {


                    //   bondes tmpObject = null;


                    try
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
                            using (incprogramsdbEntities entity = new incprogramsdbEntities())
                            {
                                var sEntity = entity.Set<objects>();
                                if (newObject.objectId == 0)
                                {
                                    newObject.createDate = DateTime.Now;
                                    newObject.updateDate = DateTime.Now;
                                    newObject.updateUserId = newObject.createUserId;
                                    sEntity.Add(newObject);
                                    entity.SaveChanges();
                                    message = newObject.objectId.ToString();
                                }
                                else
                                {

                                    var tmps = entity.objects.Where(p => p.objectId == newObject.objectId).FirstOrDefault();

                                    tmps.objectId = newObject.objectId;
                                    tmps.name = newObject.name;
                                    tmps.note = newObject.note;
                                    tmps.note = newObject.note;

                                    tmps.createDate = newObject.createDate;
                                    tmps.updateDate = DateTime.Now;// server current date
                                    tmps.parentObjectId = newObject.parentObjectId;
                                    tmps.objectType = newObject.objectType;
                                    tmps.updateUserId = newObject.updateUserId;
                                    entity.SaveChanges();
                                    message = tmps.objectId.ToString();
                                }


                            }
                           // return message; ;
                            return TokenManager.GenerateToken(message);

                    }
                    catch
                    {
                        message = "0";
                        return TokenManager.GenerateToken(message);
                    }


                }

             return TokenManager.GenerateToken(message);

            }


           
        }

        [HttpPost]
        [Route("Delete")]
        public string Delete(string token)
        {
            //int objectId, int userId, bool final

            string message = "";



          token = TokenManager.readToken(HttpContext.Current.Request); 
 var strP = TokenManager.GetPrincipal(token);
            if (strP != "0") //invalid authorization
            {
                return TokenManager.GenerateToken(strP);
            }
            else
            {
                int objectId = 0;
                int userId = 0;
                bool final = false;

                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "objectId")
                    {
                        objectId = int.Parse(c.Value);
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

                            objects Deleterow = entity.objects.Find(objectId);
                            entity.objects.Remove(Deleterow);
                            message = entity.SaveChanges().ToString();
                            //  return Ok("OK");
                            return TokenManager.GenerateToken(message);

                           // return Ok("OK");
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

                            objects Obj = entity.objects.Find(objectId);
                            Obj.isActive = 0;
                            Obj.updateUserId = userId;
                            Obj.updateDate = DateTime.Now;
                            message = entity.SaveChanges().ToString();
                            //  return Ok("OK");
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
}