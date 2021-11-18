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
    [RoutePrefix("api/Group")]
    public class GroupController : ApiController
    {
        // GET api/<controller> get all Group
        [HttpPost]
        [Route("Get")]
        public string Get(string token)
        {
            //  public string Get(string token)




          token = TokenManager.readToken(HttpContext.Current.Request); 
 var strP = TokenManager.GetPrincipal(token);
            if (strP != "0") //invalid authorization
            {
                return TokenManager.GenerateToken(strP);
            }
            else
            {
                bool canDelete = false;

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


                try
                {
                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        var List = entity.groups

                       .Select(c => new GroupModel
                       {
                           groupId = c.groupId,
                           name = c.name,
                           notes = c.notes,
                           createDate = c.createDate,
                           updateDate = c.updateDate,
                           createUserId = c.createUserId,
                           updateUserId = c.updateUserId,
                           isActive = c.isActive,

                       })
                       .ToList();
                        if (List.Count > 0)
                        {
                            for (int i = 0; i < List.Count; i++)
                            {
                                canDelete = false;
                                if (List[i].isActive == 1)
                                {
                                    int groupId = (int)List[i].groupId;
                                    // var operationsL = entity.groupObject.Where(x => x.groupId == groupId).Select(b => new { b.id }).FirstOrDefault();
                                    var operationsu = entity.users.Where(x => x.groupId == groupId).Select(b => new { b.groupId }).FirstOrDefault();
                                    if (operationsu is null)
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




        // GET api/<controller>  ارجاع قائمة المستخدمين التابعين للمجموعة
        [HttpPost]
        [Route("GetUsersByGroupId")]
        public string GetUsersByGroupId(string token)
        {

          token = TokenManager.readToken(HttpContext.Current.Request);var strP = TokenManager.GetPrincipal(token);
            if (strP != "0") //invalid authorization
            {
                return TokenManager.GenerateToken(strP);
            }
            else
            {
                int groupId = 0;


                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "groupId")
                    {
                        groupId = int.Parse(c.Value);
                    }


                }

                // DateTime cmpdate = DateTime.Now.AddDays(newdays);
                try
                {
                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        var list = entity.users
                       .Where(S => S.groupId == groupId)
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
                           S.code,
                           S.password,
                           S.type,
                           S.image,
                           S.notes,
                           S.balance,
                           S.createUserId,
                           S.updateUserId,
                           S.isActive,


                       })
                                   .ToList();

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
                groups newObject = null;
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "Object")
                    {
                        Object = c.Value.Replace("\\", string.Empty);
                        Object = Object.Trim('"');
                        newObject = JsonConvert.DeserializeObject<groups>(Object, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });
                        break;
                    }
                }
                if (newObject != null)
                {


          


                 
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
                                var sEntity = entity.Set<groups>();
                                if (newObject.groupId == 0 || newObject.groupId == null)
                                {
                                    newObject.createDate = DateTime.Now;
                                    newObject.updateDate = DateTime.Now;
                                    newObject.updateUserId = newObject.createUserId;



                                    entity.groups.Add(newObject);

                                    entity.SaveChanges();
                                    message = newObject.groupId.ToString();
                                }
                                else
                                {

                                    var tmps = entity.groups.Where(p => p.groupId == newObject.groupId).FirstOrDefault();
                                    tmps.groupId = newObject.groupId;
                                    tmps.name = newObject.name;
                                    tmps.notes = newObject.notes;
                                    tmps.isActive = newObject.isActive;
                                    tmps.createDate = newObject.createDate;
                                    tmps.updateDate = DateTime.Now;// server current date
                                    tmps.updateUserId = newObject.updateUserId;
                                    entity.SaveChanges();
                                    message = tmps.groupId.ToString();
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


            // int groupId, int userId, Boolean final
            //int Id, int userId
            string message = "";



          token = TokenManager.readToken(HttpContext.Current.Request); 
 var strP = TokenManager.GetPrincipal(token);
            if (strP != "0") //invalid authorization
            {
                return TokenManager.GenerateToken(strP);
            }
            else
            {
                int groupId = 0;
                int userId = 0;
                bool final = false;

                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "groupId")
                    {
                        groupId = int.Parse(c.Value);
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

                            groups Deleterow = entity.groups.Find(groupId);

                            List<groupObject> delGrObject = entity.groupObject.Where(x => x.groupId == groupId).ToList();
                            entity.groupObject.RemoveRange(delGrObject);
                            entity.SaveChanges();
                            entity.groups.Remove(Deleterow);
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
                else
                {
                    try
                    {
                        using (incprogramsdbEntities entity = new incprogramsdbEntities())
                        {

                            groups Obj = entity.groups.Find(groupId);
                            Obj.isActive = 0;
                            Obj.updateUserId = userId;
                            Obj.updateDate = DateTime.Now;
                            message = entity.SaveChanges().ToString();
                            return TokenManager.GenerateToken(message);
                            //return Ok("Ok");
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

            //                groups Deleterow = entity.groups.Find(groupId);

            //                List<groupObject> delGrObject = entity.groupObject.Where(x => x.groupId == groupId).ToList();
            //                entity.groupObject.RemoveRange(delGrObject);
            //                entity.SaveChanges();
            //                entity.groups.Remove(Deleterow);
            //                entity.SaveChanges();
            //                return Ok("OK");
            //            }
            //        }
            //        catch
            //        {
            //            return NotFound();
            //        }
            //    }
            //    else
            //    {
            //        try
            //        {
            //            using (incprogramsdbEntities entity = new incprogramsdbEntities())
            //            {

            //                groups Obj = entity.groups.Find(groupId);
            //                Obj.isActive = 0;
            //                Obj.updateUserId = userId;
            //                Obj.updateDate = DateTime.Now;
            //                entity.SaveChanges();
            //                return Ok("Ok");
            //            }
            //        }
            //        catch
            //        {
            //            return NotFound();
            //        }
            //    }



            //}
            //else
            //    return NotFound();
        }

        [HttpPost]
        [Route("UpdateGroupIdInUsers")]
        public String UpdateGroupIdInUsers(string token)
        {
            //int groupId, string newList, int userId
          token = TokenManager.readToken(HttpContext.Current.Request); 
 var strP = TokenManager.GetPrincipal(token);
            if (strP != "0") //invalid authorization
            {
                return TokenManager.GenerateToken(strP);
            }
            else
            {
                string message = "";
                int groupId = 0;
                int userId = 0;

                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
               
                    string newList = "";
                List<int> newListObj = new List<int>();
                  
                    foreach (Claim c in claims)
                    {
                        if (c.Type == "newList")
                        {
                        newList = c.Value.Replace("\\", string.Empty);
                        newList = newList.Trim('"');
                        newListObj = JsonConvert.DeserializeObject<List<int>>(newList, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });
                            
                        }
                        else if (c.Type == "groupId")
                        {
                        groupId = int.Parse(c.Value);
                        }
                    else if (c.Type == "userId")
                    {
                        userId = int.Parse(c.Value);
                    }

                }

               

                // DateTime cmpdate = DateTime.Now.AddDays(newdays);
                try
                {
                   

                        using (incprogramsdbEntities entity = new incprogramsdbEntities())
                        {
                            // reset old list
                            List<users> oldList = entity.users.Where(x => x.groupId == groupId).ToList();
                            if (oldList.Count > 0)
                            {
                                for (int i = 0; i < oldList.Count; i++)
                                {
                                    oldList[i].groupId = null;
                                    oldList[i].updateUserId = userId;
                                    oldList[i].updateDate = DateTime.Now;


                                }
                                entity.SaveChanges();
                            }

                            //save new list
                            if (newListObj.Count > 0)
                            {
                                foreach (int rowId in newListObj)
                                {
                                    users userRow = entity.users.Find(rowId);
                                    userRow.updateUserId = userId;
                                    userRow.updateDate = DateTime.Now;
                                    userRow.groupId = groupId;
                                message= entity.SaveChanges().ToString();
                              
                            }
                            }
                            else
                            {
                            //message = "-1";
                            message = "0";
                           
                        }


                    }
                    //    return message; ;

                   return TokenManager.GenerateToken(message);
                }
                catch
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
            //    newList = newList.Replace("\\", string.Empty);
            //    newList = newList.Trim('"');

            //    List<int> newListObj = JsonConvert.DeserializeObject<List<int>>(newList, new JsonSerializerSettings { DateParseHandling = DateParseHandling.None });
            //    try
            //    {


            //        using (incprogramsdbEntities entity = new incprogramsdbEntities())
            //        {
            //            // reset old list
            //            List<users> oldList = entity.users.Where(x => x.groupId == groupId).ToList();
            //            if (oldList.Count > 0)
            //            {
            //                for (int i = 0; i < oldList.Count; i++)
            //                {
            //                    oldList[i].groupId = null;
            //                    oldList[i].updateUserId = userId;
            //                    oldList[i].updateDate = DateTime.Now;


            //                }
            //                entity.SaveChanges();
            //            }

            //            //save new list
            //            if (newListObj.Count > 0)
            //            {
            //                foreach (int rowId in newListObj)
            //                {
            //                    users userRow = entity.users.Find(rowId);
            //                    userRow.updateUserId = userId;
            //                    userRow.updateDate = DateTime.Now;
            //                    userRow.groupId = groupId;
            //                    entity.SaveChanges();
            //                }
            //            }
            //            else
            //            {
            //                message = "-1";
            //            }


            //        }
            //        return message; ;
            //    }

            //    catch
            //    {
            //        return "-1";
            //    }
            //}
            //else
            //    return "-1";
        }

    }
}