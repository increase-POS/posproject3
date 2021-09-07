using Newtonsoft.Json;
using Programs_Server.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Programs_Server.Controllers
{
    [RoutePrefix("api/Country")]
    public class CountryController : ApiController
    {
        // GET api/<controller>
        [HttpGet]
        [Route("GetAll")]
        public IHttpActionResult GetAll()
        {
            var re = Request;
            var headers = re.Headers;
            string token = "";
            bool canDelete = false;

            if (headers.Contains("APIKey"))
            {
                token = headers.GetValues("APIKey").First();
            }

            Validation validation = new Validation();
            bool valid = validation.CheckApiKey(token);

            if (valid) // APIKey is valid
            {
                using (incprogramsdbEntities entity = new incprogramsdbEntities())
                {
                    var List = entity.countriesCodes.ToList()
                         .Select(c => new {
                             c.countryId,
                             c.code,
                         }).ToList();
                

                    if (List == null)
                        return NotFound();
                    else
                        return Ok(List);
                }
            }
            //else
            return NotFound();
        }


        [HttpGet]
        [Route("GetAllCities")]
        public IHttpActionResult GetAllCities()
        {
            var re = Request;
            var headers = re.Headers;
            string token = "";

            if (headers.Contains("APIKey"))
            {
                token = headers.GetValues("APIKey").First();
            }
            Validation validation = new Validation();
            bool valid = validation.CheckApiKey(token);

            if (valid) // APIKey is valid
            {
                using (incprogramsdbEntities entity = new incprogramsdbEntities())
                {
                    var countrylist = entity.countriesCodes.ToList()
                         .Select(c => new {
                             c.countryId,
                             c.code,
                             c.isDefault,
                         }).ToList();


                    if (countrylist == null)
                    { return Ok(countrylist); }
                    //return ("no");
                    //return NotFound();
                    else
                    { return Ok(countrylist);}
                        
                }
            }
            else
                return NotFound();
        }



        [HttpGet]
        [Route("GetAllRegion")]
        public IHttpActionResult GetAllRegion()
        {
            var re = Request;
            var headers = re.Headers;
            string token = "";

            if (headers.Contains("APIKey"))
            {
                token = headers.GetValues("APIKey").First();
            }
            Validation validation = new Validation();
            bool valid = validation.CheckApiKey(token);

            if (valid) // APIKey is valid
            {
                using (incprogramsdbEntities entity = new incprogramsdbEntities())
                {
                    var countrylist = entity.countriesCodes.ToList()
                         .Select(c => new {
                             c.countryId,
                             c.code,
                             c.currency,
                             c.name,
                             c.isDefault,

                         }).ToList();


                    if (countrylist == null)
                        return NotFound();
                    else
                        return Ok(countrylist);
                }
            }
            else
                return NotFound();
        }

        [HttpPost]
        [Route("UpdateIsdefault")]
        public string UpdateIsdefault(int countryId)
        {
            var re = Request;
            var headers = re.Headers;
            string token = "";
            string message = "";
            if (headers.Contains("APIKey"))
            {
                token = headers.GetValues("APIKey").First();
            }
            Validation validation = new Validation();
            bool valid = validation.CheckApiKey(token);

            if (valid)
            {
               

                try
                {
                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        // reset all to 0
                        List<countriesCodes> objectlist = entity.countriesCodes.Where(x=>x.isDefault==1).ToList();
                        if (objectlist.Count > 0)
                        {
                            for(int i=0;i< objectlist.Count; i++)
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
            return message;
        }

        [HttpGet]
        [Route("GetByID")]
        public IHttpActionResult GetByID()
        {
            var re = Request;
            var headers = re.Headers;
            string token = "";
            int cId = 0;
            if (headers.Contains("APIKey"))
            {
                token = headers.GetValues("APIKey").First();
            }
            if (headers.Contains("Id"))
            {
                cId = Convert.ToInt32(headers.GetValues("Id").First());
            }
            Validation validation = new Validation();
            bool valid = validation.CheckApiKey(token);

            if (valid)
            {
                using (incprogramsdbEntities entity = new incprogramsdbEntities())
                {
                    var list = entity.countriesCodes.ToList()
                   .Where(c => c.countryId == cId)
                   .Select(c => new {
                       c.countryId,
                       c.code,
                       c.currency,
                       c.name,
                       c.isDefault
                   })
                   .FirstOrDefault();

                    if (list == null)
                        return NotFound();
                    else
                        return Ok(list);
                }
            }
            else
                return NotFound();
        }



    }
}