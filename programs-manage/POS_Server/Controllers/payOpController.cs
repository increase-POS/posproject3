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


    [RoutePrefix("api/payOp")]

    public class payOpController : ApiController

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
                        var List = (from S in entity.payOp
                                    join A in entity.packageUser on S.packageUserId equals A.packageUserId
                                    join P in entity.packages on A.packageId equals P.packageId
                                    join U in entity.users on A.userId equals U.userId
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
                                        countryPackageId = S.countryPackageId,
                                        discountValue = S.discountValue,
                                        customerId = S.customerId,
                                        agentId = S.agentId,
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
                int payOpId = 0;


                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "payOpId")
                    {
                        payOpId = int.Parse(c.Value);
                    }


                }
                try
                {
                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        var row = entity.payOp
                       .Where(u => u.payOpId == payOpId)
                       .Select(S => new
                       {
                           S.payOpId,
                           S.Price,
                           S.code,
                           S.type,
                           S.packageUserId,
                           S.createUserId,
                           S.updateUserId,
                           S.createDate,
                           S.updateDate,
                           S.notes,
                           S.totalnet,
                           S.countryPackageId,
                           S.discountValue,
                           S.customerId,
                           S.agentId,


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
                        var List = (from S in entity.payOp
                                    join A in entity.packageUser on S.packageUserId equals A.packageUserId
                                    join P in entity.packages on A.packageId equals P.packageId
                                    join U in entity.users on A.userId equals U.userId
                                    join CP in entity.countryPackageDate on S.countryPackageId equals CP.Id
                                    join C in entity.countriesCodes on CP.countryId equals C.countryId

                                    where S.customerId == customerId
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
                                        countryPackageId = S.countryPackageId,
                                        discountValue = S.discountValue,
                                        customerId = S.customerId,
                                        agentId = S.agentId,
                                        packageNumber = A.packageNumber,
                                        
                                        expireDate = S.expireDate,
                                       currency=C.currency,

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
                payOp newObject = null;
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "Object")
                    {
                        Object = c.Value.Replace("\\", string.Empty);
                        Object = Object.Trim('"');
                        newObject = JsonConvert.DeserializeObject<payOp>(Object, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });
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
                            var locationEntity = entity.Set<payOp>();
                            if (newObject.payOpId == 0)
                            {
                                newObject.createDate = DateTime.Now;
                                newObject.updateDate = DateTime.Now;
                                newObject.updateUserId = newObject.createUserId;


                                locationEntity.Add(newObject);
                                entity.SaveChanges();

                                // get packageuser code



                                message = newObject.payOpId.ToString();

                            }
                            else
                            {
                                var tmpObject = entity.payOp.Where(p => p.payOpId == newObject.payOpId).FirstOrDefault();

                                tmpObject.updateDate = DateTime.Now;

                                tmpObject.payOpId = newObject.payOpId;
                                tmpObject.Price = newObject.Price;
                                tmpObject.code = newObject.code;
                                tmpObject.type = newObject.type;
                                tmpObject.packageUserId = newObject.packageUserId;
                                tmpObject.createUserId = newObject.createUserId;
                                tmpObject.updateUserId = newObject.updateUserId;


                                tmpObject.notes = newObject.notes;






                                entity.SaveChanges();

                                message = tmpObject.payOpId.ToString();
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

        public int Save(payOp newObject)//string Object
#pragma warning restore CS1591 // Missing XML comment for publicly visible type or member
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
                if (newObject.packageUserId == 0 || newObject.packageUserId == null)
                {
                    Nullable<int> id = null;
                    newObject.packageUserId = id;
                }
                if (newObject.agentId == 0 || newObject.agentId == null)
                {
                    Nullable<int> id = null;
                    newObject.agentId = id;
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
                        if (newObject.packageUserId > 0)
                        {
                            using (incprogramsdbEntities entity1 = new incprogramsdbEntities())
                            {
                                var tmpPackage = entity1.packageUser.Where(p => p.packageUserId == newObject.packageUserId).FirstOrDefault();
                                //  packagecode = tmpPackage.packageCode;
                                newObject.agentId = tmpPackage.userId;
                                newObject.customerId = tmpPackage.customerId;
                            }
                        }
                        var locationEntity = entity.Set<payOp>();
                        if (newObject.payOpId == 0)
                        {


                            newObject.createDate = DateTime.Now;
                            newObject.updateDate = DateTime.Now;
                            newObject.updateUserId = newObject.createUserId;

                            locationEntity.Add(newObject);
                            entity.SaveChanges();



                            message = newObject.payOpId;

                        }
                        else
                        {
                            var tmpObject = entity.payOp.Where(p => p.payOpId == newObject.payOpId).FirstOrDefault();

                            tmpObject.updateDate = DateTime.Now;

                            tmpObject.payOpId = newObject.payOpId;
                            tmpObject.Price = newObject.Price;
                            tmpObject.code = newObject.code;
                            tmpObject.type = newObject.type;
                            tmpObject.packageUserId = newObject.packageUserId;
                            tmpObject.createUserId = newObject.createUserId;
                            tmpObject.updateUserId = newObject.updateUserId;

                            tmpObject.notes = newObject.notes;
                            tmpObject.totalnet = newObject.totalnet;
                            entity.SaveChanges();

                            message = tmpObject.payOpId;
                        }
                        //  entity.SaveChanges();

                        return message;
                    }

                }
                catch
                {
                    return -10;
                }
            }
            else
            {
                return -20;
            }


        }

        [HttpPost]
        [Route("Delete")]
        public string Delete(string token)//int payOpId, int userId, bool final
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
                int payOpId = 0;
                //int userId = 0;
                //bool final = false;

                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "payOpId")
                    {
                        payOpId = int.Parse(c.Value);
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
                        payOp objectDelete = entity.payOp.Find(payOpId);

                        entity.payOp.Remove(objectDelete);
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
                string payOpCode = "";
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "payOpCode")
                    {
                        payOpCode = c.Value;
                    }

                }
                List<string> numberList;
                int lastNum = 0;
                using (incprogramsdbEntities entity = new incprogramsdbEntities())
                {
                    numberList = entity.payOp.Where(b => b.code.Contains(payOpCode + "-")).Select(b => b.code).ToList();

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

        public payOpModel getbyId(int payOpId)
        {
            payOpModel lastpayrow = new payOpModel();
            if (payOpId<=0) {
                return lastpayrow;
            }
            else
            {

       
         
            try
            {
                using (incprogramsdbEntities entity = new incprogramsdbEntities())
                {
                    lastpayrow = (from S in entity.payOp
                              
                                  where S.payOpId == payOpId
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
                                     // packageNumber = S.packageNumber,


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
        }

        [HttpPost]
        [Route("getLastPayOp")]
        public string getLastPayOp(string token)//int packageUserId
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

                packageUserController pucntrlr = new packageUserController();

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
                    payOpModel payoprow = new payOpModel();
                    payoprow = pucntrlr.getLastPayOp(packageUserId);

                    return TokenManager.GenerateToken(payoprow);
                }
                catch
                {
                    return TokenManager.GenerateToken("0");
                }
            }



        }


    }
}