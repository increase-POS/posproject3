using Newtonsoft.Json;
using Programs_Server;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Programs_Server.Models;

using Programs_Server.Models.VM;
using System.Security.Claims;
using Newtonsoft.Json.Converters;
using System.Web;

namespace Programs_Server.Controllers
{


    [RoutePrefix("api/packages")]

    public class packagesController : ApiController

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
                        
                        var List = (from S in entity.packages
                                    select new packagesModel()
                                    {

                                        packageId = S.packageId,
                                        packageName = S.packageName,
                                        details = S.details,
                                        branchCount = S.branchCount,
                                        posCount = S.posCount,
                                        userCount = S.userCount,
                                        vendorCount = S.vendorCount,
                                        customerCount = S.customerCount,
                                        itemCount = S.itemCount,
                                        salesInvCount = S.salesInvCount,
                                        programId = S.programId,
                                        programName = S.programs.name,
                                        verId = S.verId,
                                        verName = S.versions.name,
                                        
                                        isActive = S.isActive,
                                        createDate = S.createDate,
                                        updateDate = S.updateDate,
                                        packageCode = S.packageCode,
                                        storeCount = S.storeCount,
                                      
                                        createUserId = S.createUserId,
                                        updateUserId = S.updateUserId,
                                        notes = S.notes,


                                    }).ToList();


                        if (List.Count > 0)
                        {
                            for (int i = 0; i < List.Count; i++)
                            {
                                if (List[i].isActive == 1)
                                {
                                    int packageId = (int)List[i].packageId;
                                    var itemsI = entity.packageUser.Where(x => x.packageId == packageId).Select(b => new { b.packageId }).FirstOrDefault();

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
            //        var List = (from S in entity.packages
            //                    select new packagesModel()
            //                    {

            //                        packageId = S.packageId,
            //                        packageName = S.packageName,
            //                        details = S.details,
            //                        branchCount = S.branchCount,
            //                        posCount = S.posCount,
            //                        userCount = S.userCount,
            //                        vendorCount = S.vendorCount,
            //                        customerCount = S.customerCount,
            //                        itemCount = S.itemCount,
            //                        salesInvCount = S.salesInvCount,
            //                        programId = S.programId,
            //                        programName = S.programs.name,
            //                        verId = S.verId,
            //                        verName = S.versions.name,
            //                        price = S.price,
            //                        isActive = S.isActive,
            //                        createDate = S.createDate,
            //                        updateDate = S.updateDate,
            //                        packageCode = S.packageCode,
            //                        storeCount = S.storeCount,
            //                        endDate = S.endDate,
            //                        islimitDate = S.islimitDate,
            //                        createUserId = S.createUserId,
            //                        updateUserId = S.updateUserId,
            //                        notes=   S.notes,


            //                    }).ToList();
            //        /*
            //         * 
            //         */

            //        if (List.Count > 0)
            //        {
            //            for (int i = 0; i < List.Count; i++)
            //            {
            //                if (List[i].isActive == 1)
            //                {
            //                    int packageId = (int)List[i].packageId;
            //                    var itemsI = entity.packageUser.Where(x => x.packageId == packageId).Select(b => new { b.packageId }).FirstOrDefault();

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
        public string GetByID(string token)//string token//packageId
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
                int packageId = 0;


                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "packageId")
                    {
                        packageId = int.Parse(c.Value);
                    }


                }
                try
                {

                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        var row = entity.packages
                       .Where(u => u.packageId == packageId)
                       .Select(S => new
                       {

                           S.packageId,
                           S.packageName,
                           S.details,
                           S.branchCount,
                           S.posCount,
                           S.userCount,
                           S.vendorCount,
                           S.customerCount,
                           S.itemCount,
                           S.salesInvCount,
                           S.programId,
                           programName = S.programs.name,
                           S.verId,
                           verName = S.versions.name,
                          
                           S.isActive,
                           S.createDate,
                           S.updateDate,
                           S.packageCode,
                           S.storeCount,
                           
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
            //        var row = entity.packages
            //       .Where(u => u.packageId == packageId)
            //       .Select(S => new
            //       {

            //           S.packageId,
            //           S.packageName,
            //           S.details,
            //           S.branchCount,
            //           S.posCount,
            //           S.userCount,
            //           S.vendorCount,
            //           S.customerCount,
            //           S.itemCount,
            //           S.salesInvCount,
            //           S.programId,
            //           programName =  S.programs.name,
            //           S.verId,
            //           verName = S.versions.name,
            //           S.price,
            //           S.isActive,
            //           S.createDate,
            //           S.updateDate,
            //           S.packageCode,
            //           S.storeCount,
            //           S.endDate,
            //           S.islimitDate,
            //           S.createUserId,
            //           S.updateUserId,
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


        public packagesSend GetByID(int packageId)
        {

            packagesSend row = new packagesSend();

            try
            {

                using (incprogramsdbEntities entity = new incprogramsdbEntities())
                {
                    row = entity.packages 
                       .Where(u => u.packageId == packageId && u.isActive == 1)
                       .Select(S => new packagesSend
                       {

                           //  packageId = S.packageId,
                           packageName = S.packageName,
                           // details = S.details,
                           branchCount = S.branchCount,
                           posCount = S.posCount,
                           userCount = S.userCount,
                           vendorCount = S.vendorCount,
                           customerCount = S.customerCount,
                           itemCount = S.itemCount,
                           salesInvCount = S.salesInvCount,
                           // programId = S.programId,
                           programName = S.programs.name,
                           //verId = S.verId,
                           verName = S.versions.name,
                           //  price = S.price,
                           //   isActive = S.isActive,
                           //   createDate = S.createDate,
                           //   updateDate = S.updateDate,
                           //   packageCode = S.packageCode,
                           storeCount = S.storeCount,
                       
                           //    createUserId = S.createUserId,
                           //  updateUserId = S.updateUserId,
                           // notes = S.notes,

                       }).FirstOrDefault();

                    return row;
                }

            }
            catch
            {
                return row;
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
                packages newObject = null;
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "Object")
                    {
                        Object = c.Value.Replace("\\", string.Empty);
                        Object = Object.Trim('"');
                        newObject = JsonConvert.DeserializeObject<packages>(Object, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });
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
                    if (newObject.programId == 0 || newObject.programId == null)
                    {
                        Nullable<int> id = null;
                        newObject.programId = id;
                    }
                    if (newObject.verId == 0 || newObject.verId == null)
                    {
                        Nullable<int> id = null;
                        newObject.verId = id;
                    }



                    try
                    {
                        using (incprogramsdbEntities entity = new incprogramsdbEntities())
                        {
                            var locationEntity = entity.Set<packages>();
                            if (newObject.packageId == 0)
                            {
                                newObject.createDate = DateTime.Now;
                                newObject.updateDate = DateTime.Now;
                                newObject.updateUserId = newObject.createUserId;


                                locationEntity.Add(newObject);
                                entity.SaveChanges();
                                message = newObject.packageId.ToString();
                            }
                            else
                            {
                                var tmpObject = entity.packages.Where(p => p.packageId == newObject.packageId).FirstOrDefault();

                                tmpObject.updateDate = DateTime.Now;
                                tmpObject.updateUserId = newObject.updateUserId;


                                tmpObject.packageId = newObject.packageId;
                                tmpObject.packageName = newObject.packageName;
                                tmpObject.details = newObject.details;
                                tmpObject.branchCount = newObject.branchCount;
                                tmpObject.posCount = newObject.posCount;
                                tmpObject.userCount = newObject.userCount;
                                tmpObject.vendorCount = newObject.vendorCount;
                                tmpObject.customerCount = newObject.customerCount;
                                tmpObject.itemCount = newObject.itemCount;
                                tmpObject.salesInvCount = newObject.salesInvCount;
                                tmpObject.programId = newObject.programId;
                                tmpObject.verId = newObject.verId;
                           
                                tmpObject.isActive = newObject.isActive;
                                // tmpObject. createDate = newObject.createDate;

                                tmpObject.packageCode = newObject.packageCode;
                                tmpObject.storeCount = newObject.storeCount;
                           
                                // tmpObject. createUserId = newObject.createUserId;
                                tmpObject.notes = newObject.notes;


                                entity.SaveChanges();

                                message = tmpObject.packageId.ToString();
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
            //    packages newObject = JsonConvert.DeserializeObject<packages>(Object, new JsonSerializerSettings { DateParseHandling = DateParseHandling.None });
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
            //    if (newObject.programId == 0 || newObject.programId == null)
            //    {
            //        Nullable<int> id = null;
            //        newObject.programId = id;
            //    }
            //    if (newObject.verId == 0 || newObject.verId == null)
            //    {
            //        Nullable<int> id = null;
            //        newObject.verId = id;
            //    }



            //    try
            //    {
            //        using (incprogramsdbEntities entity = new incprogramsdbEntities())
            //        {
            //            var locationEntity = entity.Set<packages>();
            //            if (newObject.packageId == 0)
            //            {
            //                newObject.createDate = DateTime.Now;
            //                newObject.updateDate = DateTime.Now;
            //                newObject.updateUserId = newObject.createUserId;


            //                locationEntity.Add(newObject);
            //                entity.SaveChanges();
            //                message = newObject.packageId.ToString();
            //            }
            //            else
            //            {
            //                var tmpObject = entity.packages.Where(p => p.packageId == newObject.packageId).FirstOrDefault();

            //                tmpObject.updateDate = DateTime.Now;
            //                tmpObject.updateUserId = newObject.updateUserId;


            //                 tmpObject.packageId = newObject.packageId;
            //                        tmpObject. packageName = newObject.packageName;
            //                        tmpObject. details = newObject.details;
            //                        tmpObject. branchCount = newObject.branchCount;
            //                        tmpObject. posCount = newObject.posCount;
            //                        tmpObject. userCount = newObject.userCount;
            //                         tmpObject.vendorCount = newObject.vendorCount;
            //                        tmpObject. customerCount = newObject.customerCount;
            //                        tmpObject. itemCount = newObject.itemCount;
            //                        tmpObject. salesInvCount = newObject.salesInvCount;
            //                        tmpObject. programId = newObject.programId;
            //                        tmpObject. verId = newObject.verId;
            //                        tmpObject. price = newObject.price;
            //                        tmpObject. isActive = newObject.isActive;
            //                       // tmpObject. createDate = newObject.createDate;

            //                        tmpObject. packageCode = newObject.packageCode;
            //                        tmpObject. storeCount = newObject.storeCount;
            //                        tmpObject. endDate = newObject.endDate;
            //                         tmpObject.islimitDate = newObject.islimitDate;
            //                // tmpObject. createUserId = newObject.createUserId;
            //                tmpObject.notes = newObject.notes;


            //                entity.SaveChanges();

            //                message = tmpObject.packageId.ToString();
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
        public string Delete(string token)//int packageId, int userId, bool final
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
                int packageId = 0;
                int userId = 0;
                bool final = false;

                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "packageId")
                    {
                        packageId = int.Parse(c.Value);
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
                            packages objectDelete = entity.packages.Find(packageId);

                            entity.packages.Remove(objectDelete);
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
                            packages objectDelete = entity.packages.Find(packageId);

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
            //                packages objectDelete = entity.packages.Find(packageId);

            //                entity.packages.Remove(objectDelete);
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
            //                packages objectDelete = entity.packages.Find(packageId);

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
        [Route("isExistCode")]
        public string isExistCode(string token)//packageCode
        {
            string message = "";
            string result = "";
            token = TokenManager.readToken(HttpContext.Current.Request);
            var strP = TokenManager.GetPrincipal(token);
            if (strP != "0") //invalid authorization
            {
                return TokenManager.GenerateToken(strP);
            }
            else
            {
                string packageCode = "";


                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "packageCode")
                    {
                        packageCode = c.Value;
                    }


                }
                try
                {
                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        var List = entity.packages
                       .Where(u => u.packageCode == packageCode)
                       .Select(S => new
                       {

                           S.packageCode,

                       })
                                   .ToList();
                        if (List.Count > 0)
                        {
                            result = "1";
                        }
                        else
                        {
                            result = "0";
                        }

                        return TokenManager.GenerateToken(result);

                    }

                }
                catch
                {
                    return TokenManager.GenerateToken("0");
                }
            }



            //string result = "";
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
            //        var List = entity.packages
            //       .Where(u => u.packageCode == packageCode)
            //       .Select(S => new
            //       {

            //           S.packageCode,

            //       })
            //       .ToList();
            //        if (List.Count > 0)
            //        {
            //            result = "1";
            //        }
            //        else
            //        {
            //            result = "0";
            //        }
            //        if (List == null)
            //            return NotFound();
            //        else
            //            return Ok(result);
            //    }
            //}
            //else
            //    return NotFound();
        }

    }   
}