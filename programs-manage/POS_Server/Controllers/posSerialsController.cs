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


    [RoutePrefix("api/posSerials")]

    public class posSerialsController : ApiController

    {
        // GET api/<controller>
        [HttpPost]
        [Route("GetAll")]
        public string GetAll(string token)
        {

           
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
                        var List = (from S in entity.posSerials
                                    select new posSerialsModel()
                                    {
                                        serialId = S.serialId,
                                        serial = S.serial,
                                        posDeviceCode = S.posDeviceCode,
                                        packageUserId = S.packageUserId,
                                        isBooked = S.isBooked,
                                        isActive = S.isActive,
                                        createDate = S.createDate,
                                        updateDate = S.updateDate,
                                        apikey = S.apikey,
                                        createUserId = S.createUserId,
                                        updateUserId = S.updateUserId,
                                        canDelete = true,
                                        notes = S.notes,


                                    }).ToList();


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
            //bool canDelete = true;

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
            //        var List = (from S in entity.posSerials
            //                    select new posSerialsModel()
            //                    {
            //                        serialId = S.serialId,
            //                        serial = S.serial,
            //                        posDeviceCode = S.posDeviceCode,
            //                        packageUserId = S.packageUserId,
            //                        isBooked = S.isBooked,
            //                        isActive = S.isActive,
            //                        createDate = S.createDate,
            //                        updateDate = S.updateDate,
            //                        apikey = S.apikey,
            //                        createUserId = S.createUserId,
            //                        updateUserId = S.updateUserId,
            //                        canDelete = true,
            //                        notes=   S.notes,


            //                    }).ToList();
            //        /*

            //        */
            //        /*
            //        if (List.Count > 0)
            //        {
            //            for (int i = 0; i < List.Count; i++)
            //            {
            //                if (List[i].isActive == 1)
            //                {
            //                    int serialId = (int)List[i].serialId;
            //                    var itemsI = entity.packageUser.Where(x => x.customerId == serialId).Select(b => new { b.customerId }).FirstOrDefault();

            //                    if ((itemsI is null))
            //                        canDelete = true;
            //                }
            //                List[i].canDelete = canDelete;
            //            }
            //        }
            //        */

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
        public string GetByID(string token)//int serialId
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
                int serialId = 0;


                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "serialId")
                    {
                        serialId = int.Parse(c.Value);
                    }


                }
                try
                {

                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        var row = entity.posSerials
                       .Where(u => u.serialId == serialId)
                       .Select(S => new
                       {
                           S.serialId,
                           S.serial,
                           S.posDeviceCode,
                           S.packageUserId,
                           S.isBooked,
                           S.isActive,
                           S.createDate,
                           S.updateDate,
                           S.apikey,
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
            //        var row = entity.posSerials
            //       .Where(u => u.serialId == serialId)
            //       .Select(S => new
            //       {
            //           S.serialId,
            //           S.serial,
            //           S.posDeviceCode,
            //           S.packageUserId,
            //           S.isBooked,
            //           S.isActive,
            //           S.createDate,
            //           S.updateDate,
            //           S.apikey,
            //           S.createUserId,
            //           S.updateUserId,
            //          S.notes,

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
                posSerials newObject = null;
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "Object")
                    {
                        Object = c.Value.Replace("\\", string.Empty);
                        Object = Object.Trim('"');
                        newObject = JsonConvert.DeserializeObject<posSerials>(Object, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });
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
                            var locationEntity = entity.Set<posSerials>();
                            if (newObject.serialId == 0)
                            {
                                newObject.createDate = DateTime.Now;
                                newObject.updateDate = DateTime.Now;
                                newObject.updateUserId = newObject.createUserId;


                                locationEntity.Add(newObject);
                                entity.SaveChanges();

                                if (newObject.serialId > 0)
                                {

                                    var tmpPackage = entity.packageUser.Where(p => p.packageUserId == newObject.packageUserId).FirstOrDefault();
                                    string pkucode = tmpPackage.packageSaleCode;
                                    int packageUserId;
                                    packageUserId = (int)newObject.packageUserId;

                                    string timestamp = DateTime.Now.ToFileTime().ToString();
                                    string id = newObject.serialId.ToString();
                                    string strcode = packageUserId + pkucode + timestamp + id;
                                    string finalcode = Md5Encription.EncodeHash(strcode);
                                    newObject.serial = finalcode;

                                    entity.SaveChanges();
                                }


                                message = newObject.serialId.ToString();
                                //


                            }
                            else
                            {
                                var tmpObject = entity.posSerials.Where(p => p.serialId == newObject.serialId).FirstOrDefault();

                                tmpObject.updateDate = DateTime.Now;
                                tmpObject.serialId = newObject.serialId;
                                tmpObject.serial = newObject.serial;
                                tmpObject.posDeviceCode = newObject.posDeviceCode;
                                tmpObject.packageUserId = newObject.packageUserId;
                                tmpObject.isBooked = newObject.isBooked;
                                tmpObject.isActive = newObject.isActive;
                                //    tmpObject.createDate = newObject.createDate;

                                tmpObject.apikey = newObject.apikey;
                                //  tmpObject.createUserId = newObject.createUserId;
                                tmpObject.updateUserId = newObject.updateUserId;
                                tmpObject.notes = newObject.notes;


                                entity.SaveChanges();

                                message = tmpObject.serialId.ToString();
                            }
                            //  entity.SaveChanges();
                        }
   return TokenManager.GenerateToken(message.ToString());
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
                //    posSerials newObject = JsonConvert.DeserializeObject<posSerials>(Object, new JsonSerializerSettings { DateParseHandling = DateParseHandling.None });
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
                //    if (newObject.packageUserId == 0 || newObject.packageUserId == null)
                //    {
                //        Nullable<int> id = null;
                //        newObject.packageUserId = id;
                //    }
                //    try
                //    {
                //        using (incprogramsdbEntities entity = new incprogramsdbEntities())
                //        {
                //            var locationEntity = entity.Set<posSerials>();
                //            if (newObject.serialId == 0)
                //            {
                //                newObject.createDate = DateTime.Now;
                //                newObject.updateDate = DateTime.Now;
                //                newObject.updateUserId = newObject.createUserId;


                //                locationEntity.Add(newObject);
                //                entity.SaveChanges();

                //                if (newObject.serialId > 0)
                //                {

                //               var tmpPackage = entity.packageUser.Where(p => p.packageUserId == newObject.packageUserId).FirstOrDefault();
                //                    string pkucode = tmpPackage.packageSaleCode;
                //                    int packageUserId;
                //                    packageUserId = (int)newObject.packageUserId;

                //                    string timestamp = DateTime.Now.ToFileTime().ToString();
                //                    string id = newObject.serialId.ToString();
                //                    string strcode = packageUserId + pkucode +  timestamp + id;
                //                    string finalcode = Md5Encription.EncodeHash(strcode);
                //                    newObject.serial = finalcode;

                //                    entity.SaveChanges();
                //                }


                //                message = newObject.serialId.ToString();
                //                //


                //            }
                //            else
                //            {
                //                var tmpObject = entity.posSerials.Where(p => p.serialId == newObject.serialId).FirstOrDefault();

                //                tmpObject.updateDate = DateTime.Now;
                //                tmpObject.serialId = newObject.serialId;
                //                tmpObject.serial = newObject.serial;
                //                tmpObject.posDeviceCode = newObject.posDeviceCode;
                //                tmpObject.packageUserId = newObject.packageUserId;
                //                tmpObject.isBooked = newObject.isBooked;
                //                tmpObject.isActive = newObject.isActive;
                //            //    tmpObject.createDate = newObject.createDate;

                //                tmpObject.apikey = newObject.apikey;
                //              //  tmpObject.createUserId = newObject.createUserId;
                //                tmpObject.updateUserId = newObject.updateUserId;
                //                tmpObject.notes = newObject.notes;


                //                entity.SaveChanges();

                //                message = tmpObject.serialId.ToString();
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
        public string Delete(string token)//int serialId, int userId, bool final
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
                int serialId = 0;
                int userId = 0;
                bool final = false;

                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "serialId")
                    {
                        serialId = int.Parse(c.Value);
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
                            posSerials objectDelete = entity.posSerials.Find(serialId);

                            entity.posSerials.Remove(objectDelete);
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
                            posSerials objectDelete = entity.posSerials.Find(serialId);

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
            //                posSerials objectDelete = entity.posSerials.Find(serialId);

            //                entity.posSerials.Remove(objectDelete);
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
            //                posSerials objectDelete = entity.posSerials.Find(serialId);

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
        public int MultiserialSave(posSerials serialObject, int count)
        {
            string message = "";
            int savedcount = 0;

            if (serialObject.updateUserId == 0 || serialObject.updateUserId == null)
            {
                Nullable<int> id = null;
                serialObject.updateUserId = id;
            }
            if (serialObject.createUserId == 0 || serialObject.createUserId == null)
            {
                Nullable<int> id = null;
                serialObject.createUserId = id;
            }
            if (serialObject.packageUserId == 0 || serialObject.packageUserId == null)
            {
                Nullable<int> id = null;
                serialObject.packageUserId = id;
            }
            //
            for (int i = 0; i < count; i++)
            {
                serialObject.serialId = 0;
                string res = posSerialSave(serialObject);
                if (int.Parse(res) > 0)
                {
                    savedcount++;
                }
            }
            return savedcount;
        }
        [HttpPost]
        [Route("MultiSave")]
        public string MultiSave(string token)//string Object,int count
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
                posSerials newObject = null;
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "Object")
                    {
                        Object = c.Value.Replace("\\", string.Empty);
                        Object = Object.Trim('"');
                        newObject = JsonConvert.DeserializeObject<posSerials>(Object, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });

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
                    if (newObject.packageUserId == 0 || newObject.packageUserId == null)
                    {
                        Nullable<int> id = null;
                        newObject.packageUserId = id;
                    }
                    //
                    for (int i = 0; i < count; i++)
                    {
                        newObject.serialId = 0;
                        string res = posSerialSave(newObject);
                        if (int.Parse(res) > 0)
                        {
                            savedcount++;
                        }
                    }

                    
                    return TokenManager.GenerateToken(savedcount.ToString());
                   
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
            //    posSerials newObject = JsonConvert.DeserializeObject<posSerials>(Object, new JsonSerializerSettings { DateParseHandling = DateParseHandling.None });
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
            //    if (newObject.packageUserId == 0 || newObject.packageUserId == null)
            //    {
            //        Nullable<int> id = null;
            //        newObject.packageUserId = id;
            //    }
            //    //
            //    for (int i = 0; i < count; i++)
            //    {
            //        newObject.serialId = 0;
            //        string res = posSerialSave(newObject);
            //        if (int.Parse(res) > 0)
            //        {
            //            savedcount++;
            //        }
            //    }

            //    //
            //}
            //return message;
        }

        private string posSerialSave(posSerials newObject)
        {
          string  message = "";
            try
            {
                using (incprogramsdbEntities entity = new incprogramsdbEntities())
                {
                    var locationEntity = entity.Set<posSerials>();
                    if (newObject.serialId == 0)
                    {
                        newObject.createDate = DateTime.Now;
                        newObject.updateDate = DateTime.Now;
                        newObject.updateUserId = newObject.createUserId;


                        locationEntity.Add(newObject);
                        entity.SaveChanges();

                        if (newObject.serialId > 0)
                        {
                            string pkucode;
                            using (incprogramsdbEntities entity2 = new incprogramsdbEntities())
                            {
                                var tmpPackage = entity2.packageUser.Where(p => p.packageUserId == newObject.packageUserId).FirstOrDefault();
                               pkucode = tmpPackage.packageSaleCode;
                            }
                                int packageUserId;
                            packageUserId = (int)newObject.packageUserId;

                            string timestamp = DateTime.Now.ToFileTime().ToString();
                            string id = newObject.serialId.ToString();
                            string strcode = packageUserId + pkucode + timestamp + id;
                            string finalcode = Md5Encription.EncodeHash(strcode);
                            newObject.serial = finalcode;

                            entity.SaveChanges();
                        }


                        message = newObject.serialId.ToString();
                        //


                    }
                 
                    //  entity.SaveChanges();
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