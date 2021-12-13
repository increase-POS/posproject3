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

namespace Programs_Server.Controllers
{
    [RoutePrefix("api/Country")]
    public class CountryController : ApiController
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
                        var List = entity.countriesCodes.ToList()
                             .Select(c => new
                             {
                                 c.countryId,
                                 c.code,
                                 c.name,
                                 c.currency,
                                 c.isDefault,
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


        [HttpPost]
        [Route("GetAllCities")]
        public string GetAllCities(string token)
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
                        var countrylist = entity.countriesCodes.ToList()
                             .Select(c => new
                             {
                                 c.countryId,
                                 c.code,
                                 c.isDefault,
                             }).ToList();


                        return TokenManager.GenerateToken(countrylist);

                    }


                }
                catch
                {
                    return TokenManager.GenerateToken("0");
                }
            }
        }


        [HttpPost]
        [Route("GetAllRegion")]
        public string GetAllRegion(string token)
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
                        var countrylist = entity.countriesCodes.ToList()
                             .Select(c => new
                             {
                                 c.countryId,
                                 c.code,
                                 c.currency,
                                 c.name,
                                 c.isDefault,

                             }).ToList();
                        return TokenManager.GenerateToken(countrylist);

                    }

                }

                catch
                {
                    return TokenManager.GenerateToken("0");
                }
            }
        }

        [HttpPost]
        [Route("UpdateIsdefault")]
        public string UpdateIsdefault(string token)
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
                int countryId = 0;


                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "countryId")
                    {
                        countryId = int.Parse(c.Value);
                    }


                }

                try
                {
                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        // reset all to 0
                        List<countriesCodes> objectlist = entity.countriesCodes.Where(x => x.isDefault == 1).ToList();
                        if (objectlist.Count > 0)
                        {
                            for (int i = 0; i < objectlist.Count; i++)
                            {
                                objectlist[i].isDefault = 0;

                            }
                            entity.SaveChanges();
                        }
                        // set is selected to isdefault=1
                        countriesCodes objectrow = entity.countriesCodes.Find(countryId);

                        if (objectrow != null)
                        {
                            objectrow.isDefault = 1;

                            message = objectrow.countryId.ToString();
                            entity.SaveChanges();
                        }
                        else
                        {
                            message = "-1";
                        }
                        //  entity.SaveChanges();
                    }
                }
                catch
                {
                    message = "-1";
                }
            }
            return TokenManager.GenerateToken(message);
        }

        [HttpPost]
        [Route("GetByID")]
        public string GetByID(string token)//Id
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
                        var list = entity.countriesCodes.ToList()
                       .Where(c => c.countryId == Id)
                       .Select(c => new
                       {
                           c.countryId,
                           c.code,
                           c.currency,
                           c.name,
                           c.isDefault
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

    }
}