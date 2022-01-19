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
                                    join P in entity.packageUser on S.packageUserId equals P.packageUserId
                                    select new posSerialsModel()
                                    {
                                        serialId = S.serialId,
                                        serial = S.serial,
                                        posDeviceCode = S.posDeviceCode,
                                        packageUserId = S.packageUserId,
                                        isBooked = S.isBooked,

                                        createDate = S.createDate,
                                        updateDate = S.updateDate,

                                        createUserId = S.createUserId,
                                        updateUserId = S.updateUserId,
                                        canDelete = true,
                                        notes = S.notes,
                                        packageSaleCode = P.packageSaleCode,
                                        isActive = S.isActive,

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

                           S.createUserId,
                           S.updateUserId,
                           S.notes,
                           S.unLimited,

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

        [HttpPost]
        [Route("GetBySID")]
        public string GetBySID(string token)//int serialId
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
                    posSerials row = new posSerials();

                    row= getbySerialId(serialId);

                        return TokenManager.GenerateToken(row);
                    
                }
                catch (Exception ex)
                {
                    posSerials row = new posSerials();
                    row.serial = ex.ToString();
                    return TokenManager.GenerateToken(row);
                }
            }


        }

        public List<PosSerialSend> GetBypackageUserId(int packageUserId)
        {
            List<PosSerialSend> List = new List<PosSerialSend>();
            try
            {

                using (incprogramsdbEntities entity = new incprogramsdbEntities())
                {
                    List = entity.posSerials
                       .Where(u => u.packageUserId == packageUserId && u.isActive == 1)
                       .Select(S => new PosSerialSend
                       {

                           serial = S.serial,
                           posDeviceCode = S.posDeviceCode,

                           isBooked = S.isBooked,

                           isActive = (S.isActive == 1) ? 1 : 0,
                           //serialId = S.serialId,
                           //serial = S.serial,
                           //posDeviceCode = S.posDeviceCode,
                           //packageUserId = S.packageUserId,
                           //isBooked = S.isBooked,


                           //canDelete = true,
                           //notes = S.notes,
                           //packageSaleCode = P.packageSaleCode,
                           //isActive = S.isActive,

                       }).ToList();


                    return List;
                }
            }
            catch
            {
                return List;
            }
        }

        [HttpPost]
        [Route("GetByPackUserId")]
        public string GetByPackUserId(string token)//int serialId
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
                List<posSerials> List = new List<posSerials>();

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


                    List = GetByPUId(packageUserId);

                }
                catch
                {
                    return TokenManager.GenerateToken("0");
                }
                return TokenManager.GenerateToken(List);

            }


        }

        [HttpPost]
        [Route("GetSerialAndPosInfo")]
        public string GetSerialAndPosInfo(string token)//int serialId
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
                List<posSerialsModel> List = new List<posSerialsModel>();

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
                    // List = GetserialsAndInfo(packageUserId);
                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        List = (from S in entity.posSerials
                                join PI in entity.posInfo on S.serialId equals PI.serialId into PIJ
                                where S.packageUserId == packageUserId

                                from P in PIJ.DefaultIfEmpty()
                                select new posSerialsModel()
                                {
                                    serialId = S.serialId,
                                    serial = S.serial,
                                    posDeviceCode = P.posDeviceCode,

                                    isActive = S.isActive,

                                    packageUserId = S.packageUserId,
                                    notes = S.notes,
                                    unLimited = S.unLimited,
                                    createDate = S.createDate,
                                    updateDate = S.updateDate,

                                    createUserId = S.createUserId,
                                    updateUserId = S.updateUserId,

                                    posInfoId = P.posInfoId,
                                    isBooked = P.isBooked,
                                    posName = P.posName,
                                    branchName = P.branchName,
                                    updateDateinfo = P.updateDate,

                                }).ToList();

                        return TokenManager.GenerateToken(List);
                        // return List;

                    }


                }
                catch (Exception ex)
                {
                 //   return TokenManager.GenerateToken("0");
                    return TokenManager.GenerateToken(ex.ToString());
                }
             //   return TokenManager.GenerateToken(List);

            }

        }


        public List<posSerials> GetByPUId(int packageUserId)
        {
            List<posSerials> List = new List<posSerials>();
            try
            {

                using (incprogramsdbEntities entity = new incprogramsdbEntities())
                {
                    List = entity.posSerials.ToList();

                    List = List.Where(S => S.packageUserId == packageUserId).Select(S => new posSerials
                    {
                        serialId = S.serialId,
                        serial = S.serial,
                        posDeviceCode = S.posDeviceCode,

                        isBooked = S.isBooked,

                        isActive = S.isActive,

                        packageUserId = S.packageUserId,
                        notes = S.notes,
                        unLimited = S.unLimited,
                        createDate = S.createDate,
                        updateDate = S.updateDate,

                        createUserId = S.createUserId,
                        updateUserId = S.updateUserId,

                    }).ToList();


                    return List;
                }
            }
            catch
            {
                return List;
            }
        }
        public List<posSerialsModel> GetserialsAndInfo(int packageUserId)
        {
            List<posSerialsModel> List = new List<posSerialsModel>();
            try
            {

                using (incprogramsdbEntities entity = new incprogramsdbEntities())
                {
                    List = (from S in entity.posSerials
                            join PI in entity.posInfo on S.serialId equals PI.serialId into PIJ
                            where S.packageUserId == packageUserId

                            from P in PIJ.DefaultIfEmpty()
                            select new posSerialsModel()
                            {
                                serialId = S.serialId,
                                serial = S.serial,
                                posDeviceCode = P.posDeviceCode,

                                isActive = S.isActive,

                                packageUserId = S.packageUserId,
                                notes = S.notes,
                                unLimited = S.unLimited,
                                createDate = S.createDate,
                                updateDate = S.updateDate,

                                createUserId = S.createUserId,
                                updateUserId = S.updateUserId,

                                posInfoId = P.posInfoId,
                                isBooked = P.isBooked,
                                posName = P.posName,
                                branchName = P.branchName,
                                updateDateinfo = P.updateDate,

                            }).ToList();


                    return List;
                }
            }
            catch 
            {
                return List;
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


                                //  tmpObject.createUserId = newObject.createUserId;
                                tmpObject.updateUserId = newObject.updateUserId;
                                tmpObject.notes = newObject.notes;
                                tmpObject.isActive = newObject.isActive;

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
        public int serialSaveOrUpdate(posSerials newObject)
        {
            int message = 0;

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


                        message = newObject.serialId;
                        //


                    }
                    else
                    {
                        var tmpObject = entity.posSerials.Where(p => p.serialId == newObject.serialId).FirstOrDefault();

                        tmpObject.updateDate = DateTime.Now;
                        //  tmpObject.serialId = newObject.serialId;
                        tmpObject.serial = newObject.serial;
                        tmpObject.posDeviceCode = newObject.posDeviceCode;
                        tmpObject.packageUserId = newObject.packageUserId;
                        tmpObject.isBooked = newObject.isBooked;
                        tmpObject.isActive = newObject.isActive;

                        tmpObject.updateUserId = newObject.updateUserId;
                        tmpObject.notes = newObject.notes;
                        tmpObject.isActive = newObject.isActive;
                        tmpObject.unLimited = newObject.unLimited;
                        entity.SaveChanges();

                        message = tmpObject.serialId;
                    }
                    //  en

                    //  entity.SaveChanges();

                }

            }
            catch 
            {
                message = -1;
                return message;
            }

            return message ;

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


        }

        public string posSerialSave(posSerials newObject)
        {
            string message = "";
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


        public int UpdatebySerial(posSerials newObject)
        {
            int message = 0;
            //

            try
            {
                using (incprogramsdbEntities entity = new incprogramsdbEntities())
                {
                    var locationEntity = entity.Set<posSerials>();
                    if (newObject.serial == null || newObject.serial == "")
                    {
                        message = 0;
                        //
                    }
                    else
                    {
                        var tmpObject = entity.posSerials.Where(p => p.serial == newObject.serial).FirstOrDefault();
                        if (tmpObject != null && tmpObject.serialId > 0)
                        {


                            //   tmpObject.updateDate = DateTime.Now;
                            //  tmpObject.serialId = newObject.serialId;
                            //    tmpObject.serial = newObject.serial;
                            tmpObject.posDeviceCode = newObject.posDeviceCode;
                            // tmpObject.packageUserId = newObject.packageUserId;
                            tmpObject.isBooked = newObject.isBooked;
                            //   tmpObject.isActive = newObject.isActive;

                            //  tmpObject.updateUserId = newObject.updateUserId;
                            //    tmpObject.notes = newObject.notes;
                            // tmpObject.isActive = newObject.isActive;
                            //  tmpObject.unLimited = newObject.unLimited;
                            entity.SaveChanges();

                            message = tmpObject.serialId;
                        }
                        else
                        {
                            message = 0;
                        }
                    }
                    //  en

                    //  entity.SaveChanges();

                }

            }
            catch
            {
                message = -1;
            }
            return message;
        }


        // update pos info from customer server
        public int AddposInfo(posInfo newObject)
        {
            int message = 0;
            //

            try
            {
                using (incprogramsdbEntities entity = new incprogramsdbEntities())
                {
                    var locationEntity = entity.Set<posInfo>();
                    if (newObject.posInfoId == 0)
                    {
                        newObject.createDate = DateTime.Now;
                        newObject.updateDate = newObject.createDate;

                        locationEntity.Add(newObject);
                        message = entity.SaveChanges();

                    }
                    else
                    {
                        message = 0;
                    }

                }

            }
            catch
            {
                message = -1;
            }
            return message;
        }
        public int deleteInfobySerial(string serial)
        {
            int message = 0;
            //

            try
            {
                using (incprogramsdbEntities entity = new incprogramsdbEntities())
                {
                    var locationEntity = entity.Set<posSerials>();
                    if (serial == null || serial == "")
                    {
                        message = 0;
                        //
                    }
                    else
                    {
                        var tmpObject = entity.posSerials.Where(p => p.serial == serial).FirstOrDefault();
                        //delete
                        var infolist = entity.posInfo.Where(p => p.serialId == tmpObject.serialId).ToList();
                        if (infolist != null || infolist.Count > 0)
                        {
                            entity.posInfo.RemoveRange(infolist);
                            message = entity.SaveChanges();
                        }
                        else
                        {
                            message = 0;
                        }



                    }
                    //  en

                    //  entity.SaveChanges();

                }

            }
            catch
            {
                message = -1;
            }
            return message;
        }
        public posSerials getbySerial(string serial)
        {
            int message = 0;
            //
            posSerials row = new posSerials();
            try
            {
                using (incprogramsdbEntities entity = new incprogramsdbEntities())
                {
                    var locationEntity = entity.Set<posSerials>();
                    if (serial == null || serial == "")
                    {
                        message = 0;
                        //
                    }
                    else
                    {
                        row = entity.posSerials.Where(p => p.serial == serial).FirstOrDefault();


                    }


                }

            }
            catch
            {
                row = new posSerials();
                return row;
            }
            return row;
        }

        public posSerials getbySerialId(int serialId)
        {
            int message = 0;
            //
            posSerials row = new posSerials();
            try
            {
                using (incprogramsdbEntities entity = new incprogramsdbEntities())
                {
                    var locationEntity = entity.Set<posSerials>();
                    if (serialId == null || serialId == 0)
                    {
                        message = 0;
                        //
                    }
                    else
                    {
                        var rowl = entity.posSerials.ToList();
                        row = rowl.Where(p => p.serialId == serialId)
                        .Select(S => new posSerials
                         {
                          serialId=   S.serialId,
                            serial=  S.serial,
                            posDeviceCode= S.posDeviceCode,
                            packageUserId=   S.packageUserId,
                            isBooked= S.isBooked,
                            isActive=  S.isActive,
                            createDate=  S.createDate,
                            updateDate=  S.updateDate,

                            createUserId= S.createUserId,
                            updateUserId=   S.updateUserId,
                            notes= S.notes,
                            unLimited=   S.unLimited,

                        }).FirstOrDefault();


                    }


                }

            }
            catch
            {
                row = new posSerials();
                return row;
            }
            return row;
        }
        // end

        [HttpPost]
        [Route("UpdateList")]
        public string UpdateList(string token)//string Object
        {
            string message = "0";
            try { 
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
                List<posSerials> newList = new List<posSerials>();
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
                        newList = JsonConvert.DeserializeObject<List<posSerials>>(Object, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });
                    }
                }


                try
                {

                    int res = 0;

                    foreach (posSerials row in newList)
                    {
                            posSerials dbrow = new posSerials();
                            dbrow = getbySerialId(row.serialId);
                            dbrow.updateUserId = userId;
                            dbrow.isActive = row.isActive;

                            int id = serialSaveOrUpdate(dbrow);



                        if (id > 0)
                        {
                            res++;

                        }


                    }

                    message = res.ToString();
                }
                catch  
                {
                    message = "0";
                    return TokenManager.GenerateToken(message);
                    //return TokenManager.GenerateToken(ex.ToString());
                }
                return TokenManager.GenerateToken(message);

            }
        } catch (Exception ex )
            {
                return TokenManager.GenerateToken(ex.ToString());
            }
}
      
    }
}