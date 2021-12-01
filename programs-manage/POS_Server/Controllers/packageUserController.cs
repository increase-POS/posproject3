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
                                        userName = A.name ,
                                        userLastName = A.lastName,
                                        packageSaleCode = S.packageSaleCode,
                                        packageNumber = S.packageNumber,
                                        customerId = S.customerId,
                                        customerName = C.custname ,
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
                           S.isOnlineServer,
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


                }
                try
                {
                    packageUser row = new packageUser();

                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        // List<packageUser> list = entity.packageUser.Where(u => u.packageSaleCode == packageSaleCode).ToList();
                      
                      List<packageUser> list = entity.packageUser.Where(u => u.packageSaleCode.Equals(packageSaleCode)).ToList();
                        list= list.Where(u => u.packageSaleCode.Equals(packageSaleCode)).ToList();
                       
                        if (list != null && list.Count>0)
                        {
                            row = list
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

                                        }).FirstOrDefault();


                   
                            // return TokenManager.GenerateToken(row.packageUserId);

                            if (row.isBooked == false && row.isActive == 1) //&&  row.expireDate==null 
                            {
                                row.isBooked = true;
                                row.customerServerCode = customerServerCode;
                                row.bookDate = DateTime.Now;
                                //  save server hardware key
                                int res = Save(row);// temp comment
                                                    //     int res = 1;// temp
                                if (res > 0)
                                {
                                    //get poserials 
                                    posSerialsController serialmodel = new posSerialsController();
                                    List<PosSerialSend> serialList = new List<PosSerialSend>();
                                    List<string> serialposlist = new List<string>();
                                    serialList = serialmodel.GetBypackageUserId(row.packageUserId);


                                    //  serialposlist = serialList.Select(x => x.serial).ToList();
                                    // get package details
                                    packagesController packmodel = new packagesController();
                                    packagesSend package = new packagesSend();
                                    package = packmodel.GetByID((int)row.packageId);

                                    SendDetail senditem = new SendDetail();
                                    senditem.packageSend = package;
                                    senditem.PosSerialSendList = serialList;

                                    return TokenManager.GenerateToken(senditem);
                                }
                                else
                                {
                                    return TokenManager.GenerateToken("0");
                                }

                            }
                            else
                            {

                                // serial is booked
                                SendDetail senditem = new SendDetail();
                                packagesSend ps = new packagesSend();
                                ps.posCount = -2;
                                senditem.packageSend = ps;
                                //senditem.packageSend.posCount = -2;
                                return TokenManager.GenerateToken(senditem);
                            }

                        }
                        else
                        {
                            //serial not found
                         
                            SendDetail senditem = new SendDetail();
                            packagesSend ps = new packagesSend();
                            ps.posCount = -3;
                            senditem.packageSend = ps;

                           // senditem.packageSend.posCount = -3;
                            return TokenManager.GenerateToken(senditem);
                        }


                    }

                }
                catch(Exception ex)
                {
                    //error
                    return TokenManager.GenerateToken("0");
                }
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

    }
}