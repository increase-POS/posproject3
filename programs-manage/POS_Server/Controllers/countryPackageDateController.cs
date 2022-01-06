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


    [RoutePrefix("api/countryPackageDate")]

    public class countryPackageDateController : ApiController

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
                        var List = (from S in entity.countryPackageDate
                                    join C in entity.countriesCodes on S.countryId equals C.countryId into CS
                                    join P in entity.packages on S.packageId equals P.packageId

                                    from CSS in CS.DefaultIfEmpty()
                                    select new countryPackageDateModel()
                                    {

                                        Id = S.Id,
                                        countryId = S.countryId,
                                        countryName = CSS.name,
                                        packageId = S.packageId,
                                        monthCount = S.monthCount,
                                        yearCount = S.yearCount,
                                        price = S.price,
                                        notes = S.notes,
                                        createUserId = S.createUserId,
                                        updateUserId = S.updateUserId,
                                        createDate = S.createDate,
                                        updateDate = S.updateDate,
                                        islimitDate = S.islimitDate,
                                        isActive = S.isActive,
                                        canDelete=false,
                                        currency=CSS.currency,
                                    }).ToList();
                        /*
       
                        */

                        if (List.Count > 0)
                        {
                            for (int i = 0; i < List.Count; i++)
                            {
                                if (List[i].isActive == 1)
                                {
                                    int countryPackageId = (int)List[i].Id;
                                    var itemsI = entity.packageUser.Where(x => x.countryPackageId == countryPackageId).Select(b => new { b.countryPackageId }).FirstOrDefault();

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
                int Id = 0;


                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "Id")
                    {
                        Id = int.Parse(c.Value);
                    }


                }
                try
                {
                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        var row = entity.countryPackageDate
                       .Where(u => u.Id == Id)
                       .Select(S => new
                       {
                           S.Id,
                           S.countryId,
                           S.packageId,
                           S.monthCount,
                           S.yearCount,
                           S.price,
                           S.notes,
                           S.createUserId,
                           S.updateUserId,
                           S.createDate,
                           S.updateDate,
                           S.islimitDate,
                           S.isActive,
                           S.countriesCodes.currency,



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


    
        public countryPackageDate GetByID(int Id) 
        {
            countryPackageDate row = new countryPackageDate();
                try
                {
                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                    List<countryPackageDate> List = entity.countryPackageDate.ToList();

                  row =  List.Where(u => u.Id == Id)
                       .Select(S => new countryPackageDate
                       {

                           Id = S.Id,
                           countryId = S.countryId,
                      
                           packageId = S.packageId,
                           monthCount = S.monthCount,
                           yearCount = S.yearCount,
                           price = S.price,
                           notes = S.notes,
                           createUserId = S.createUserId,
                           updateUserId = S.updateUserId,
                           createDate = S.createDate,
                           updateDate = S.updateDate,
                           islimitDate = S.islimitDate,
                           isActive = S.isActive,
                       })
                       .FirstOrDefault();
                        return  row;
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
                countryPackageDate newObject = null;
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "Object")
                    {
                        Object = c.Value.Replace("\\", string.Empty);
                        Object = Object.Trim('"');
                        newObject = JsonConvert.DeserializeObject<countryPackageDate>(Object, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });
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
                    if (newObject.countryId == 0 || newObject.countryId == null)
                    {
                        Nullable<int> id = null;
                        newObject.countryId = id;
                    }




                    try
                    {

                        using (incprogramsdbEntities entity = new incprogramsdbEntities())
                        {
                            var locationEntity = entity.Set<countryPackageDate>();
                            if (newObject.Id == 0)
                            {
                                newObject.createDate = DateTime.Now;
                                newObject.updateDate = DateTime.Now;
                                newObject.updateUserId = newObject.createUserId;


                                locationEntity.Add(newObject);
                                entity.SaveChanges();

                                // get packageuser code



                                message = newObject.Id.ToString();

                            }
                            else
                            {
                                var tmpObject = entity.countryPackageDate.Where(p => p.Id == newObject.Id).FirstOrDefault();

                                tmpObject.updateDate = DateTime.Now;
                                tmpObject.Id = newObject.Id;
                                tmpObject.countryId = newObject.countryId;
                                tmpObject.packageId = newObject.packageId;
                                tmpObject.monthCount = newObject.monthCount;
                                tmpObject.yearCount = newObject.yearCount;
                                tmpObject.price = newObject.price;
                                tmpObject.notes = newObject.notes;
                            
                                tmpObject.updateUserId = newObject.updateUserId;
                           
                                tmpObject.islimitDate = newObject.islimitDate;
                                tmpObject.isActive = newObject.isActive;



                                entity.SaveChanges();

                                message = tmpObject.Id.ToString();
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
                int Id = 0;
                int userId = 0;
                bool final = false;

                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "Id")
                    {
                        Id = int.Parse(c.Value);
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
                        
                            countryPackageDate objectDelete = entity.countryPackageDate.Find(Id);
                          
                            entity.countryPackageDate.Remove(objectDelete);
                            message = entity.SaveChanges().ToString();
                            return TokenManager.GenerateToken(message);

                        }
                    }


                    catch(Exception ex)
                    {
                     //   return TokenManager.GenerateToken("0");
                        return TokenManager.GenerateToken(ex.ToString());
                    }

                }
                else
                {
                    try
                    {
                        using (incprogramsdbEntities entity = new incprogramsdbEntities())
                        {
                            countryPackageDate objectDelete = entity.countryPackageDate.Find(Id);

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

        [HttpPost]
        [Route("GetByCustomerPackId")]
        public string GetByCustomerPackId(string token)//int packageUserId
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
                int packageId = 0;

                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "customerId")
                    {
                        customerId = int.Parse(c.Value);
                    }
                    if (c.Type == "packageId")
                    {
                        packageId = int.Parse(c.Value);
                    }

                }
                try
                {
                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        var List = (from D in entity.countryPackageDate
                                    join N in entity.countriesCodes on D.countryId equals N.countryId
                                    join C in entity.customers on N.countryId equals C.countryId
                                    join S in entity.packages on D.packageId equals S.packageId

                                    where C.countryId == D.countryId && S.packageId== packageId && C.custId == customerId

                                    select new countryPackageDateModel()
                                    {

                                        Id = D.Id,
                                        countryId = D.countryId,
                                   
                                        packageId = D.packageId,
                                        monthCount = D.monthCount,
                                    
                                        price = D.price,
                                        notes = D.notes,
                                       
                                        islimitDate = D.islimitDate,
                                        isActive = D.isActive,
                                      
                                        currency = N.currency,



                                    }).ToList();

                        //var glist = List.GroupBy(X => X.packageId).Select(X => new packageUserModel
                        //{
                        //    packageId = X.FirstOrDefault().packageId,
                        //    notes = X.FirstOrDefault().notes,


                        //    isActive = X.FirstOrDefault().isActive,


                        //    packageName = X.FirstOrDefault().packageName,
                        //}).ToList();
                        return TokenManager.GenerateToken(List);

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