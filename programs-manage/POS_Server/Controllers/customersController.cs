using Newtonsoft.Json;
using Programs_Server;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Programs_Server.Models;

namespace Programs_Server.Controllers
{
  

[RoutePrefix("api/customers")]
public class customersController : ApiController
{
    // GET api/<controller>
    [HttpGet]
    [Route("Get")]
    public IHttpActionResult Get()
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
                var List = (from S in entity.customers
                            select new customersModel()
                            {
                                custId = S.custId,
                            
                                createDate = S.createDate,
                                updateDate = S.updateDate,
                                createUserId = S.createUserId,
                                updateUserId = S.updateUserId,
                                balance = S.balance,
                               

                                email = S.email,
                                phone = S.phone,
                                mobile = S.mobile,
                                fax = S.fax,
                                address = S.address,


                            }).ToList();
                /*
public int membershipId { get; set; }
    public string name { get; set; }
    public Nullable<decimal> deliveryDiscount { get; set; }
    public string deliveryDiscountType { get; set; }
    public Nullable<decimal> invoiceDiscount { get; set; }
    public string invoiceDiscountType { get; set; }
    public Nullable<decimal> subscriptionFee { get; set; }
    public string notes { get; set; }
    public Nullable<System.DateTime> createDate { get; set; }
    public Nullable<System.DateTime> updateDate { get; set; }
    public Nullable<int> createUserId { get; set; }
    public Nullable<int> updateUserId { get; set; }
    public Nullable<byte> isActive { get; set; }
    public bool canDelete { get; set; }


                */

                if (List.Count > 0)
                {
                    for (int i = 0; i < List.Count; i++)
                    {
                        if (List[i].isActive == 1)
                        {
                            int custId = (int)List[i].custId;
                            var itemsI = entity.invoices.Where(x => x.custId == custId).Select(b => new { b.invoiceId }).FirstOrDefault();

                            if ((itemsI is null))
                                canDelete = true;
                        }
                        List[i].canDelete = canDelete;
                    }
                }

                if (List == null)
                    return NotFound();
                else
                    return Ok(List);
            }
        }
        //else
        return NotFound();
    }

    // GET api/<controller>
    [HttpGet]
    [Route("GetByID")]
    public IHttpActionResult GetByID(int custId)
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

        if (valid)
        {
            using (incprogramsdbEntities entity = new incprogramsdbEntities())
            {
                var row = entity.customers
               .Where(u => u.custId == custId)
               .Select(S => new
               {
                   S.custId,
                 
                   S.notes,
                   S.createDate,
                   S.updateDate,
                   S.createUserId,
                   S.updateUserId,
                  
                   S.balance,

                   S.email,
                   S.phone,
                   S.mobile,
                   S.fax,
                   S.address,

               })
               .FirstOrDefault();

                if (row == null)
                    return NotFound();
                else
                    return Ok(row);
            }
        }
        else
            return NotFound();
    }

    // add or update location
    [HttpPost]
    [Route("Save")]
    public string Save(string Object)
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
            Object = Object.Replace("\\", string.Empty);
            Object = Object.Trim('"');
            customers newObject = JsonConvert.DeserializeObject<customers>(Object, new JsonSerializerSettings { DateParseHandling = DateParseHandling.None });
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

            try
            {
                using (incprogramsdbEntities entity = new incprogramsdbEntities())
                {
                    var locationEntity = entity.Set<customers>();
                    if (newObject.custId == 0)
                    {
                        newObject.createDate = DateTime.Now;
                        newObject.updateDate = DateTime.Now;
                        newObject.updateUserId = newObject.createUserId;


                        locationEntity.Add(newObject);
                        entity.SaveChanges();
                        message = newObject.custId.ToString();
                    }
                    else
                    {
                        var tmpObject = entity.customers.Where(p => p.custId == newObject.custId).FirstOrDefault();

                        tmpObject.updateDate = DateTime.Now;
                        tmpObject.updateUserId = newObject.updateUserId;

                   
                        tmpObject.notes = newObject.notes;
                      
                        tmpObject.balance = newObject.balance;
                    
                        tmpObject.email = newObject.email;
                        tmpObject.phone = newObject.phone;
                        tmpObject.mobile = newObject.mobile;
                        tmpObject.fax = newObject.fax;
                        tmpObject.address = newObject.address;

                        entity.SaveChanges();

                        message = tmpObject.custId.ToString();
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

    [HttpPost]
    [Route("Delete")]
    public string Delete(int custId, int userId, bool final)
    {
        var re = Request;
        var headers = re.Headers;
        string token = "";
        int message = 0;
        if (headers.Contains("APIKey"))
        {
            token = headers.GetValues("APIKey").First();
        }

        Validation validation = new Validation();
        bool valid = validation.CheckApiKey(token);
        if (valid)
        {
            if (final)
            {
                try
                {
                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        customers objectDelete = entity.customers.Find(custId);

                        entity.customers.Remove(objectDelete);
                        message = entity.SaveChanges();

                        return message.ToString();
                    }
                }
                catch
                {
                    return "-1";
                }
            }
            else
            {
                try
                {
                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        customers objectDelete = entity.customers.Find(custId);

                        objectDelete.isActive = 0;
                        objectDelete.updateUserId = userId;
                        objectDelete.updateDate = DateTime.Now;
                        message = entity.SaveChanges();

                        return message.ToString(); ;
                    }
                }
                catch
                {
                    return "-2";
                }
            }
        }
        else
            return "-3";
    }



}
}