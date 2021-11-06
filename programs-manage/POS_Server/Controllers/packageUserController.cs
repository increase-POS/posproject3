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


    [RoutePrefix("api/packageUser")]

    public class packageUserController : ApiController

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
                        var List = (from S in entity.packageUser
                                    select new packageUserModel()
                                    {
                                        packageUserId = S.packageUserId,
                                        packageId = S.packageId,
                                        userId = S.userId,
                                        packageSaleCode = S.packageSaleCode,
                                        packageNumber = S.packageNumber,
                                        customerId = S.customerId,
                                        customerServerCode = S.customerServerCode,
                                        isBooked = S.isBooked,
                                        notes = S.notes,
                                        createDate = S.createDate,
                                        updateDate = S.updateDate,
                                        createUserId = S.createUserId,
                                        updateUserId = S.updateUserId,
                                        bookDate = S.bookDate,
                                        isActive = S.isActive,
                                        expireDate = S.expireDate,




                                    }).ToList();
                        /*

                        */

                        if (List.Count > 0)
                        {
                            for (int i = 0; i < List.Count; i++)
                            {
                                if (List[i].isActive == 1)
                                {
                                    int packageUserId = (int)List[i].packageUserId;
                                    var itemsI = entity.posSerials.Where(x => x.packageUserId == packageUserId).Select(b => new { b.packageUserId }).FirstOrDefault();

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
            //        var List = (from S in entity.packageUser
            //                    select new packageUserModel()
            //                    {
            //                        packageUserId = S.packageUserId,
            //                        packageId = S.packageId,
            //                        userId = S.userId,
            //                        packageSaleCode = S.packageSaleCode,
            //                        packageNumber = S.packageNumber,
            //                        customerId = S.customerId,
            //                        customerServerCode = S.customerServerCode,
            //                        isBooked = S.isBooked,
            //                        notes = S.notes,
            //                        createDate = S.createDate,
            //                        updateDate = S.updateDate,
            //                        createUserId = S.createUserId,
            //                        updateUserId = S.updateUserId,
            //                        bookDate = S.bookDate,
            //                        isActive = S.isActive,
            //                        expireDate = S.expireDate,




            //                    }).ToList();
            //        /*

            //        */

            //        if (List.Count > 0)
            //        {
            //            for (int i = 0; i < List.Count; i++)
            //            {
            //                if (List[i].isActive == 1)
            //                {
            //                    int packageUserId = (int)List[i].packageUserId;
            //                    var itemsI = entity.posSerials.Where(x => x.packageUserId == packageUserId).Select(b => new { b.packageUserId }).FirstOrDefault();

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
                int packageUserId = 0;


                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "packageUserId")
                    {
                        packageUserId = int.Parse(c.Value);
                    }


                }
                try
                {
                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        var row = entity.packageUser
                       .Where(u => u.packageUserId == packageUserId)
                       .Select(S => new
                       {

                           S.packageUserId,
                           S.packageId,
                           S.userId,
                           S.packageSaleCode,
                           S.packageNumber,
                           S.customerId,
                           S.customerServerCode,
                           S.isBooked,
                           S.notes,
                           S.createDate,
                           S.updateDate,
                           S.createUserId,
                           S.updateUserId,
                           S.bookDate,
                           S.isActive,
                           S.expireDate,

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
            //        var row = entity.packageUser
            //       .Where(u => u.packageUserId == packageUserId)
            //       .Select(S => new
            //       {

            //           S.packageUserId,
            //           S.packageId,
            //           S.userId,
            //           S.packageSaleCode,
            //           S.packageNumber,
            //           S.customerId,
            //           S.customerServerCode,
            //           S.isBooked,
            //           S.notes,
            //           S.createDate,
            //           S.updateDate,
            //           S.createUserId,
            //           S.updateUserId,
            //           S.bookDate,
            //           S.isActive,
            //           S.expireDate,


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
                packageUser newObject = null;
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "Object")
                    {
                        Object = c.Value.Replace("\\", string.Empty);
                        Object = Object.Trim('"');
                        newObject = JsonConvert.DeserializeObject<packageUser>(Object, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });
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
                    if (newObject.userId == 0 || newObject.userId == null)
                    {
                        Nullable<int> id = null;
                        newObject.userId = id;
                    }
                    if (newObject.customerId == 0 || newObject.customerId == null)
                    {
                        Nullable<int> id = null;
                        newObject.customerId = id;
                    }



                    try
                    {

                        using (incprogramsdbEntities entity = new incprogramsdbEntities())
                        {
                            var locationEntity = entity.Set<packageUser>();
                            if (newObject.packageUserId == 0)
                            {
                                newObject.createDate = DateTime.Now;
                                newObject.updateDate = DateTime.Now;
                                newObject.updateUserId = newObject.createUserId;


                                locationEntity.Add(newObject);
                                entity.SaveChanges();

                                // get packageuser code

                                if (newObject.packageUserId > 0)
                                {
                                    string packagecode;
                                    var tmpPackage = entity.packages.Where(p => p.packageId == newObject.packageId).FirstOrDefault();
                                    packagecode = tmpPackage.packageCode;
                                    string usercode;
                                    var tmpUser = entity.users.Where(p => p.userId == newObject.userId).FirstOrDefault();
                                    usercode = tmpUser.code;

                                    string timestamp = DateTime.Now.ToFileTime().ToString();
                                    string id = newObject.packageUserId.ToString();
                                    string strcode = packagecode + usercode + timestamp + id;
                                    string finalcode = Md5Encription.EncodeHash(strcode);
                                    newObject.packageSaleCode = finalcode;

                                    entity.SaveChanges();
                                }

                                message = newObject.packageUserId.ToString();

                            }
                            else
                            {
                                var tmpObject = entity.packageUser.Where(p => p.packageUserId == newObject.packageUserId).FirstOrDefault();

                                tmpObject.updateDate = DateTime.Now;
                                tmpObject.packageUserId = newObject.packageUserId;
                                tmpObject.packageId = newObject.packageId;
                                tmpObject.userId = newObject.userId;
                                //   tmpObject.packageSaleCode = newObject.packageSaleCode;
                                tmpObject.packageNumber = newObject.packageNumber;
                                tmpObject.customerId = newObject.customerId;
                                tmpObject.customerServerCode = newObject.customerServerCode;
                                tmpObject.isBooked = newObject.isBooked;
                                tmpObject.notes = newObject.notes;
                                //   tmpObject.createDate = newObject.createDate;

                                //tmpObject.createUserId = newObject.createUserId;
                                tmpObject.updateUserId = newObject.updateUserId;
                                tmpObject.bookDate = newObject.bookDate;
                                tmpObject.isActive = newObject.isActive;
                                tmpObject.expireDate = newObject.expireDate;



                                entity.SaveChanges();

                                message = tmpObject.packageUserId.ToString();
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
            //    packageUser newObject = JsonConvert.DeserializeObject<packageUser>(Object, new JsonSerializerSettings { DateParseHandling = DateParseHandling.None });
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
            //    if (newObject.packageId == 0 || newObject.packageId == null)
            //    {
            //        Nullable<int> id = null;
            //        newObject.packageId = id;
            //    }
            //    if (newObject.userId == 0 || newObject.userId == null)
            //    {
            //        Nullable<int> id = null;
            //        newObject.userId = id;
            //    }
            //    if (newObject.customerId == 0 || newObject.customerId == null)
            //    {
            //        Nullable<int> id = null;
            //        newObject.customerId = id;
            //    }



            //    try
            //    {
            //        using (incprogramsdbEntities entity = new incprogramsdbEntities())
            //        {
            //            var locationEntity = entity.Set<packageUser>();
            //            if (newObject.packageUserId == 0)
            //            {
            //                newObject.createDate = DateTime.Now;
            //                newObject.updateDate = DateTime.Now;
            //                newObject.updateUserId = newObject.createUserId;


            //                locationEntity.Add(newObject);
            //                entity.SaveChanges();

            //                // get packageuser code

            //                if (newObject.packageUserId>0)
            //                {
            //                    string packagecode;
            //                    var tmpPackage = entity.packages.Where(p => p.packageId == newObject.packageId).FirstOrDefault();
            //                    packagecode = tmpPackage.packageCode;
            //                    string usercode;
            //                    var tmpUser = entity.users.Where(p => p.userId == newObject.userId).FirstOrDefault();
            //                    usercode = tmpUser.code;

            //                    string timestamp = DateTime.Now.ToFileTime().ToString();
            //                    string id = newObject.packageUserId.ToString();
            //                    string strcode = packagecode + usercode + timestamp + id;
            //                    string finalcode = Md5Encription.EncodeHash(strcode);
            //                    newObject.packageSaleCode = finalcode;

            //                    entity.SaveChanges();
            //                }

            //                message = newObject.packageUserId.ToString();

            //            }
            //            else
            //            {
            //                var tmpObject = entity.packageUser.Where(p => p.packageUserId == newObject.packageUserId).FirstOrDefault();

            //                tmpObject.updateDate = DateTime.Now;
            //                tmpObject.packageUserId = newObject.packageUserId;
            //                tmpObject.packageId = newObject.packageId;
            //                tmpObject.userId = newObject.userId;
            //             //   tmpObject.packageSaleCode = newObject.packageSaleCode;
            //                tmpObject.packageNumber = newObject.packageNumber;
            //                tmpObject.customerId = newObject.customerId;
            //                tmpObject.customerServerCode = newObject.customerServerCode;
            //                tmpObject.isBooked = newObject.isBooked;
            //                tmpObject.notes = newObject.notes;
            //             //   tmpObject.createDate = newObject.createDate;

            //                //tmpObject.createUserId = newObject.createUserId;
            //                tmpObject.updateUserId = newObject.updateUserId;
            //                tmpObject.bookDate = newObject.bookDate;
            //                tmpObject.isActive = newObject.isActive;
            //                tmpObject.expireDate = newObject.expireDate;



            //                entity.SaveChanges();

            //                message = tmpObject.packageUserId.ToString();
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

        // add or update location
        [HttpPost]
        [Route("MultiSave")]
#pragma warning disable CS1591 // Missing XML comment for publicly visible type or member
        public string MultiSave(string token)//string Object,int count
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
                int count = 0;
                int savedcount = 0;
                packageUser newObject = null;
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "Object")
                    {
                        Object = c.Value.Replace("\\", string.Empty);
                        Object = Object.Trim('"');
                        newObject = JsonConvert.DeserializeObject<packageUser>(Object, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });

                    }
                    else if (c.Type == "count")
                    {
                        count = int.Parse(c.Value);

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
                    if (newObject.userId == 0 || newObject.userId == null)
                    {
                        Nullable<int> id = null;
                        newObject.userId = id;
                    }
                    if (newObject.customerId == 0 || newObject.customerId == null)
                    {
                        Nullable<int> id = null;
                        newObject.customerId = id;
                    }
                    //
                    try
                    {
                        for (int i = 0; i < count; i++)
                        {
                            newObject.packageUserId = 0;
                            string res = packUserSave(newObject);
                            if (int.Parse(res) > 0)
                            {
                                savedcount++;
                            }
                        }


                        //

                        return TokenManager.GenerateToken(savedcount.ToString());

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

            //int savedcount = 0;
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
            //    packageUser newObject = JsonConvert.DeserializeObject<packageUser>(Object, new JsonSerializerSettings { DateParseHandling = DateParseHandling.None });
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
            //    if (newObject.packageId == 0 || newObject.packageId == null)
            //    {
            //        Nullable<int> id = null;
            //        newObject.packageId = id;
            //    }
            //    if (newObject.userId == 0 || newObject.userId == null)
            //    {
            //        Nullable<int> id = null;
            //        newObject.userId = id;
            //    }
            //    if (newObject.customerId == 0 || newObject.customerId == null)
            //    {
            //        Nullable<int> id = null;
            //        newObject.customerId = id;
            //    }
            //    //

            //    for(int i = 0; i < count; i++)
            //    {
            //        newObject.packageUserId = 0;
            //        string res = packUserSave(newObject);
            //        if (int.Parse(res) > 0)
            //        {
            //            savedcount ++;
            //        }
            //    }


            ////



            //}
            //return savedcount.ToString();
        }

        [HttpPost]
        [Route("Delete")]
        public string Delete(string token)//int packageUserId, int userId, bool final
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
                int packageUserId = 0;
                int userId = 0;
                bool final = false;

                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "packageUserId")
                    {
                        packageUserId = int.Parse(c.Value);
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
                            packageUser objectDelete = entity.packageUser.Find(packageUserId);

                            entity.packageUser.Remove(objectDelete);
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
                            packageUser objectDelete = entity.packageUser.Find(packageUserId);

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
            //                packageUser objectDelete = entity.packageUser.Find(packageUserId);

            //                entity.packageUser.Remove(objectDelete);
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
            //                packageUser objectDelete = entity.packageUser.Find(packageUserId);

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

        private string packUserSave(packageUser newObject)
        {
            string message = "";
            try
            {

                using (incprogramsdbEntities entity = new incprogramsdbEntities())
                {
                    var locationEntity = entity.Set<packageUser>();
                    if (newObject.packageUserId == 0)
                    {
                        newObject.createDate = DateTime.Now;
                        newObject.updateDate = DateTime.Now;
                        newObject.updateUserId = newObject.createUserId;


                        locationEntity.Add(newObject);
                        entity.SaveChanges();

                        // get packageuser code

                        if (newObject.packageUserId > 0)
                        {
                            string packagecode;
                            var tmpPackage = entity.packages.Where(p => p.packageId == newObject.packageId).FirstOrDefault();
                            packagecode = tmpPackage.packageCode;
                            string usercode;
                            var tmpUser = entity.users.Where(p => p.userId == newObject.userId).FirstOrDefault();
                            usercode = tmpUser.code;

                            string timestamp = DateTime.Now.ToFileTime().ToString();
                            string id = newObject.packageUserId.ToString();
                            string strcode = packagecode + usercode + timestamp + id;
                            string finalcode = Md5Encription.EncodeHash(strcode);
                            newObject.packageSaleCode = finalcode;

                            entity.SaveChanges();
                        }

                        message = newObject.packageUserId.ToString();

                    }

                }
            }
            catch
            {
                message = "-1";
            }
            return message;
        }

    }
}