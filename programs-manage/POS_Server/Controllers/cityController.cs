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
using System.Web;


namespace Programs_Server.Controllers
{
    [RoutePrefix("api/city")]
    public class cityController : ApiController
    {
        // GET api/<controller> get all coupons
        [HttpPost]
        [Route("Get")]
  
            public string Get(string token)
            {

                // public ResponseVM GetPurinv(string token)

                //int mainBranchId, int userId    DateTime? date=new DateTime?();

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

                            var list = entity.cities

                       .Select(c => new
                       {
                           c.cityId,
                           c.cityCode,
                           c.countryId
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



    }
}