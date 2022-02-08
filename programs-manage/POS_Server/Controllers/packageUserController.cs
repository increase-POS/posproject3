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
                                    join A in entity.users on S.userId equals A.userId
                                    join C in entity.customers on S.customerId equals C.custId
                                    select new packageUserModel()
                                    {
                                        packageUserId = S.packageUserId,
                                        packageId = S.packageId,
                                        userId = S.userId,
                                        userName = A.name,
                                        userLastName = A.lastName,
                                        packageSaleCode = S.packageSaleCode,
                                        packageNumber = S.packageNumber,
                                        customerId = S.customerId,
                                        customerName = C.custname,
                                        customerLastName = C.lastName,
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
                                        isOnlineServer = S.isOnlineServer,
                                        countryPackageId = S.countryPackageId,
                                        canRenew = S.canRenew,
                                      canChngSer=S.canChngSer,
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
                        var row = (from S in entity.packageUser
                                   join A in entity.users on S.userId equals A.userId
                                   join C in entity.customers on S.customerId equals C.custId
                                   join P in entity.packages on S.packageId equals P.packageId
                                   join D in entity.countryPackageDate on S.countryPackageId equals D.Id
                                   join N in entity.countriesCodes on D.countryId equals N.countryId
                                   join PR in entity.programs on P.programId equals PR.programId
                                   join V in entity.versions on PR.programId equals V.programId
                                   where S.packageUserId == packageUserId
                                   select new packageUserModel()
                                   {
                                       packageUserId = S.packageUserId,
                                       packageId = S.packageId,
                                       userId = S.userId,
                                       userName = A.name,
                                       userLastName = A.lastName,
                                       packageSaleCode = S.packageSaleCode,
                                       packageNumber = S.packageNumber,
                                       customerId = S.customerId,
                                       customerName = C.custname,
                                       customerLastName = C.lastName,
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
                                       isOnlineServer = S.isOnlineServer,
                                       countryPackageId = S.countryPackageId,
                                       canRenew = S.canRenew,
                                       packageName = P.packageName,
                                       monthCount = D.monthCount,
                                       islimitDate = D.islimitDate,
                                       price = D.price,
                                       currency = N.currency,
                                       canChngSer = S.canChngSer,
                                       programName=PR.name,
                                       verName=V.name,
                                   }).FirstOrDefault();


                        return TokenManager.GenerateToken(row);

                    }

                }
                catch
                {
                    return TokenManager.GenerateToken("0");
                }
            }



        }

        public packageUser GetByID(int packageUserId)//int packageUserId
        {


            try
            {
                using (incprogramsdbEntities entity = new incprogramsdbEntities())
                {
                    var list = entity.packageUser.ToList();
                    var row = list.Where(S => S.packageUserId == packageUserId).Select(S =>
                     new packageUser()
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
                         isOnlineServer = S.isOnlineServer,
                         countryPackageId = S.countryPackageId,
                         canRenew = S.canRenew,

                         monthCount = S.monthCount,
                         oldPackageId = S.oldPackageId,

                         type = S.type,

                         isPayed = S.isPayed,

                         salesInvCount = S.salesInvCount,

                         totalsalesInvCount = S.totalsalesInvCount,

                         activatedate = S.activatedate,

                         isServerActivated = S.isServerActivated,

                         oldCountryPackageId = S.oldCountryPackageId,
                         canChngSer = S.canChngSer,
                     }).FirstOrDefault();

                    return row;

                }

            }
            catch (Exception ex)
            {
                packageUser newrow = new packageUser();
                newrow.notes = ex.ToString();
                return newrow;
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

                    if (newObject.countryPackageId == 0 || newObject.countryPackageId == null)
                    {
                        Nullable<int> id = null;
                        newObject.countryPackageId = id;
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
                                    string usercode;
                                    using (incprogramsdbEntities entity1 = new incprogramsdbEntities())
                                    {
                                        var tmpPackage = entity1.packages.Where(p => p.packageId == newObject.packageId).FirstOrDefault();
                                        packagecode = tmpPackage.packageCode;

                                        var tmpUser = entity1.users.Where(p => p.userId == newObject.userId).FirstOrDefault();
                                        usercode = tmpUser.code;
                                    }
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
                                tmpObject.isOnlineServer = newObject.isOnlineServer;
                                tmpObject.countryPackageId = newObject.countryPackageId;
                                tmpObject.canRenew = newObject.canRenew;
                                tmpObject.canChngSer = newObject.canChngSer;

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


        }


        public int Save(packageUser newObject)//string Object

        {

            int message = 0;

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

                if (newObject.countryPackageId == 0 || newObject.countryPackageId == null)
                {
                    Nullable<int> id = null;
                    newObject.countryPackageId = id;
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
                                string usercode;
                                using (incprogramsdbEntities entity1 = new incprogramsdbEntities())
                                {
                                    var tmpPackage = entity1.packages.Where(p => p.packageId == newObject.packageId).FirstOrDefault();
                                    packagecode = tmpPackage.packageCode;

                                    var tmpUser = entity1.users.Where(p => p.userId == newObject.userId).FirstOrDefault();
                                    usercode = tmpUser.code;
                                }
                                string timestamp = DateTime.Now.ToFileTime().ToString();
                                string id = newObject.packageUserId.ToString();
                                string strcode = packagecode + usercode + timestamp + id;
                                string finalcode = Md5Encription.EncodeHash(strcode);
                                newObject.packageSaleCode = finalcode;

                                entity.SaveChanges();
                            }

                            message = newObject.packageUserId;

                        }
                        else
                        {
                            var tmpObject = entity.packageUser.Where(p => p.packageUserId == newObject.packageUserId).FirstOrDefault();

                            tmpObject.updateDate = DateTime.Now;
                            //  tmpObject.packageUserId = newObject.packageUserId;
                            // tmpObject.packageId = newObject.packageId;
                            tmpObject.userId = newObject.userId;
                            // tmpObject.packageSaleCode = newObject.packageSaleCode;
                            //  tmpObject.packageNumber = newObject.packageNumber;
                            //    tmpObject.customerId = newObject.customerId;
                            tmpObject.customerServerCode = newObject.customerServerCode;
                            tmpObject.isBooked = newObject.isBooked;
                            tmpObject.notes = newObject.notes;
                            //   tmpObject.createDate = newObject.createDate;

                            //tmpObject.createUserId = newObject.createUserId;
                            tmpObject.updateUserId = newObject.updateUserId;
                            tmpObject.bookDate = newObject.bookDate;
                            //  tmpObject.isActive = newObject.isActive;
                            tmpObject.expireDate = newObject.expireDate;
                            tmpObject.isOnlineServer = newObject.isOnlineServer;
                            tmpObject.customerServerCode = newObject.customerServerCode;
                            tmpObject.salesInvCount = newObject.salesInvCount;
                            tmpObject.totalsalesInvCount = newObject.totalsalesInvCount;
                            tmpObject.monthCount = newObject.monthCount;
                            tmpObject.activatedate = newObject.activatedate;
                            tmpObject.isServerActivated = newObject.isServerActivated;
                            //tmpObject.oldCountryPackageId = newObject.oldCountryPackageId;
                            //  tmpObject.countryPackageId = newObject.countryPackageId;
                            //  tmpObject.isPayed = newObject.isPayed;

                            tmpObject.canRenew = newObject.canRenew;
                            tmpObject.canChngSer = newObject.canChngSer;
                            entity.SaveChanges();

                            message = tmpObject.packageUserId;
                        }
                        //  entity.SaveChanges();

                        return message;
                    }

                }


                catch
                {
                    return 0;
                }
            }
            else
            {
                return 0;
            }

        }



        // add or update location
        [HttpPost]
        [Route("MultiSave")]
#pragma warning disable CS1591 // Missing XML comment for publicly visible type or member
        public string MultiSave(string token)//string Object,int count
#pragma warning restore CS1591 // Missing XML comment for publicly visible type or member
        {



            int message = 0;

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
                    if (c.Type == "count")
                    {
                        count = int.Parse(c.Value);

                    }
                    if (c.Type == "Object")
                    {
                        Object = c.Value.Replace("\\", string.Empty);
                        Object = Object.Trim('"');
                        newObject = JsonConvert.DeserializeObject<packageUser>(Object, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });


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
                    if (newObject.countryPackageId == 0 || newObject.countryPackageId == null)
                    {
                        Nullable<int> id = null;
                        newObject.countryPackageId = id;
                    }
                    //
                    try
                    {


                        for (int i = 0; i < count; i++)
                        {
                            newObject.packageUserId = 0;
                            int res = packUserSave(newObject);
                            if (res > 0)
                            {
                                //   savedcount++;
                                message += res;

                            }
                        }


                        //

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

        private int packUserSave(packageUser newObject)
        {
            int message = 0;
            try
            {

                using (incprogramsdbEntities entity = new incprogramsdbEntities())
                {
                    var locationEntity = entity.Set<packageUser>();
                    if (newObject.packageUserId == 0)
                    {

                        int posCount = 0;
                        newObject.createDate = DateTime.Now;
                        newObject.updateDate = DateTime.Now;
                        newObject.updateUserId = newObject.createUserId;

                        locationEntity.Add(newObject);
                        entity.SaveChanges();

                        // get packageuser code

                        if (newObject.packageUserId > 0)
                        {
                            posSerialsController posmod = new posSerialsController();
                            string packagecode;
                            string usercode;

                            using (incprogramsdbEntities entity1 = new incprogramsdbEntities())
                            {
                                var tmpPackage = entity1.packages.Where(p => p.packageId == newObject.packageId).FirstOrDefault();
                                posCount = tmpPackage.posCount;
                            }
                            //   packagecode = tmpPackage.packageCode;
                            packagecode = newObject.packageId.ToString();
                            //  var tmpUser = entity1.users.Where(p => p.userId == newObject.userId).FirstOrDefault();
                            // usercode = tmpUser.userId;
                            usercode = newObject.userId.ToString();
                            //   }

                            string timestamp = DateTime.Now.ToFileTime().ToString();
                            string id = newObject.packageUserId.ToString();
                            string strcode = packagecode + usercode + timestamp + id;
                            string finalcode = Md5Encription.EncodeHash(strcode);
                            newObject.packageSaleCode = finalcode;

                            entity.SaveChanges();


                            // create pos serials
                            posSerials postemp = new posSerials();
                            postemp.createUserId = newObject.createUserId;
                            postemp.isActive = 1;

                            postemp.isBooked = false;
                            postemp.packageUserId = newObject.packageUserId;
                            // postemp.posDeviceCode = "";
                            // postemp.serialId
                            message = posmod.MultiserialSave(postemp, posCount);

                        }

                        //   message = newObject.packageUserId.ToString();

                    }

                }
            }
            catch
            {
                message = -1;
            }
            return message;
        }

        public string createServerActiveKey(packageUser newObject)
        {
            // get packageuser code

            if (newObject.packageUserId > 0)
            {
                posSerialsController posmod = new posSerialsController();
                string packagecode;
                string usercode;
                //packages tmpPackage = new packages();
                //using (incprogramsdbEntities entity1 = new incprogramsdbEntities())
                //{
                //   tmpPackage = entity1.packages.Where(p => p.packageId == newObject.packageId).FirstOrDefault();
                //   // posCount = tmpPackage.posCount;
                //}
                //packagecode = tmpPackage.packageCode;
                packagecode = newObject.packageId.ToString();
                //  var tmpUser = entity1.users.Where(p => p.userId == newObject.userId).FirstOrDefault();
                // usercode = tmpUser.userId;
                usercode = newObject.userId.ToString();
                //   }

                string timestamp = DateTime.Now.ToFileTime().ToString();
                string id = newObject.packageUserId.ToString();
                string strcode = packagecode + usercode + timestamp + id;
                string finalcode = Md5Encription.EncodeHash(strcode);
                newObject.packageSaleCode = finalcode;
                return finalcode;
                // entity.SaveChanges();


                //// create pos serials
                //posSerials postemp = new posSerials();
                //postemp.createUserId = newObject.createUserId;
                //postemp.isActive = 1;

                //postemp.isBooked = false;
                //postemp.packageUserId = newObject.packageUserId;
                //// postemp.posDeviceCode = "";
                //// postemp.serialId
                //message = posmod.MultiserialSave(postemp, posCount);

            }
            else
            {
                return "";
            }

        }

        public int createPosSerials(packageUser newObject, int posCount)
        {
            // get packageuser code
            int message = 0;
            if (newObject.packageUserId > 0)
            {
                posSerialsController posmod = new posSerialsController();

                // create pos serials
                posSerials postemp = new posSerials();
                postemp.createUserId = newObject.updateUserId;
                postemp.updateUserId = newObject.updateUserId;
                postemp.isActive = 0;

                postemp.isBooked = false;
                postemp.packageUserId = newObject.packageUserId;
                // postemp.posDeviceCode = "";
                // postemp.serialId
                message = posmod.MultiserialSave(postemp, posCount);
                return message;
            }
            else
            {
                return 0;
            }

        }


        public packageUser getPUbycode(string packageSaleCode)
        {

            packageUser packuserrow = new packageUser();
            try
            {



                using (incprogramsdbEntities entity = new incprogramsdbEntities())
                {
                    //get packageuser row
                    // List<packageUser> list = entity.packageUser.Where(u => u.packageSaleCode == packageSaleCode).ToList();

                    List<packageUser> list = entity.packageUser.Where(u => u.packageSaleCode.Equals(packageSaleCode)).ToList();
                    list = list.Where(u => u.packageSaleCode.Equals(packageSaleCode)).ToList();

                    if (list != null && list.Count > 0)
                    {
                        packuserrow = list
                                    .Select(S => new packageUser
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
                                        isOnlineServer = S.isOnlineServer,
                                        countryPackageId = S.countryPackageId,
                                        canRenew = S.canRenew,
                                        oldPackageId = S.oldPackageId,
                                        type = S.type,
                                        isPayed = S.isPayed,
                                        monthCount = S.monthCount,
                                        totalsalesInvCount = S.totalsalesInvCount,
                                        activatedate = S.activatedate,
                                        isServerActivated = S.isServerActivated,
                                        oldCountryPackageId = S.oldCountryPackageId,
                                        canChngSer=S.canChngSer,

                                        //islimitDate = D.islimitDate,


                                    }).FirstOrDefault();
                        return packuserrow;
                    }
                    else
                    {
                        packuserrow = new packageUser();
                        return packuserrow;
                    }
                }

            }
            catch
            {
                packuserrow = new packageUser();
                return packuserrow;
            }

        }

        
        public payOpModel getLastPayOp(int packageUserId)
        {

            payOpModel lastpayrow = new payOpModel();
            try
            {
                using (incprogramsdbEntities entity = new incprogramsdbEntities())
                {
                    lastpayrow = (from S in entity.payOp
                                  join A in entity.packageUser on S.packageUserId equals A.packageUserId
                                  join D in entity.countryPackageDate on S.countryPackageId equals D.Id
                                  join P in entity.packages on A.packageId equals P.packageId
                                  join U in entity.users on A.userId equals U.userId
                                  where S.packageUserId == packageUserId
                                  select new payOpModel()
                                  {
                                      payOpId = S.payOpId,
                                      Price = S.Price,
                                      code = S.code,
                                      type = S.type,
                                      packageUserId = S.packageUserId,
                                      createUserId = S.createUserId,
                                      updateUserId = S.updateUserId,
                                      createDate = S.createDate,
                                      updateDate = S.updateDate,
                                      notes = S.notes,
                                      totalnet = S.totalnet,
                                      countryPackageId = S.countryPackageId,// from payed row
                                      discountValue = S.discountValue,
                                      customerId = S.customerId,
                                      agentId = S.agentId,
                                      packageNumber = A.packageNumber,

                                      packageId = D.packageId,
                                      expireDate = A.expireDate,

                                  }).OrderBy(x => x.updateDate).ToList().Last();

                    return lastpayrow;

                }



            }
            catch
            {
                lastpayrow = new payOpModel();
                return lastpayrow;
            }

        }

        [HttpPost]
        [Route("ActivateServer")]
        public string ActivateServer(string token)
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

                string packageSaleCode = "";
                string customerServerCode = "";
                string activeState = "";

                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "packageSaleCode")
                    {
                        packageSaleCode = c.Value;
                    }
                    else if (c.Type == "customerServerCode")
                    {
                        customerServerCode = c.Value;

                    }
                    else if (c.Type == "activeState")
                    {
                        activeState = c.Value;

                    }

                }
                try
                {
                    packageUser packuserrow = new packageUser();
                    payOpModel lastpayrow = new payOpModel();
                    List<PosSerialSend> serialList = new List<PosSerialSend>();
                    SendDetail senditem = new SendDetail();
                    packagesSend package = new packagesSend();
                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        //get packageuser row
                        // List<packageUser> list = entity.packageUser.Where(u => u.packageSaleCode == packageSaleCode).ToList();
                        packuserrow = getPUbycode(packageSaleCode);
                        if (packuserrow.packageUserId > 0)
                        {
                            // return TokenManager.GenerateToken(row.packageUserId);
                            // get last payed row
                            lastpayrow = getLastPayOp(packuserrow.packageUserId);

                            if (lastpayrow.payOpId > 0)
                            {

                                //hererrrrrrrrr
                                // check if same method metho is 
                                if (packuserrow.isOnlineServer == true)
                                {
                                    // same method or first time



                                    //if (packuserfile.activeState == activeState || (packState.isServerActivated == false && packState.activatedate == null))
                                    //{

                                    //        // check if the command is same as the activate file or first time 


                                    //ssssssssssssssssss
                                    if (packuserrow.type == "chpk" && packuserrow.isPayed == false && packuserrow.canRenew == false)
                                    {

                                        // chpk not payed yet
                                        // dont activate until pay
                                        return TokenManager.GenerateToken("0");
                                    }
                                    else if (packuserrow.isActive == 1 && (packuserrow.isServerActivated == false || (packuserrow.isServerActivated == true && packuserrow.customerServerCode == customerServerCode))) //&&  row.expireDate==null 
                                    {

                                        //get poserials 
                                        programsController progcntrlr = new programsController();
                                        versionsController vercntrlr = new versionsController();
                                        programs prog = new programs();
                                        versions ver = new versions();
                                        packagesModel pack = new packagesModel();
                                        countryPackageDateController cpdCntrlr = new countryPackageDateController();
                                        countryPackageDate cpD = new countryPackageDate();
                                        posSerialsController serialmodel = new posSerialsController();

                                        List<string> serialposlist = new List<string>();

                                        serialList = serialmodel.GetBypackageUserId(packuserrow.packageUserId);

                                        //  serialposlist = serialList.Select(x => x.serial).ToList();
                                        // get package details

                                        packagesController packmodel = new packagesController();


                                        // get last package Id
                                        package = packmodel.GetByID((int)lastpayrow.packageId);
                                        pack = packmodel.GetPmByID((int)lastpayrow.packageId);
                                        prog = progcntrlr.GetByID((int)pack.programId);
                                        ver = vercntrlr.GetByID((int)pack.verId);
                                        cpD = cpdCntrlr.GetByID((int)lastpayrow.countryPackageId);


                                        // if(pack.isActive==1 && prog.isActive==1 && ver.isActive==1){
                                        package.programName = prog.name;
                                        package.verName = ver.name;
                                        package.packageSaleCode = packuserrow.packageSaleCode;
                                        package.expireDate = packuserrow.expireDate;
                                        package.isOnlineServer = packuserrow.isOnlineServer;
                                        package.packageNumber = packuserrow.packageNumber;
                                        package.totalsalesInvCount = packuserrow.totalsalesInvCount;
                                        package.packageName = pack.packageName;
                                        //packuserrow.countryPackageId
                                        package.islimitDate = cpD.islimitDate;
                                        package.isActive = (int)packuserrow.isActive;
                                        package.activatedate = DateTime.Now;// save on client if null 
                                        package.result = 1;                                  //   SendDetail senditem = new SendDetail();
                                        package.isServerActivated = packuserrow.isServerActivated;

                                        senditem.packageSend = package;
                                        senditem.PosSerialSendList = serialList;

                                        //    return TokenManager.GenerateToken(senditem);

                                        packuserrow.isServerActivated = true;
                                        packuserrow.customerServerCode = customerServerCode;
                                        if (packuserrow.activatedate == null)
                                        {
                                            packuserrow.activatedate = DateTime.Now;
                                        }

                                        packuserrow.totalsalesInvCount = 0;
                                        packuserrow.canRenew = false;

                                        //  save server hardware key
                                        int res = Save(packuserrow);
                                        return TokenManager.GenerateToken(senditem);
                                    }
                                    else
                                    {

                                        // serverID not match or package not active
                                        serialList = new List<PosSerialSend>();
                                        package = new packagesSend();

                                        senditem = new SendDetail();

                                        senditem.packageSend = package;
                                        senditem.PosSerialSendList = serialList;
                                        if (packuserrow.isActive != 1)
                                        {
                                            //package not active
                                            package.result = -2;
                                        }
                                        else if (!(packuserrow.isServerActivated == false || (packuserrow.isServerActivated == true && packuserrow.customerServerCode == customerServerCode)))
                                        {
                                            // serverID not match 
                                            package.result = -3;
                                        }

                                        senditem.packageSend = package;

                                        return TokenManager.GenerateToken(senditem);


                                        //if (packuserrow.canRenew == true)
                                        //{
                                        //    // write code here
                                        //    //  return TokenManager.GenerateToken(senditem);
                                        //}
                                        //else
                                        //{

                                        //    packagesSend ps = new packagesSend();
                                        //    ps.posCount = -2;
                                        //    senditem.packageSend = ps;
                                        //    //senditem.packageSend.posCount = -2;
                                        //    //  return TokenManager.GenerateToken(senditem);

                                        //}



                                    }
                                    //sssssssssssssssssssssssssssss
                                    //    }
                                    //    else
                                    //    {
                                    //        // the client command is different from activate file 
                                    //        package.result = -9;
                                    //        senditem.packageSend = package;
                                    //       return TokenManager.GenerateToken(senditem);
                                    //    }
                                    //}
                                    //else
                                    //{
                                    //    // the current updat is newr than the offline update
                                    //    package.result = -8;
                                    //    senditem.packageSend = package;
                                    // return TokenManager.GenerateToken(senditem);
                                    //}
                                }
                                else
                                {
                                    // method not match // online or offline
                                    package.result = -7;
                                    senditem.packageSend = package;

                                    return TokenManager.GenerateToken(senditem);
                                }

                                //   return TokenManager.GenerateToken(senditem);
                            }
                            else
                            {
                                // not payed 

                                serialList = new List<PosSerialSend>();
                                package = new packagesSend();

                                senditem = new SendDetail();

                                senditem.packageSend = package;
                                senditem.PosSerialSendList = serialList;

                                package.result = -4;



                                senditem.packageSend = package;

                                return TokenManager.GenerateToken(senditem);

                            }
                        }
                        else
                        {
                            //serial not found
                            serialList = new List<PosSerialSend>();
                            package = new packagesSend();

                            senditem = new SendDetail();

                            senditem.packageSend = package;
                            senditem.PosSerialSendList = serialList;

                            package.result = -5;



                            senditem.packageSend = package;

                            return TokenManager.GenerateToken(senditem);


                            //senditem = new SendDetail();
                            //packagesSend ps = new packagesSend();
                            //ps.posCount = -3;
                            //senditem.packageSend = ps;

                            //// senditem.packageSend.posCount = -3;
                            //return TokenManager.GenerateToken(senditem);
                        }


                    }

                }
                catch (Exception ex)
                {
                    //error
                    return TokenManager.GenerateToken("0");
                }
                //   return TokenManager.GenerateToken("00");
            }



        }


        [HttpPost]
        [Route("checkconn")]
        public string checkconn(string token)
        {
            token = TokenManager.readToken(HttpContext.Current.Request); var strP = TokenManager.GetPrincipal(token);
            if (strP != "0") //invalid authorization
            {
                return TokenManager.GenerateToken(strP);
            }
            else
            {
                {
                    int id = 0;
                    IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                    foreach (Claim c in claims)
                    {
                        if (c.Type == "id")
                        {
                            id = int.Parse(c.Value);
                        }
                    }
                    if (id == 1)
                    {
                        return TokenManager.GenerateToken(2.ToString());
                    }
                    else
                    {
                        return TokenManager.GenerateToken(0.ToString());
                    }

                }
            }
        }


        [HttpPost]
        [Route("GetLastNumOfCode")]
        public string GetLastNumOfCode(string token)
        {
            token = TokenManager.readToken(HttpContext.Current.Request);
            string message = "";
            var strP = TokenManager.GetPrincipal(token);
            if (strP != "0") //invalid authorization
            {
                return TokenManager.GenerateToken(strP);
            }
            else
            {
                string type = "";
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "type")
                    {
                        type = c.Value;
                    }
                }
                List<string> numberList;
                int lastNum = 0;
                using (incprogramsdbEntities entity = new incprogramsdbEntities())
                {
                    numberList = entity.packageUser.Where(b => b.packageNumber.Contains(type + "-")).Select(b => b.packageNumber).ToList();

                    for (int i = 0; i < numberList.Count; i++)
                    {
                        string packageNumber = numberList[i];
                        string s = packageNumber.Substring(packageNumber.LastIndexOf("-") + 1);
                        numberList[i] = s;
                    }
                    if (numberList.Count > 0)
                    {
                        numberList.Sort();
                        lastNum = int.Parse(numberList[numberList.Count - 1]);
                    }
                }
                message = lastNum.ToString();
                return TokenManager.GenerateToken(message);
            }
        }

        [HttpPost]
        [Route("GetLastNum")]
        public string GetLastNum(string token)
        {
            token = TokenManager.readToken(HttpContext.Current.Request);
            var strP = TokenManager.GetPrincipal(token);
            if (strP != "0") //invalid authorization
            {
                return TokenManager.GenerateToken(strP);
            }
            else
            {
                string packageCode = "";
                int agentId = 0;
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "packageCode")
                    {
                        packageCode = c.Value;
                    }
                    else if (c.Type == "agentId")
                    {
                        agentId = int.Parse(c.Value);
                    }
                }
                List<string> numberList;
                int lastNum = 0;
                using (incprogramsdbEntities entity = new incprogramsdbEntities())
                {
                    numberList = entity.packageUser.Where(b => b.packageNumber.Contains(packageCode + "-") && b.userId == agentId).Select(b => b.packageNumber).ToList();

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
        }


        [HttpPost]
        [Route("packageBook")]
#pragma warning disable CS1591 // Missing XML comment for publicly visible type or member
        public string packageBook(string token)//string Object
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
                packageUserModel modelObject = new packageUserModel();
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "Object")
                    {
                        Object = c.Value.Replace("\\", string.Empty);
                        Object = Object.Trim('"');
                        newObject = JsonConvert.DeserializeObject<packageUser>(Object, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });
                        //modelObject = JsonConvert.DeserializeObject<packageUserModel>(Object, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });
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

                    if (newObject.countryPackageId == 0 || newObject.countryPackageId == null)
                    {
                        Nullable<int> id = null;
                        newObject.countryPackageId = id;
                    }

                    try
                    {
                        //////////////////////////////
                        using (incprogramsdbEntities entity = new incprogramsdbEntities())
                        {

                            //string packagecode;
                            //string usercode;
                            packages tmpPackage = new packages();
                            countryPackageDate tmpcpd = new countryPackageDate();
                            packageUser oldPU = new packageUser();
                            packages oldPackage = new packages();
                            posSerials serialmodel = new posSerials();
                            List<posSerials> serialList = new List<posSerials>();
                            posSerialsController serCntrlr = new posSerialsController();
                            using (incprogramsdbEntities entity1 = new incprogramsdbEntities())
                            {
                                tmpPackage = entity1.packages.Where(p => p.packageId == newObject.packageId).FirstOrDefault();
                                if (newObject.packageUserId > 0)
                                {
                                    oldPU = entity.packageUser.Where(p => p.packageUserId == newObject.oldPackageId).FirstOrDefault();
                                    oldPackage = entity1.packages.Where(p => p.packageId == newObject.oldPackageId).FirstOrDefault();

                                }

                                tmpcpd = entity1.countryPackageDate.Where(p => p.Id == newObject.countryPackageId).FirstOrDefault();


                            }
                            var puEntity = entity.Set<packageUser>();
                            if (newObject.packageUserId == 0 && newObject.oldPackageId == 0)
                            {

                                // first time book
                                newObject.createDate = DateTime.Now;
                                newObject.updateDate = DateTime.Now;
                                newObject.updateUserId = newObject.createUserId;

                                newObject.packageSaleCode = "";

                                newObject.customerServerCode = "";
                                newObject.isBooked = true;
                                newObject.bookDate = DateTime.Now;

                                //newObject.isActive = 1;

                                newObject.oldCountryPackageId = 0;
                                if (tmpcpd.islimitDate == true)
                                {
                                    DateTime dt = (DateTime)newObject.bookDate;
                                    newObject.expireDate = dt.AddMonths(tmpcpd.monthCount);
                                }
                                else
                                {
                                    DateTime dt = (DateTime)newObject.bookDate;
                                    newObject.expireDate = dt.AddMonths(12);
                                }
                                newObject.canRenew = false;//change on pay
                                newObject.type = "np";
                                newObject.isPayed = false;//change on pay

                                newObject.salesInvCount = 0;//change  on pay
                                newObject.monthCount = 0;//change  on pay
                                newObject.totalsalesInvCount = 0;
                                newObject.activatedate = null;// at activate
                                newObject.isServerActivated = false;//at activate

                                puEntity.Add(newObject);
                                entity.SaveChanges();
                                // create activate key for server
                                if (newObject.packageUserId > 0)
                                {
                                    newObject.packageSaleCode = createServerActiveKey(newObject);
                                    newObject.oldPackageId = 0;
                                }
                                entity.SaveChanges();
                                // create pos serials
                                int countpos = 0;
                                if (tmpPackage.posCount != -1)
                                {
                                    countpos = tmpPackage.posCount;
                                }
                                else
                                {
                                    //unlimited 
                                    countpos = 500;

                                }
                                int res = createPosSerials(newObject, countpos);
                                if (res == countpos)
                                {
                                    message = newObject.packageUserId.ToString();
                                }
                                else
                                {
                                    message = "0";
                                }


                            }

                            else if (newObject.packageUserId > 0 && newObject.oldPackageId == newObject.packageId)
                            {
                                // upgrade: chang  period +rn

                                var tmpObject = entity.packageUser.Where(p => p.packageUserId == newObject.packageUserId).FirstOrDefault();

                                tmpObject.updateDate = DateTime.Now;
                                // tmpObject.packageUserId = newObject.packageUserId;
                                // tmpObject.packageId = newObject.packageId;
                                // tmpObject.userId = newObject.userId;
                                // tmpObject.packageSaleCode = newObject.packageSaleCode;
                                // tmpObject.packageNumber = newObject.packageNumber;
                                // tmpObject.customerId = newObject.customerId;
                                //   tmpObject.customerServerCode = newObject.customerServerCode;
                                tmpObject.isBooked = true;
                                tmpObject.notes = newObject.notes;

                                tmpObject.updateUserId = newObject.updateUserId;
                                // tmpObject.bookDate = newObject.bookDate;
                                tmpObject.isActive = newObject.isActive;
                                tmpObject.canChngSer = newObject.canChngSer;
                                //   tmpObject.expireDate = newObject.expireDate;//on pay

                                tmpObject.isOnlineServer = newObject.isOnlineServer;

                                tmpObject.countryPackageId = newObject.countryPackageId;
                                tmpObject.oldCountryPackageId = newObject.oldCountryPackageId;
                                //    tmpObject.canRenew =false;//stay on last payed  state  then change  on pay or activate 
                                tmpObject.oldPackageId = newObject.oldPackageId;

                                tmpObject.type = "chpr";
                                tmpObject.isPayed = false;
                                //newObject.salesInvCount = 0;//stay on last payed  state  then change  on pay
                                //newObject.monthCount = 0;//change  on pay
                                entity.SaveChanges();

                                message = tmpObject.packageUserId.ToString();


                            }
                            else if (newObject.packageUserId > 0 && newObject.oldPackageId != newObject.packageId)
                            {
                                // change packege

                                var tmpObject = entity.packageUser.Where(p => p.packageUserId == newObject.packageUserId).FirstOrDefault();

                                tmpObject.updateDate = DateTime.Now;
                                // tmpObject.packageUserId = newObject.packageUserId;
                                tmpObject.packageId = newObject.packageId;
                                // tmpObject.userId = newObject.userId;
                                //  tmpObject.packageSaleCode = newObject.packageSaleCode;
                                if (newObject.packageUserId > 0)
                                {
                                    newObject.packageSaleCode = createServerActiveKey(newObject);
                                }
                                // tmpObject.packageNumber = newObject.packageNumber;
                                // tmpObject.customerId = newObject.customerId;
                                //   tmpObject.customerServerCode = newObject.customerServerCode;
                                tmpObject.oldCountryPackageId = newObject.oldCountryPackageId;
                                tmpObject.isBooked = true;
                                tmpObject.notes = newObject.notes;

                                tmpObject.updateUserId = newObject.updateUserId;
                                // start new book date
                                tmpObject.bookDate = DateTime.Now;
                                if (tmpcpd.islimitDate == true)
                                {
                                    // dbPU.monthCount += tmpcpd.monthCount;
                                    tmpObject.monthCount = tmpcpd.monthCount;
                                    if (tmpObject.expireDate != null)
                                    {
                                        DateTime dt = (DateTime)tmpObject.bookDate;
                                        tmpObject.expireDate = dt.AddMonths(tmpObject.monthCount);


                                    }
                                }
                                tmpObject.monthCount = 0;
                                tmpObject.salesInvCount = 0;

                                tmpObject.isActive = newObject.isActive;
                                tmpObject.canChngSer = newObject.canChngSer;
                                // tmpObject.expireDate = newObject.expireDate;//old -change on pay
                                tmpObject.isOnlineServer = newObject.isOnlineServer;

                                tmpObject.countryPackageId = newObject.countryPackageId;

                                tmpObject.canRenew = false;// chang on pay
                                tmpObject.oldPackageId = newObject.oldPackageId;
                                tmpObject.type = "chpk";

                                tmpObject.isPayed = false;
                                // tmpObject.activatedate = null;// old activate
                                //newObject.activatedate = null;// old activate
                                tmpObject.isServerActivated = false;//at activate
                                entity.SaveChanges();
                                ////
                                //create  Pos serials
                                // pos create  has 4 state

                                if (oldPackage.posCount == -1 && tmpPackage.posCount != -1)
                                {

                                    ////1
                                    // get serialscount
                                    int newserialscount = 0;
                                    serialList = entity.posSerials.Where(p => p.packageUserId == tmpObject.packageUserId).ToList();

                                    int oldcount = serialList.Count;
                                    // set old serials to isActive =0 
                                    foreach (posSerials row in serialList)
                                    {
                                        row.isActive = 0;
                                        row.updateDate = tmpObject.updateDate;
                                        row.updateUserId = tmpObject.updateUserId;
                                        entity.SaveChanges();

                                    }


                                    // if unlimited srials count les than new package serials count create new serials
                                    if (oldcount < tmpPackage.posCount)
                                    {
                                        newserialscount = tmpPackage.posCount - oldcount;
                                        int res = createPosSerials(tmpObject, newserialscount);
                                        if (res == newserialscount)
                                        {
                                            message = tmpObject.packageUserId.ToString();
                                        }
                                        else
                                        {
                                            message = "0";
                                        }

                                    }


                                    //// disactive old serial then create new serials for new package
                                    //serialmodel = entity.posSerials.Where(p => p.packageUserId == newObject.packageUserId && p.unLimited == true).LastOrDefault();
                                    //serialmodel.isActive = -1;
                                    //serialmodel.updateDate = newObject.updateDate;
                                    //serialmodel.updateUserId = newObject.updateUserId;
                                    //entity.SaveChanges();
                                    //int countpos = 0;
                                    //if (tmpPackage.posCount != -1)
                                    //{
                                    //    countpos = tmpPackage.posCount;
                                    //}
                                    //else
                                    //{
                                    //    countpos = 1;

                                    //}

                                    //int res = createPosSerials(tmpObject, countpos);
                                    //if (res == countpos)
                                    //{
                                    //    message = newObject.packageUserId.ToString();
                                    //}
                                    //else
                                    //{
                                    //    message = "0";
                                    //}



                                }
                                else if (oldPackage.posCount != -1 && tmpPackage.posCount == -1)
                                {
                                    //2
                                    // delete old serials 
                                    serialList = entity.posSerials.Where(p => p.packageUserId == tmpObject.packageUserId).ToList();

                                    int oldcount = serialList.Count;


                                    // set old serials is Active =0;
                                    foreach (posSerials row in serialList)
                                    {
                                        row.isActive = 0;
                                        row.updateDate = tmpObject.updateDate;
                                        row.updateUserId = tmpObject.updateUserId;
                                        entity.SaveChanges();
                                    }

                                    // who is greatier
                                    int newcount = 0;
                                    if (oldPackage.posCount >= 500)
                                    {
                                        // create new serials count ==oldPackage.posCount
                                        newcount = oldPackage.posCount;


                                    }
                                    else if (oldPackage.posCount < 500)
                                    {
                                        // create new serials count ==500

                                        newcount = 500;

                                    }
                                    // create new serials 
                                    int res = createPosSerials(tmpObject, newcount);
                                    if (res == newcount)
                                    {
                                        message = tmpObject.packageUserId.ToString();
                                    }
                                    else
                                    {
                                        message = "0";
                                    }
                                    //
                                    //// delete old serials then create one unlimited serial
                                    //serialList = entity.posSerials.Where(p => p.packageUserId == newObject.packageUserId).ToList();
                                    //foreach (posSerials row in serialList)
                                    //{
                                    //    row.isActive = -1;
                                    //    row.updateDate = newObject.updateDate;
                                    //    row.updateUserId = newObject.updateUserId;
                                    //    entity.SaveChanges();
                                    //}
                                    //serialmodel = new posSerials();
                                    //serialmodel.unLimited = true;
                                    //serialmodel.isActive = 0;
                                    //serialmodel.isBooked = false;
                                    //serialmodel.packageUserId = tmpObject.packageUserId;
                                    //serialmodel.createUserId = tmpObject.updateUserId;
                                    //serialmodel.updateUserId = tmpObject.updateUserId;
                                    //string res = serCntrlr.posSerialSave(serialmodel);
                                    //int countpos = 0;

                                    ////   int ress = createPosSerials(tmpObject, countpos);
                                    //if (int.Parse(res) > 0)
                                    //{
                                    //    message = newObject.packageUserId.ToString();

                                    //}
                                    //else
                                    //{
                                    //    message = "0";


                                    //}


                                }
                                else if (oldPackage.posCount != -1 && tmpPackage.posCount != -1)
                                {
                                    if (oldPackage.posCount > tmpPackage.posCount)
                                    {
                                        //3
                                        // is active =0 and wait until activate new serials manualy
                                        serialList = entity.posSerials.Where(p => p.packageUserId == newObject.packageUserId && p.isActive != -1).ToList();
                                        foreach (posSerials row in serialList)
                                        {
                                            row.isActive = 0;
                                            row.updateDate = newObject.updateDate;
                                            row.updateUserId = newObject.updateUserId;
                                            entity.SaveChanges();
                                        }

                                    }
                                    else if (oldPackage.posCount < tmpPackage.posCount)
                                    {
                                        //4
                                        // set old serials to isActive =0 then creat new serials where count = newcount-oldcount
                                        serialList = entity.posSerials.Where(p => p.packageUserId == tmpObject.packageUserId && p.isActive != -1).ToList();
                                        foreach (posSerials row in serialList)
                                        {
                                            row.isActive = 0;
                                            row.updateDate = newObject.updateDate;
                                            row.updateUserId = newObject.updateUserId;
                                            entity.SaveChanges();
                                        }
                                        int countpos = 0;
                                        countpos = tmpPackage.posCount - oldPackage.posCount;
                                        int res = createPosSerials(tmpObject, countpos);
                                        if (res == countpos)
                                        {
                                            message = newObject.packageUserId.ToString();
                                        }
                                        else
                                        {
                                            message = "0";
                                        }
                                    }
                                    else
                                    {
                                        // equals oldPackage.posCount = tmpPackage.posCount
                                        serialList = entity.posSerials.Where(p => p.packageUserId == tmpObject.packageUserId && p.isActive != -1).ToList();
                                        foreach (posSerials row in serialList)
                                        {
                                            row.isActive = 0;
                                            row.updateDate = newObject.updateDate;
                                            row.updateUserId = newObject.updateUserId;
                                            entity.SaveChanges();
                                        }
                                    }


                                }
                                else
                                {
                                    // equals oldPackage.posCount = tmpPackage.posCount=-1 unlimited


                                    serialList = entity.posSerials.Where(p => p.packageUserId == tmpObject.packageUserId).ToList();
                                    int oldcount = serialList.Count;

                                    foreach (posSerials row in serialList)
                                    {
                                        row.isActive = 0;
                                        row.updateDate = newObject.updateDate;
                                        row.updateUserId = newObject.updateUserId;
                                        entity.SaveChanges();
                                    }
                                    if (oldPackage.posCount == -1 && tmpPackage.posCount == -1)
                                    {
                                        // same as new package is -1
                                        // who is greatier
                                        int newcount = 0;
                                        if (oldcount >= 500)
                                        {
                                            // create new serials count ==oldPackage.posCount
                                            newcount = oldcount;


                                        }
                                        else if (oldcount < 500)
                                        {
                                            // create new serials count ==500

                                            newcount = 500;

                                        }
                                        // create new serials 
                                        int res = createPosSerials(tmpObject, newcount);
                                        if (res == newcount)
                                        {
                                            message = tmpObject.packageUserId.ToString();
                                        }
                                        else
                                        {
                                            message = "0";
                                        }

                                    }


                                }




                                message = tmpObject.packageUserId.ToString();
                            }
                            else
                            {
                                // error
                                return TokenManager.GenerateToken("0");
                            }


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
        [Route("packagePay")]
#pragma warning disable CS1591 // Missing XML comment for publicly visible type or member
        public string packagePay(string token)//string Object
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
                try
                {
                    string Object = "";
                    string Object2 = "";
                    packageUser newObject = null;
                    payOp newpay = new payOp();

                    packageUserModel modelObject = new packageUserModel();
                    IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                    foreach (Claim c in claims)
                    {
                        if (c.Type == "Object")
                        {
                            Object = c.Value.Replace("\\", string.Empty);
                            Object = Object.Trim('"');
                            newObject = JsonConvert.DeserializeObject<packageUser>(Object, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });
                            //modelObject = JsonConvert.DeserializeObject<packageUserModel>(Object, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });

                        }
                        else if (c.Type == "PayObject")
                        {
                            Object2 = c.Value.Replace("\\", string.Empty);
                            Object2 = Object2.Trim('"');
                            newpay = JsonConvert.DeserializeObject<payOp>(Object2, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });
                            //modelObject = JsonConvert.DeserializeObject<packageUserModel>(Object, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });

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

                        if (newObject.countryPackageId == 0 || newObject.countryPackageId == null)
                        {
                            Nullable<int> id = null;
                            newObject.countryPackageId = id;
                        }

                        try
                        {
                            //////////////////////////////

                            using (incprogramsdbEntities entity = new incprogramsdbEntities())
                            {

                                //string packagecode;
                                //string usercode;
                                packages tmpPackage = new packages();
                                packages oldPackage = new packages();
                                countryPackageDate tmpcpd = new countryPackageDate();
                                //  packageUser oldPU = new packageUser();
                                packageUser dbPU = new packageUser();
                                payOpController paycntrlr = new payOpController();
                                int payopId = 0;
                                dbPU = entity.packageUser.Where(p => p.packageUserId == newObject.packageUserId).FirstOrDefault();

                                using (incprogramsdbEntities entity1 = new incprogramsdbEntities())
                                {
                                    tmpPackage = entity1.packages.Where(p => p.packageId == newObject.packageId).FirstOrDefault();
                                    //  oldPU = entity1.packageUser.Where(p => p.packageUserId == newObject.oldPackageId).FirstOrDefault();
                                    oldPackage = entity1.packages.Where(p => p.packageId == newObject.oldPackageId).FirstOrDefault();

                                    //  dbPU = entity.packageUser.Where(p => p.packageUserId == newObject.packageUserId).FirstOrDefault();

                                    tmpcpd = entity1.countryPackageDate.Where(p => p.Id == newObject.countryPackageId).FirstOrDefault();

                                }

                                var puEntity = entity.Set<packageUser>();
                                if (dbPU.packageUserId > 0 && dbPU.oldPackageId == 0 && dbPU.type == "np" && dbPU.isPayed == false)
                                {

                                    // first time booked and now will pay
                                    // newObject.createDate = DateTime.Now;
                                    newpay.expireDate = dbPU.expireDate;
                                    int res = paycntrlr.Save(newpay);
                                    payopId = res;
                                    dbPU.updateDate = DateTime.Now;
                                    dbPU.updateUserId = newObject.updateUserId;


                                    //
                                    //  newObject.customerServerCode = "";
                                    //dbPU.isBooked = false;
                                    dbPU.notes = newObject.notes;

                                    //  dbPU.bookDate = null;
                                    //  dbPU.isActive = 1;
                                    //   dbPU.expireDate = null;
                                    dbPU.canRenew = true;
                                    dbPU.oldPackageId = (int)dbPU.packageId;

                                    dbPU.type = "np";
                                    dbPU.isPayed = true;

                                    dbPU.salesInvCount = tmpPackage.salesInvCount;//change  on pay then change on activat to 0
                                    dbPU.totalsalesInvCount = tmpPackage.salesInvCount;// change on activat to 0
                                                                                       //   dbPU.monthCount = tmpcpd.monthCount;//change  on pay  then change on activat to 0
                                                                                       //  puEntity.Add(newObject);
                                    dbPU.oldCountryPackageId = dbPU.countryPackageId;
                                    entity.SaveChanges();

                                    message = newObject.packageUserId.ToString();


                                }
                                else if (dbPU.packageUserId > 0 && dbPU.oldPackageId == dbPU.packageId && dbPU.countryPackageId == dbPU.oldCountryPackageId)
                                {
                                    // renew same period 

                                    // var tmpObject = entity.packageUser.Where(p => p.packageUserId == newObject.packageUserId).FirstOrDefault();



                                    dbPU.updateDate = DateTime.Now;
                                    // tmpObject.packageUserId = newObject.packageUserId;
                                    // tmpObject.packageId = newObject.packageId;
                                    // tmpObject.userId = newObject.userId;
                                    //   tmpObject.packageSaleCode = newObject.packageSaleCode;
                                    // tmpObject.packageNumber = newObject.packageNumber;
                                    // tmpObject.customerId = newObject.customerId;
                                    //   tmpObject.customerServerCode = newObject.customerServerCode;
                                    dbPU.isBooked = true;
                                    dbPU.notes = newObject.notes;

                                    dbPU.updateUserId = newObject.updateUserId;
                                    // tmpObject.bookDate = newObject.bookDate;
                                    //    dbPU.isActive = 1;

                                    dbPU.isOnlineServer = newObject.isOnlineServer;

                                    //   dbPU.countryPackageId = newObject.countryPackageId;


                                    dbPU.oldPackageId = (int)dbPU.packageId;
                                    dbPU.type = "rn";
                                    dbPU.isPayed = true;

                                    if (dbPU.canRenew == true)
                                    {
                                        if (tmpPackage.salesInvCount != -1)
                                        {
                                            //dbPU.salesInvCount += tmpPackage.salesInvCount;//change  on pay
                                            //dbPU.totalsalesInvCount += tmpPackage.salesInvCount;
                                            dbPU.salesInvCount = tmpPackage.salesInvCount;//change  on pay
                                            dbPU.totalsalesInvCount = tmpPackage.salesInvCount;
                                        }
                                        else
                                        {
                                            //unlimited
                                            dbPU.salesInvCount = tmpPackage.salesInvCount;//change  on pay

                                        }
                                        //date
                                        if (tmpcpd.islimitDate == true)
                                        {
                                            // dbPU.monthCount += tmpcpd.monthCount;
                                            dbPU.monthCount += tmpcpd.monthCount;
                                            if (dbPU.expireDate != null)
                                            {
                                                DateTime dt = (DateTime)dbPU.expireDate;
                                                dbPU.expireDate = dt.AddMonths(dbPU.monthCount);
                                                dbPU.monthCount = 0;

                                            }
                                        }

                                        dbPU.monthCount = 0;

                                        //  dbPU.monthCount += tmpcpd.monthCount;//change  on pay
                                    }
                                    else
                                    {
                                        //  canRenew=false
                                        if (tmpPackage.salesInvCount != -1)
                                        {
                                            //dbPU.salesInvCount += tmpPackage.salesInvCount;//change  on pay
                                            //dbPU.totalsalesInvCount += tmpPackage.salesInvCount;
                                            dbPU.salesInvCount = tmpPackage.salesInvCount;//change  on pay
                                            dbPU.totalsalesInvCount = tmpPackage.salesInvCount;
                                        }
                                        else
                                        {
                                            //unlimited
                                            dbPU.salesInvCount = tmpPackage.salesInvCount;//change  on pay

                                        }

                                        // increase expire date
                                        if (tmpcpd.islimitDate == true)
                                        {
                                            // dbPU.monthCount += tmpcpd.monthCount;
                                            dbPU.monthCount += tmpcpd.monthCount;
                                            if (dbPU.expireDate != null)
                                            {
                                                DateTime dt = (DateTime)dbPU.expireDate;
                                                dbPU.expireDate = dt.AddMonths(dbPU.monthCount);
                                                dbPU.monthCount = 0;

                                            }
                                        }

                                        dbPU.monthCount = 0;


                                    }
                                    dbPU.canRenew = true;
                                    // update expiredate
                                    newpay.expireDate = dbPU.expireDate;
                                    newpay.type = dbPU.type;
                                    payopId = paycntrlr.Save(newpay);
                                    if (payopId > 0)
                                    {
                                        entity.SaveChanges();

                                        message = dbPU.packageUserId.ToString();
                                    }
                                    else
                                    {
                                        message = "0";
                                    }


                                }
                                else if (dbPU.packageUserId > 0 && dbPU.oldPackageId == dbPU.packageId && dbPU.type == "chpr" && dbPU.isPayed == false)
                                {
                                    // chang  period 
                                    //change

                                    //  int res = paycntrlr.Save(newpay);

                                    dbPU.updateDate = DateTime.Now;
                                    // tmpObject.packageUserId = newObject.packageUserId;
                                    // tmpObject.packageId = newObject.packageId;
                                    // tmpObject.userId = newObject.userId;
                                    //   tmpObject.packageSaleCode = newObject.packageSaleCode;
                                    // tmpObject.packageNumber = newObject.packageNumber;
                                    // tmpObject.customerId = newObject.customerId;
                                    //   tmpObject.customerServerCode = newObject.customerServerCode;
                                    dbPU.isBooked = true;
                                    dbPU.notes = newObject.notes;

                                    dbPU.updateUserId = newObject.updateUserId;
                                    // tmpObject.bookDate = newObject.bookDate;
                                    //  dbPU.isActive = 1;
                                    //   tmpObject.expireDate = newObject.expireDate;//on pay
                                    //   dbPU.isOnlineServer = newObject.isOnlineServer;

                                    //   dbPU.countryPackageId = newObject.countryPackageId;


                                    dbPU.oldPackageId = (int)dbPU.packageId;


                                    // update expiredate
                                    if (tmpcpd.islimitDate == true)
                                    {
                                        // dbPU.monthCount += tmpcpd.monthCount;
                                        dbPU.monthCount += tmpcpd.monthCount;
                                        if (dbPU.expireDate != null)
                                        {
                                            DateTime dt = (DateTime)dbPU.expireDate;
                                            dbPU.expireDate = dt.AddMonths(dbPU.monthCount);
                                            dbPU.monthCount = 0;

                                        }
                                    }
                                    dbPU.canRenew = true;
                                    if (dbPU.countryPackageId == dbPU.oldCountryPackageId)
                                    {
                                        dbPU.type = "rn";
                                        newpay.type = "rn";
                                    }
                                    else
                                    {
                                        dbPU.type = "chpr";
                                        newpay.type = "chpr";

                                    }

                                    dbPU.isPayed = true;
                                    // chang salesInvCount to add it on activation
                                    //if (tmpPackage.salesInvCount != -1)
                                    //{
                                    //    dbPU.salesInvCount = 0;//change  on pay
                                    //    dbPU.totalsalesInvCount += tmpPackage.salesInvCount;
                                    //}
                                    //else
                                    //{
                                    //unlimited
                                    dbPU.salesInvCount = tmpPackage.salesInvCount;//change  on pay

                                    //}

                                    dbPU.oldCountryPackageId = dbPU.countryPackageId;

                                    newpay.expireDate = dbPU.expireDate;

                                    payopId = paycntrlr.Save(newpay);
                                    if (payopId > 0)
                                    {
                                        entity.SaveChanges();

                                        message = dbPU.packageUserId.ToString();
                                    }
                                    else
                                    {
                                        message = "0";
                                    }


                                }
                                else if (dbPU.packageUserId > 0 && dbPU.oldPackageId != dbPU.packageId && dbPU.type == "chpk" && dbPU.isPayed == false)
                                {
                                    // change packege


                                    //     int res = paycntrlr.Save(newpay);

                                    dbPU.updateDate = DateTime.Now;
                                    dbPU.updateUserId = newObject.updateUserId;
                                    // create server activation key and pos serials
                                    dbPU.packageSaleCode = createServerActiveKey(dbPU);

                                    //
                                    //  newObject.customerServerCode = "";
                                    // dbPU.isBooked = false;
                                    dbPU.notes = newObject.notes;

                                    // dbPU.bookDate = null;
                                    //  dbPU.isActive = 1;
                                    //dbPU.expireDate changed on upgrade
                                    //if (tmpcpd.islimitDate == true)
                                    //{
                                    //    // dbPU.monthCount += tmpcpd.monthCount;
                                    //    dbPU.monthCount = tmpcpd.monthCount;
                                    //    if (dbPU.expireDate != null)
                                    //    {
                                    //        DateTime dt = (DateTime)dbPU.expireDate;
                                    //        dbPU.expireDate = dt.AddMonths(dbPU.monthCount);
                                    //        dbPU.monthCount = 0;

                                    //    }
                                    //}
                                    // chang salesInvCount to add it on activation
                                    dbPU.monthCount = 0;
                                    //if (tmpPackage.salesInvCount != -1)
                                    //{
                                    //    //change  on pay
                                    //    dbPU.totalsalesInvCount += tmpPackage.salesInvCount;
                                    //    dbPU.salesInvCount = 0;
                                    //}
                                    //else
                                    //{
                                    //unlimited
                                    dbPU.salesInvCount = tmpPackage.salesInvCount;//change  on pay -1
                                                                                  //  dbPU.totalsalesInvCount = tmpPackage.salesInvCount;
                                                                                  //}
                                                                                  // dbPU.expireDate = null;
                                    dbPU.canRenew = true;
                                    dbPU.oldPackageId = (int)dbPU.packageId;

                                    dbPU.type = "chpk";
                                    dbPU.isPayed = true;


                                    //    dbPU.monthCount = tmpcpd.monthCount;//change  on pay

                                    dbPU.oldCountryPackageId = dbPU.countryPackageId;

                                    newpay.expireDate = dbPU.expireDate;
                                    payopId = paycntrlr.Save(newpay);
                                    if (payopId > 0)
                                    {
                                        entity.SaveChanges();

                                        message = dbPU.packageUserId.ToString();
                                    }
                                    else
                                    {
                                        message = "0";
                                    }


                                }
                                else
                                {
                                    // error
                                    return TokenManager.GenerateToken("-6");
                                }


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
                catch
                {
                    //return TokenManager.GenerateToken(ex.ToString());
                    return TokenManager.GenerateToken("0");
                }

            }


        }


        [HttpPost]
        [Route("GetByCustomerId")]
        public string GetByCustomerId(string token)//int packageUserId
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
                int customerId = 0;


                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "customerId")
                    {
                        customerId = int.Parse(c.Value);
                    }


                }
                try
                {
                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        var List = (from PU in entity.packageUser
                                    join D in entity.countryPackageDate on PU.countryPackageId equals D.Id

                                    join N in entity.countriesCodes on D.countryId equals N.countryId
                                    join C in entity.customers on N.countryId equals C.countryId
                                    join S in entity.packages on D.packageId equals S.packageId
                                    join G in entity.programs on S.programId equals G.programId
                                    join V in entity.versions on S.verId equals V.verId
                                    where PU.customerId == customerId

                                    select new packageUserModel()
                                    {

                                        packageId = PU.packageId,
                                        notes = PU.notes,


                                        isActive = PU.isActive,


                                        packageName = S.packageName,
                                        programName = G.name,
                                        programId = G.programId,
                                        verName = V.name,
                                        verId = V.verId,
                                        branchCount = S.branchCount,
                                        packageUserId = PU.packageUserId,

                                        userId = PU.userId,

                                        packageSaleCode = PU.packageSaleCode,
                                        packageNumber = PU.packageNumber,
                                        customerId = PU.customerId,
                                        customerName = C.custname,
                                        customerLastName = C.lastName,
                                        customerServerCode = PU.customerServerCode,
                                        isBooked = PU.isBooked,

                                        createDate = PU.createDate,
                                        updateDate = PU.updateDate,
                                        createUserId = PU.createUserId,
                                        updateUserId = PU.updateUserId,
                                        bookDate = PU.bookDate,

                                        expireDate = PU.expireDate,
                                        isOnlineServer = PU.isOnlineServer,
                                        countryPackageId = PU.countryPackageId,
                                        canRenew = PU.canRenew,
                                        type = PU.type,
                                        price = D.price,
                                        monthCount = D.monthCount,
                                        islimitDate = D.islimitDate,
                                        currency = N.currency,
                                        canChngSer=PU.canChngSer,
                                    }).ToList();

                        var glist = List.GroupBy(X => X.packageUserId).Select(X => new packageUserModel
                        {

                            packageId = X.FirstOrDefault().packageId,
                            notes = X.FirstOrDefault().notes,


                            isActive = X.FirstOrDefault().isActive,


                            packageName = X.FirstOrDefault().packageName,
                            programName = X.FirstOrDefault().programName,
                            programId = X.FirstOrDefault().programId,
                            verName = X.FirstOrDefault().verName,
                            verId = X.FirstOrDefault().verId,
                            branchCount = X.FirstOrDefault().branchCount,
                            packageUserId = X.FirstOrDefault().packageUserId,

                            userId = X.FirstOrDefault().userId,

                            packageSaleCode = X.FirstOrDefault().packageSaleCode,
                            packageNumber = X.FirstOrDefault().packageNumber,
                            customerId = X.FirstOrDefault().customerId,
                            customerName = X.FirstOrDefault().customerName,
                            customerLastName = X.FirstOrDefault().customerLastName,
                            customerServerCode = X.FirstOrDefault().customerServerCode,
                            isBooked = X.FirstOrDefault().isBooked,

                            createDate = X.FirstOrDefault().createDate,
                            updateDate = X.FirstOrDefault().updateDate,
                            createUserId = X.FirstOrDefault().createUserId,
                            updateUserId = X.FirstOrDefault().updateUserId,
                            bookDate = X.FirstOrDefault().bookDate,

                            expireDate = X.FirstOrDefault().expireDate,
                            isOnlineServer = X.FirstOrDefault().isOnlineServer,
                            countryPackageId = X.FirstOrDefault().countryPackageId,
                            canRenew = X.FirstOrDefault().canRenew,
                            type = X.FirstOrDefault().type,
                            price = X.FirstOrDefault().price,
                            monthCount = X.FirstOrDefault().monthCount,
                            islimitDate = X.FirstOrDefault().islimitDate,
                            currency = X.FirstOrDefault().currency,
                            canChngSer = X.FirstOrDefault().canChngSer,
                        }).ToList();
                        return TokenManager.GenerateToken(glist);

                    }

                }
                catch
                {
                    return TokenManager.GenerateToken("0");
                }
            }



        }


        [HttpPost]
        [Route("SendCustDetail")]
        public string SendCustDetail(string token)
        {
            token = TokenManager.readToken(HttpContext.Current.Request);
            var strP = TokenManager.GetPrincipal(token);
            if (strP != "0") //invalid authorization
            {
                return TokenManager.GenerateToken(strP);
            }
            else
            {
                string message = "0";

                SendDetail sd = new SendDetail();
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);

                foreach (Claim c in claims)
                {


                    if (c.Type == "object")
                    {
                        sd = JsonConvert.DeserializeObject<SendDetail>(c.Value, new JsonSerializerSettings { DateParseHandling = DateParseHandling.None });

                    }

                }
                try
                {
                    posSerialsController pscntrlr = new posSerialsController();
                    // save data here

                    //foreach (PosSerialSend crow in sd.PosSerialSendList)
                    //{
                    //    posSerials newObject = new posSerials();
                    //    newObject.serial = crow.serial;
                    //    newObject.isBooked = crow.isBooked;
                    //    newObject.posDeviceCode = crow.posDeviceCode;
                    //    pscntrlr.UpdatebySerial(newObject);
                    //}
                    //delete old serials
                    foreach (PosSerialSend crow in sd.PosSerialSendList)
                    {
                        int resd = pscntrlr.deleteInfobySerial(crow.serial);

                    }
                    foreach (PosSerialSend crow in sd.PosSerialSendList)
                    {


                        posSerials newObject = new posSerials();
                        posInfo newinfo = new posInfo();

                        newObject = pscntrlr.getbySerial(crow.serial);
                        // newObject.serial = crow.serial;
                        newObject.isBooked = crow.isBooked;
                        newObject.posDeviceCode = crow.posDeviceCode;

                        pscntrlr.UpdatebySerial(newObject);


                        //   int resd =   pscntrlr.deleteInfobySerial(crow.serial);
                        //   add info
                        newinfo.serialId = newObject.serialId;
                        newinfo.posName = crow.posName;
                        newinfo.branchName = crow.branchName;
                        newinfo.posDeviceCode = crow.posDeviceCode;
                        newinfo.isBooked = crow.isBooked;
                        newinfo.isActive = crow.isActive;
                        // newinfo.notes = sd.PosSerialSendList.Count.ToString();
                        newinfo.posSettingId = crow.posSettingId;
                        newinfo.posId = crow.posId;
                        int resd = pscntrlr.AddposInfo(newinfo);

                    }



                    message = "1";
                    return TokenManager.GenerateToken(message);
                    //return TokenManager.GenerateToken(srList.FirstOrDefault().serial.ToString());
                }
                catch
                {
                    return TokenManager.GenerateToken("0");
                }

            }
        }


        [HttpPost]
        [Route("ActivateServerState")]
        public string ActivateServerState(string token)
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

                string packageSaleCode = "";
                string customerServerCode = "";
                string activeState = "";
                string Object = "";
                packagesSend packState = new packagesSend();
                payOpController pocntrlr = new payOpController();
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "packageSaleCode")
                    {
                        packageSaleCode = c.Value;
                    }
                    else if (c.Type == "customerServerCode")
                    {
                        customerServerCode = c.Value;

                    }
                    else if (c.Type == "packState")
                    {

                        Object = c.Value.Replace("\\", string.Empty);
                        Object = Object.Trim('"');
                        packState = JsonConvert.DeserializeObject<packagesSend>(Object, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });


                    }

                }
                try
                {
                    packageUser packuserrow = new packageUser();
                    payOpModel lastpayrow = new payOpModel();
                    payOpModel packstatepayop = new payOpModel();
                    List<PosSerialSend> serialList = new List<PosSerialSend>();
                    SendDetail senditem = new SendDetail();
                    packagesSend package = new packagesSend();
                    string activeres = "noch";

                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        //get packageuser row
                        // List<packageUser> list = entity.packageUser.Where(u => u.packageSaleCode == packageSaleCode).ToList();
                        packuserrow = getPUbycode(packageSaleCode);
                    
                       
                        packstatepayop = pocntrlr.getbyId((int)packState.poId);
                        if (packuserrow.packageUserId > 0)
                        {
                            // return TokenManager.GenerateToken(row.packageUserId);
                            // get last payed row
                            lastpayrow = getLastPayOp(packuserrow.packageUserId);


                            if (lastpayrow.payOpId > 0)
                            {

                                //// check if same method metho is 
                                if (packuserrow.isOnlineServer == packState.isOnlineServer || (packState.isServerActivated == false))
                                {
                                    //    // same method or first time

                                    //    // check if current activate(upgrade or extend) is newr than the exist or first time
                                    if ((lastpayrow.createDate > packState.pocrDate && lastpayrow.payOpId != packState.poId) || (packState.isServerActivated == false && packState.activatedate == null)
                                        || (packuserrow.canChngSer == 1 && packuserrow.packageUserId == packstatepayop.packageUserId))
                                    {

                                        //if (packuserfile.activeState == activeState || (packState.isServerActivated == false && packState.activatedate == null))
                                        //{

                                        //            // check if the command is same as the activate file or first time 

                                        //            //ssss

                                        // 
                                        // check if there are changes

                                        package.activeres = "noch";
                                        if (packState.activeState == "up")
                                        {
                                            if (packState.pId != lastpayrow.packageId || (packState.pId == lastpayrow.packageId && packState.pcdId != lastpayrow.countryPackageId || packState.isServerActivated == false))
                                            {
                                                // changed
                                                package.activeres = "ch";
                                                activeres = "ch";
                                            }
                                            else
                                            {
                                                //no  changed
                                                package.activeres = "noch";
                                                activeres = "noch";

                                            }
                                        }
                                        else if (packState.activeState == "rn")
                                        {
                                            if (lastpayrow.type == "rn" && lastpayrow.expireDate > packState.expireDate)
                                            {
                                                package.activeres = "ch";
                                                activeres = "ch";

                                            }
                                            else
                                            {
                                                package.activeres = "noch";
                                                activeres = "noch";
                                            }


                                        }
                                        //if (packState.isServerActivated == false)
                                        //{
                                        //    package.activeres = "ch";
                                        //    activeres = "ch";
                                        //}
                                        // end check


                                        if (packuserrow.type == "chpk" && packuserrow.isPayed == false && packuserrow.canRenew == false)
                                        {

                                            // chpk not payed yet
                                            // dont activate until pay
                                            // return TokenManager.GenerateToken("0");


                                            package = packState;
                                            package.activeres = activeres;

                                            package.result = -6; //  // -6 : package changed but not payed
                                            senditem.packageSend = package;

                                            return TokenManager.GenerateToken(senditem);

                                        }
                                        else if (packuserrow.isActive == 1 && (packuserrow.isServerActivated == false || (packuserrow.isServerActivated == true && packuserrow.customerServerCode == customerServerCode && packState.isServerActivated == true))
                                            ||(packuserrow.canChngSer==1 && packuserrow.packageUserId== packstatepayop.packageUserId)) 


                                        {

                                            //get poserials 
                                            programsController progcntrlr = new programsController();
                                            versionsController vercntrlr = new versionsController();
                                            programs prog = new programs();
                                            versions ver = new versions();
                                            packagesModel pack = new packagesModel();
                                            countryPackageDateController cpdCntrlr = new countryPackageDateController();
                                            countryPackageDate cpD = new countryPackageDate();
                                            posSerialsController serialmodel = new posSerialsController();
                                            users agentmodel = new users();
                                            customers customerModel = new customers();

                                            usersController agentctrlr = new usersController();
                                            customersController customerctrlr = new customersController();

                                            List<string> serialposlist = new List<string>();

                                            serialList = serialmodel.GetBypackageUserId(packuserrow.packageUserId);

                                            // get package details

                                            packagesController packmodel = new packagesController();

                                            // get last package Id
                                            package = packmodel.GetByID((int)lastpayrow.packageId);
                                            pack = packmodel.GetPmByID((int)lastpayrow.packageId);
                                            prog = progcntrlr.GetByID((int)pack.programId);
                                            ver = vercntrlr.GetByID((int)pack.verId);
                                            cpD = cpdCntrlr.GetByID((int)lastpayrow.countryPackageId);
                                            agentmodel = agentctrlr.GetByID((int)lastpayrow.agentId);
                                            customerModel = customerctrlr.GetByID((int)lastpayrow.customerId);
                                            if (agentmodel.userId == 3)
                                            {

                                                agentmodel.name = "Increase";
                                                agentmodel.lastName = "";
                                                agentmodel.AccountName = "Increase";

                                            }
                                            //start
                                            // check if there are changes
                                            package.activeres = activeres;
                                            if (activeres == "ch" || packState.activeState == "all" 
                                                ||  (packuserrow.canChngSer == 1 && packuserrow.packageUserId == packstatepayop.packageUserId)) 


                                            {
                                                //(packuserrow.canChngSer == 1 && packuserrow.packageUserId == packstatepayop.packageUserId) for change server
                                                //make changes
                                                // if(pack.isActive==1 && prog.isActive==1 && ver.isActive==1){
                                                package.programName = prog.name;
                                                package.verName = ver.name;
                                                package.packageSaleCode = packuserrow.packageSaleCode;
                                                package.expireDate = packuserrow.expireDate;
                                                package.isOnlineServer = packuserrow.isOnlineServer;
                                                package.packageNumber = packuserrow.packageNumber;
                                                package.totalsalesInvCount = packuserrow.totalsalesInvCount;

                                                //packuserrow.countryPackageId
                                                package.islimitDate = cpD.islimitDate;
                                                package.isActive = (int)packuserrow.isActive;

                                                if (packState.isServerActivated == false)
                                                {
                                                    package.activatedate = DateTime.Now;// save on client if null 
                                                    package.customerServerCode = packState.customerServerCode;
                                                }
                                                else
                                                {
                                                    package.activatedate = packuserrow.activatedate;
                                                }
                                                if (packuserrow.canChngSer == 1 && packuserrow.packageUserId == packstatepayop.packageUserId)

                                                {
                                                    //store new server id
                                                    package.customerServerCode = customerServerCode;
                                                }
                                          
                                                package.result = 1;                                  //   SendDetail senditem = new SendDetail();
                                                package.isServerActivated = true;
                                                package.customerName = customerModel.custname;
                                                package.customerLastName = customerModel.lastName;
                                                package.agentAccountName = agentmodel.AccountName;
                                                package.agentName = agentmodel.name;
                                                package.agentLastName = agentmodel.lastName;
                                                package.pId = lastpayrow.packageId;
                                                package.pcdId = lastpayrow.countryPackageId;
                                                package.bookDate = packuserrow.bookDate;
                                                package.type = lastpayrow.type;

                                                package.packuserType = packuserrow.type;
                                                package.packageUserId = packuserrow.packageUserId;
                                                package.packageName = pack.packageName;
                                                package.notes = packuserrow.notes;
                                                package.pocrDate = lastpayrow.createDate;
                                                package.poId = lastpayrow.payOpId;
                                                package.upnum = "";

                                                package.activeState = packState.activeState;



                                                senditem.packageSend = package;
                                                senditem.PosSerialSendList = serialList;

                                                //    return TokenManager.GenerateToken(senditem);

                                                packuserrow.isServerActivated = true;
                                                packuserrow.customerServerCode = customerServerCode;

                                                packuserrow.activatedate = package.activatedate;


                                                packuserrow.totalsalesInvCount = 0;
                                                packuserrow.canRenew = false;
                                                if (packState.isServerActivated == false)
                                                {
                                                    packuserrow.customerServerCode = packState.customerServerCode;

                                                }
                                                else if (packuserrow.canChngSer == 1 && packuserrow.packageUserId == packstatepayop.packageUserId)
                                                {
                                                    packuserrow.customerServerCode = customerServerCode;
                                                }
                                                packuserrow.canChngSer = 0;

                                                //  save server hardware key
                                                int res = Save(packuserrow);

                                                return TokenManager.GenerateToken(senditem);

                                            }
                                            else
                                            {

                                                //nochange 



                                                package = packState;
                                                package.activeres = activeres;

                                                package.result = 2;// no change
                                                package.pocrDate = lastpayrow.createDate;
                                                package.poId = lastpayrow.payOpId;
                                                package.upnum = "";

                                                senditem.packageSend = package;
                                                senditem.PosSerialSendList = serialList;

                                                if (packuserrow.canChngSer == 1)
                                                {
                                                    packuserrow.canChngSer = 0;
                                                    int res = Save(packuserrow);

                                                }
                                                return TokenManager.GenerateToken(senditem);

                                            }

                                            //end
                                        }
                                        else
                                        {
                                            // serverID not match or package not active
                                            serialList = new List<PosSerialSend>();
                                            package = new packagesSend();

                                            senditem = new SendDetail();
                                            package.activeres = activeres;
                                            package.pocrDate = lastpayrow.createDate;
                                            package.poId = lastpayrow.payOpId;
                                            package.upnum = "";

                                            senditem.packageSend = package;
                                            senditem.PosSerialSendList = serialList;
                                            if (packuserrow.isActive != 1)
                                            {
                                                //package not active
                                                package.result = -2;
                                            }
                                            else if (!(packuserrow.isServerActivated == false || (packuserrow.isServerActivated == true && packuserrow.customerServerCode == customerServerCode)))
                                            {
                                                // serverID not match 
                                                package.result = -3;
                                            }

                                            senditem.packageSend = package;

                                            return TokenManager.GenerateToken(senditem);


                                            //if (packuserrow.canRenew == true)
                                            //{
                                            //    // write code here
                                            //    //  return TokenManager.GenerateToken(senditem);
                                            //}
                                            //else
                                            //{

                                            //    packagesSend ps = new packagesSend();
                                            //    ps.posCount = -2;
                                            //    senditem.packageSend = ps;
                                            //    //senditem.packageSend.posCount = -2;
                                            //    //  return TokenManager.GenerateToken(senditem);

                                            //}



                                        }
                                        // sssssssssssssssssssssss

                                        //        }
                                        //        else
                                        //        {
                                        //            // the client command is different from activate file 
                                        //            package.result = -9;
                                        //            senditem.packageSend = package;
                                        //          return TokenManager.GenerateToken(senditem);
                                        //        }
                                    }
                                    else
                                    {
                                        // the current updat is newr than the offline update
                                        package.result = -18;
                                        senditem.packageSend = package;
                                        return TokenManager.GenerateToken(senditem);
                                    }
                                }
                                else
                                {
                                    // method not match // online or offline
                                    senditem = new SendDetail();
                                    //  senditem =null;
                                    serialList = new List<PosSerialSend>();
                                    package.result = -10;
                                    // package.notes = "noooooooooooood";
                                    senditem.packageSend = package;
                                    senditem.PosSerialSendList = serialList;
                                    return TokenManager.GenerateToken(senditem);

                                }






                                //   return TokenManager.GenerateToken(senditem);
                            }
                            else
                            {
                                // not payed 

                                serialList = new List<PosSerialSend>();
                                package = new packagesSend();

                                senditem = new SendDetail();
                                package.activeres = activeres;
                                package.pocrDate = lastpayrow.createDate;
                                package.poId = lastpayrow.payOpId;
                                package.upnum = "";

                                senditem.packageSend = package;
                                senditem.PosSerialSendList = serialList;

                                package.result = -4;

                                senditem.packageSend = package;

                                return TokenManager.GenerateToken(senditem);

                            }
                        }
                        else
                        {
                            //serial not found
                            serialList = new List<PosSerialSend>();
                            package = new packagesSend();

                            senditem = new SendDetail();
                            package.activeres = activeres;
                            senditem.packageSend = package;
                            senditem.PosSerialSendList = serialList;

                            package.result = -5;



                            senditem.packageSend = package;

                            return TokenManager.GenerateToken(senditem);


                            //senditem = new SendDetail();
                            //packagesSend ps = new packagesSend();
                            //ps.posCount = -3;
                            //senditem.packageSend = ps;

                            //// senditem.packageSend.posCount = -3;
                            //return TokenManager.GenerateToken(senditem);
                        }


                    }

                }
                catch (Exception ex)
                {
                    //error
                    SendDetail senditem = new SendDetail();

                    packagesSend ps = new packagesSend();
                    ps.result = 0;
                    senditem.packageSend = ps;

                    return TokenManager.GenerateToken(senditem);


                    //   return TokenManager.GenerateToken("00");


                    //
                }

            }

        }

        // offline
        [HttpPost]
        [Route("ActivateServerOffline")]
        public string ActivateServerOffline(string token)
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

                string packageSaleCode = "";
                string customerServerCode = "";
                int packageUserId = 0;
                string activeState = "";
                string Object = "";


                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "activeState")
                    {
                        activeState = c.Value;
                    }

                    else if (c.Type == "packageUserId")
                    {
                        packageUserId = int.Parse(c.Value);

                    }


                }
                try
                {
                    packageUser packuserrow = new packageUser();
                    payOpModel lastpayrow = new payOpModel();
                    List<PosSerialSend> serialList = new List<PosSerialSend>();
                    SendDetail senditem = new SendDetail();
                    packagesSend package = new packagesSend();
                    string activeres = "noch";

                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        //get packageuser row
                        // List<packageUser> list = entity.packageUser.Where(u => u.packageSaleCode == packageSaleCode).ToList();
                        //   packuserrow = getPUbycode(packageSaleCode);
                        packuserrow = GetByID(packageUserId);
                        if (packuserrow.packageUserId > 0)
                        {
                            // return TokenManager.GenerateToken(row.packageUserId);
                            // get last payed row
                            lastpayrow = getLastPayOp(packuserrow.packageUserId);


                            if (lastpayrow.payOpId > 0)
                            {


                                // check if there are changes
                                package.activeres = "noch";
                                package.activeState = activeState;

                                if (packuserrow.type == "chpk" && packuserrow.isPayed == false && packuserrow.canRenew == false)
                                {

                                    // chpk not payed yet
                                    // dont activate until pay
                                    // return TokenManager.GenerateToken("0");

                                    package.activeres = "noch";
                                    package.activeState = activeState;
                                    //package = packState;
                                    package.activeres = activeres;

                                    package.result = -6; //  // -6 : package changed but not payed
                                    senditem.packageSend = package;

                                    //   return TokenManager.GenerateToken(senditem);

                                }
                                else
                                {

                                    //get poserials 
                                    programsController progcntrlr = new programsController();
                                    versionsController vercntrlr = new versionsController();
                                    programs prog = new programs();
                                    versions ver = new versions();
                                    packagesModel pack = new packagesModel();
                                    countryPackageDateController cpdCntrlr = new countryPackageDateController();
                                    countryPackageDate cpD = new countryPackageDate();
                                    posSerialsController serialmodel = new posSerialsController();
                                    users agentmodel = new users();
                                    customers customerModel = new customers();

                                    usersController agentctrlr = new usersController();
                                    customersController customerctrlr = new customersController();

                                    List<string> serialposlist = new List<string>();

                                    serialList = serialmodel.GetBypackageUserId(packuserrow.packageUserId);

                                    // get package details

                                    packagesController packmodel = new packagesController();

                                    // get last package Id
                                    package = packmodel.GetByID((int)lastpayrow.packageId);
                                    pack = packmodel.GetPmByID((int)lastpayrow.packageId);
                                    prog = progcntrlr.GetByID((int)pack.programId);
                                    ver = vercntrlr.GetByID((int)pack.verId);
                                    cpD = cpdCntrlr.GetByID((int)lastpayrow.countryPackageId);
                                    agentmodel = agentctrlr.GetByID((int)lastpayrow.agentId);
                                    customerModel = customerctrlr.GetByID((int)lastpayrow.customerId);
                                    if (agentmodel.userId == 3)
                                    {

                                        agentmodel.name = "Increase";
                                        agentmodel.lastName = "";
                                        agentmodel.AccountName = "Increase";

                                    }
                                    //start
                                    // check if there are changes

                                    //if (activeres == "ch" || packState.activeState == "all")
                                    //{
                                    //make changes
                                    // if(pack.isActive==1 && prog.isActive==1 && ver.isActive==1){
                                    package.programName = prog.name;
                                    package.verName = ver.name;
                                    package.packageSaleCode = packuserrow.packageSaleCode;
                                  
                                    package.isOnlineServer = packuserrow.isOnlineServer;
                                    package.packageNumber = packuserrow.packageNumber;
                                    package.totalsalesInvCount = packuserrow.totalsalesInvCount;
                                    package.packageName = pack.packageName;
                                    //packuserrow.countryPackageId
                                  
                                    package.activatedate = DateTime.Now;// save on client if null 
                                    package.result = 1;                                  //   SendDetail senditem = new SendDetail();
                                
                                    package.customerName = customerModel.custname;
                                    package.customerLastName = customerModel.lastName;
                                    package.agentAccountName = agentmodel.AccountName;
                                    package.agentName = agentmodel.name;
                                    package.agentLastName = agentmodel.lastName;
                                    package.pId = lastpayrow.packageId;
                                    package.pcdId = lastpayrow.countryPackageId;
                                    package.bookDate = packuserrow.bookDate;
                                    package.isBooked = packuserrow.isBooked;

                                    package.isPayed = packuserrow.isPayed;

                                    package.activeres = "noch";

                                    package.type = lastpayrow.type;




                                    package.notes = packuserrow.notes;
                                    package.pocrDate = lastpayrow.createDate;
                                    package.poId = lastpayrow.payOpId;
                                    package.upnum = "";

                                    package.packuserType = packuserrow.type;
                                    package.packageUserId = packuserrow.packageUserId;
                                    package.customerServerCode = packuserrow.customerServerCode;


                                    package.upnum = "";




                                    //    return TokenManager.GenerateToken(senditem);

                                  //  package.isServerActivated = true;
                                    //    packuserrow.customerServerCode = customerServerCode;

                                    //'
                                    //if (packuserrow.isServerActivated == false)
                                    //{
                                    //    package.activatedate = DateTime.Now;// save on client if null 

                                    //}
                                    //else
                                    //{
                                    //    package.activatedate = packuserrow.activatedate;
                                    //}
                                    package.activeState = activeState;

                                    if (packuserrow.isServerActivated==false)
                                    {
                                        //first activate
                                        package.isServerActivated = packuserrow.isServerActivated;
                                        package.expireDate = packuserrow.bookDate;
                                        package.islimitDate = true;
                                        package.isActive = 0;
                                    }
                                    else
                                    {

                                        package.isServerActivated = packuserrow.isServerActivated;
                                        package.expireDate = packuserrow.expireDate;
                                        package.islimitDate = cpD.islimitDate;
                                        package.isActive = (int)packuserrow.isActive;
                                    }
                                    package.canChngSer =  packuserrow.canChngSer;
                                    senditem.packageSend = package;
                                    senditem.PosSerialSendList = serialList;

                                    // packuserrow.totalsalesInvCount = 0;
                                    // packuserrow.canRenew = false;

                                    //  save server hardware key
                                    //  int res = Save(packuserrow);// dont change until upload return file from customer server 


                                    return TokenManager.GenerateToken(senditem);

                                    //}
                                    //else
                                    //{

                                    //    //nochange 



                                    //    package = packState;
                                    //    package.activeres = activeres;

                                    //    package.result = 2;// no change

                                    //    senditem.packageSend = package;
                                    //    senditem.PosSerialSendList = serialList;
                                    //    return TokenManager.GenerateToken(senditem);

                                    //}

                                    //end


                                }

                                //   return TokenManager.GenerateToken(senditem);
                            }
                            else
                            {
                                // not payed // no send file to customer

                                serialList = new List<PosSerialSend>();
                                package = new packagesSend();

                                senditem = new SendDetail();
                                package.activeres = activeres;
                                senditem.packageSend = package;
                                senditem.PosSerialSendList = serialList;

                                package.result = -4;

                                senditem.packageSend = package;

                                // return TokenManager.GenerateToken(senditem);

                            }
                        }
                        else
                        {
                            //serial not found or noId// no send file to customer
                            serialList = new List<PosSerialSend>();
                            package = new packagesSend();

                            senditem = new SendDetail();
                            package.activeres = activeres;
                            senditem.packageSend = package;
                            senditem.PosSerialSendList = serialList;

                            package.result = -5;



                            senditem.packageSend = package;

                            //   return TokenManager.GenerateToken(senditem);


                            //senditem = new SendDetail();
                            //packagesSend ps = new packagesSend();
                            //ps.posCount = -3;
                            //senditem.packageSend = ps;

                            //// senditem.packageSend.posCount = -3;
                            //return TokenManager.GenerateToken(senditem);
                        }


                    }

                    package.packuserType = packuserrow.type;
                    package.packageUserId = packuserrow.packageUserId;
                    //   package.packageName = pack.packageName;
                    package.pocrDate = lastpayrow.createDate;
                    package.poId = lastpayrow.payOpId;
                    package.upnum = "";
                    package.packuserType = packuserrow.type;

                    senditem.packageSend = package;


                    return TokenManager.GenerateToken(senditem);

                }
                catch (Exception ex)
                {
                    //error

                    SendDetail senditem = new SendDetail();

                    packagesSend ps = new packagesSend();
                    ps.result = 0;
                    senditem.packageSend = ps;

                    return TokenManager.GenerateToken(senditem);

                }
                //   return TokenManager.GenerateToken("00");
            }



        }

        // save return data from customer

        [HttpPost]
        [Route("updatecustomerdata")]
        public string updatecustomerdata(string token)
        {
            token = TokenManager.readToken(HttpContext.Current.Request);
            var strP = TokenManager.GetPrincipal(token);
            if (strP != "0") //invalid authorization
            {
                return TokenManager.GenerateToken(strP);
            }
            else
            {
                string message = "0";
                string activeState = "";
                SendDetail sd = new SendDetail();
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);

                foreach (Claim c in claims)
                {


                    if (c.Type == "object")
                    {
                        sd = JsonConvert.DeserializeObject<SendDetail>(c.Value, new JsonSerializerSettings { DateParseHandling = DateParseHandling.None });

                    }
                    else if (c.Type == "activeState")
                    {
                        activeState = c.Value;

                    }

                }
                try
                {

                    posSerialsController pscntrlr = new posSerialsController();
                    payOpModel lastpayrow = new payOpModel();
                    // save data here
                    // packageuser update
                    packageUser puDB = new packageUser();
                    puDB = GetByID((int)sd.packageSend.packageUserId);
                    lastpayrow = getLastPayOp(puDB.packageUserId);
                    if (activeState == "up" || sd.packageSend.activeApp == "all")
                    {

                        if (puDB.packageUserId > 0)
                        {
                            if (puDB.isServerActivated == false && puDB.packageUserId==sd.packageSend.packageUserId 
                                && puDB.isOnlineServer == sd.packageSend.isOnlineServer 
                                && (sd.packageSend.customerServerCode!=null && sd.packageSend.customerServerCode!=""))
                          
                                //&& lastpayrow.createDate <= sd.packageSend.pocrDate && lastpayrow.payOpId == sd.packageSend.poId
                            {
                                puDB.customerServerCode = sd.packageSend.customerServerCode;
                                puDB.activatedate = sd.packageSend.activatedate;
                                puDB.isServerActivated = true;

                                // puDB.canRenew = false;

                                int res = Save(puDB);
                                res = updateposInfolist(sd.PosSerialSendList);
                                return TokenManager.GenerateToken("1");

                            }
                            else
                            {

                                // not first time
                                if (puDB.isOnlineServer == sd.packageSend.isOnlineServer)
                                {
                                  
                                    //    // same method or first time

                                    //    // check if current activate(upgrade or extend) is newr than the exist or first time
                                    if (lastpayrow.createDate <= sd.packageSend.pocrDate && lastpayrow.payOpId == sd.packageSend.poId)
                                    {

                                        if (puDB.customerServerCode == sd.packageSend.customerServerCode)
                                        {
                                            //this is last returned data

                                            // puDB.customerServerCode = sd.packageSend.customerServerCode;
                                            //  puDB.activatedate = sd.packageSend.activatedate;
                                            // puDB.isServerActivated = true;
                                            // puDB.canRenew = false;
                                            // int res = Save(puDB);

                                            //  nochange just save serials


                                            int res = updateposInfolist(sd.PosSerialSendList);
                                            return TokenManager.GenerateToken("1");

                                        }
                                        else
                                        {
                                            // serverId not matched
                                            return TokenManager.GenerateToken("-3");

                                        }


                                    }
                                    else
                                    {
                                        //there  are other changes from last returned data
                                        return TokenManager.GenerateToken("-6");

                                    }
                                }
                                else
                                {
                                    //the method is changed
                                    return TokenManager.GenerateToken("-10");
                                }

                            }



                        }
                        else
                        {
                            // noId exist
                            return TokenManager.GenerateToken("-5");

                        }
                    }
                
                    else
                    {
                        //the active state not match
                        return TokenManager.GenerateToken("-9");
                    }
                
                // serial update
                //delete old serials
                //foreach (PosSerialSend crow in sd.PosSerialSendList)
                //{
                //    int resd = pscntrlr.deleteInfobySerial(crow.serial);

                //}
                //foreach (PosSerialSend crow in sd.PosSerialSendList)
                //{


                //    posSerials newObject = new posSerials();
                //    posInfo newinfo = new posInfo();

                //    newObject = pscntrlr.getbySerial(crow.serial);
                //    // newObject.serial = crow.serial;
                //    newObject.isBooked = crow.isBooked;
                //    newObject.posDeviceCode = crow.posDeviceCode;

                //    pscntrlr.UpdatebySerial(newObject);


                //    //   int resd =   pscntrlr.deleteInfobySerial(crow.serial);
                //    //   add info
                //    newinfo.serialId = newObject.serialId;
                //    newinfo.posName = crow.posName;
                //    newinfo.branchName = crow.branchName;
                //    newinfo.posDeviceCode = crow.posDeviceCode;
                //    newinfo.isBooked = crow.isBooked;
                //    newinfo.isActive = crow.isActive;
                //    // newinfo.notes = sd.PosSerialSendList.Count.ToString();
                //    newinfo.posSettingId = crow.posSettingId;
                //    newinfo.posId = crow.posId;
                //    int resd = pscntrlr.AddposInfo(newinfo);

                //}


            }
                catch
                {
                    return TokenManager.GenerateToken("0");
                }
            }
        }
                public int updateposInfolist(List<PosSerialSend> PosSerialSendList)
                {
                    int res = 0;
                    posSerialsController pscntrlr = new posSerialsController();
                    foreach (PosSerialSend crow in PosSerialSendList)
                    {
                        int resd = pscntrlr.deleteInfobySerial(crow.serial);

                    }
                    foreach (PosSerialSend crow in PosSerialSendList)
                    {


                        posSerials newObject = new posSerials();
                        posInfo newinfo = new posInfo();

                        newObject = pscntrlr.getbySerial(crow.serial);
                        // newObject.serial = crow.serial;
                        newObject.isBooked = crow.isBooked;
                        newObject.posDeviceCode = crow.posDeviceCode;

                        pscntrlr.UpdatebySerial(newObject);


                        //   int resd =   pscntrlr.deleteInfobySerial(crow.serial);
                        //   add info
                        newinfo.serialId = newObject.serialId;
                        newinfo.posName = crow.posName;
                        newinfo.branchName = crow.branchName;
                        newinfo.posDeviceCode = crow.posDeviceCode;
                        newinfo.isBooked = crow.isBooked;
                        newinfo.isActive = crow.isActive;
                        // newinfo.notes = sd.PosSerialSendList.Count.ToString();
                        newinfo.posSettingId = crow.posSettingId;
                        newinfo.posId = crow.posId;
                        int resd = pscntrlr.AddposInfo(newinfo);
                        res = resd;

                    }
                    return res;

                }



    }
}