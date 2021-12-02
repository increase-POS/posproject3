using Newtonsoft.Json;
using Programs_Server;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Programs_Server.Models;
using System.IO;
using System.Net.Http.Headers;
using System.Web;


using Programs_Server.Models.VM;
using System.Security.Claims;
using Newtonsoft.Json.Converters;


namespace Programs_Server.Controllers
{


    [RoutePrefix("api/users")]

    public class usersController : ApiController

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
                        var List = (from S in entity.users
                                    select new usersModel()
                                    {
                                        userId = S.userId,
                                        name = S.name,
                                        AccountName = S.AccountName,
                                        lastName = S.lastName,
                                        company = S.company,
                                        email = S.email,
                                        phone = S.phone,
                                        mobile = S.mobile,
                                        fax = S.fax,
                                        address = S.address,
                                        agentLevel = S.agentLevel,
                                        createDate = S.createDate,
                                        updateDate = S.updateDate,
                                        code = S.code,
                                        password = S.password,
                                        type = S.type,
                                        image = S.image,
                                        notes = S.notes,
                                        balance = S.balance,
                                        createUserId = S.createUserId,
                                        updateUserId = S.updateUserId,
                                        isActive = S.isActive,
                                        isAdmin = S.isAdmin,
                                        groupId = S.groupId,
                                        balanceType = S.balanceType,
                                        job = S.job,
                                        isOnline = S.isOnline,

                                        countryId=S.countryId,


                                    }).ToList();

                        if (List.Count > 0)
                        {
                            for (int i = 0; i < List.Count; i++)
                            {
                                if (List[i].isActive == 1)
                                {
                                    int userId = (int)List[i].userId;
                                    var itemsI = entity.packageUser.Where(x => x.userId == userId).Select(b => new { b.userId }).FirstOrDefault();

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

        //get active users
        [HttpPost]
        [Route("GetActive")]
        public string GetActive(string token)
        {
            token = TokenManager.readToken(HttpContext.Current.Request);
            string type = "";
            Boolean canDelete = false;
            var strP = TokenManager.GetPrincipal(token);
            if (strP != "0") //invalid authorization
            {
                return TokenManager.GenerateToken(strP);
            }
            else
            {
                using (incprogramsdbEntities entity = new incprogramsdbEntities())
                {
                    var usersList = entity.users.Where(S => S.isActive == 1 && S.userId != 1)
                    .Select(S => new usersModel
                    {
                        userId = S.userId,
                        name = S.name,
                        AccountName = S.AccountName,
                        lastName = S.lastName,
                        company = S.company,
                        email = S.email,
                        phone = S.phone,
                        mobile = S.mobile,
                        fax = S.fax,
                        address = S.address,
                        agentLevel = S.agentLevel,
                        createDate = S.createDate,
                        updateDate = S.updateDate,
                        code = S.code,
                        password = S.password,
                        type = S.type,
                        image = S.image,
                        notes = S.notes,
                        balance = S.balance,
                        createUserId = S.createUserId,
                        updateUserId = S.updateUserId,
                        isActive = S.isActive,
                        isAdmin = S.isAdmin,
                        groupId = S.groupId,
                        balanceType = S.balanceType,
                        job = S.job,
                        isOnline = S.isOnline,
                        countryId = S.countryId,


                    })
                    .ToList();

                    return TokenManager.GenerateToken(usersList);
                }
            }
        }

        [HttpPost]
        [Route("Getloginuser")]
        public string Getloginuser(string token)
        {
            token = TokenManager.readToken(HttpContext.Current.Request);
            List<usersModel> usersList = new List<usersModel>();
            usersModel user = new usersModel();
            var strP = TokenManager.GetPrincipal(token);
            if (strP != "0") //invalid authorization
            {
                return TokenManager.GenerateToken(strP);
            }
            else
            {
                string userName = "";
                string password = "";
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "userName")
                    {
                        userName = c.Value;
                    }
                    else if (c.Type == "password")
                    {
                        password = c.Value;
                    }
                }

                usersModel emptyuser = new usersModel();

                emptyuser.createDate = DateTime.Now;
                emptyuser.updateDate = DateTime.Now;
                //emptyuser.username = userName;
                emptyuser.createUserId = 0;
                emptyuser.updateUserId = 0;
                emptyuser.userId = 0;
                emptyuser.isActive = 0;
                emptyuser.isOnline = 0;
                emptyuser.canDelete = false;
                emptyuser.balance = 0;
                emptyuser.balanceType = 0;
                try
                {

                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        usersList = entity.users.Where(S => S.isActive == 1 && S.AccountName == userName)
                        .Select(S => new usersModel
                        {
                            userId = S.userId,
                            name = S.name,
                            AccountName = S.AccountName,
                            lastName = S.lastName,
                            company = S.company,
                            email = S.email,
                            phone = S.phone,
                            mobile = S.mobile,
                            fax = S.fax,
                            address = S.address,
                            agentLevel = S.agentLevel,
                            createDate = S.createDate,
                            updateDate = S.updateDate,
                            code = S.code,
                            password = S.password,
                            type = S.type,
                            image = S.image,
                            notes = S.notes,
                            balance = S.balance,
                            createUserId = S.createUserId,
                            updateUserId = S.updateUserId,
                            isActive = S.isActive,
                            isAdmin = S.isAdmin,
                            groupId = S.groupId,
                            balanceType = S.balanceType,
                            job = S.job,
                            isOnline = S.isOnline,
                            countryId = S.countryId,
                        })
                        .ToList();

                        if (usersList == null || usersList.Count <= 0)
                        {
                            user = emptyuser;
                            // rong user
                            return TokenManager.GenerateToken(user);
                        }
                        else
                        {
                            user = usersList.Where(i => i.AccountName == userName).FirstOrDefault();
                            if (user.password.Equals(password))
                            {
                                // correct username and pasword
                                return TokenManager.GenerateToken(user);
                            }
                            else
                            {
                                // rong pass return just username
                                user = emptyuser;
                                user.AccountName = userName;
                                return TokenManager.GenerateToken(user);

                            }
                        }
                    }

                }
                catch
                {
                    return TokenManager.GenerateToken(emptyuser);
                }
            }
        }


        // GET api/<controller>
        [HttpPost]
        [Route("GetByID")]
        public string GetByID(string token)
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
                int userId = 0;


                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "userId")
                    {
                        userId = int.Parse(c.Value);
                    }


                }
                try
                {
                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        var row = entity.users
                       .Where(u => u.userId == userId)
                       .Select(S => new
                       {
                           S.userId,
                           S.name,
                           S.AccountName,
                           S.lastName,
                           S.company,
                           S.email,
                           S.phone,
                           S.mobile,
                           S.fax,
                           S.address,
                           S.agentLevel,
                           S.createDate,
                           S.updateDate,
                           S.code,
                           S.password,
                           S.type,
                           S.image,
                           S.notes,
                           S.balance,
                           S.createUserId,
                           S.updateUserId,
                           S.isActive,
                           S.isAdmin,
                           S.groupId,
                           S.balanceType,
                           S.job,
                           S.isOnline,
                            S.countryId,

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
        public string Save(string token)
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
                users newObject = null;
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "Object")
                    {
                        Object = c.Value.Replace("\\", string.Empty);
                        Object = Object.Trim('"');
                        newObject = JsonConvert.DeserializeObject<users>(Object, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });
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


                    try
                    {
                        using (incprogramsdbEntities entity = new incprogramsdbEntities())
                        {
                            var locationEntity = entity.Set<users>();
                            if (newObject.userId == 0)
                            {
                                newObject.createDate = DateTime.Now;
                                newObject.updateDate = DateTime.Now;
                                newObject.updateUserId = newObject.createUserId;


                                locationEntity.Add(newObject);
                                entity.SaveChanges();
                                message = newObject.userId.ToString();
                            }
                            else
                            {
                                var tmpObject = entity.users.Where(p => p.userId == newObject.userId).FirstOrDefault();

                                tmpObject.updateDate = DateTime.Now;
                                tmpObject.userId = newObject.userId;
                                tmpObject.name = newObject.name;
                                tmpObject.AccountName = newObject.AccountName;
                                tmpObject.lastName = newObject.lastName;
                                tmpObject.company = newObject.company;
                                tmpObject.email = newObject.email;
                                tmpObject.phone = newObject.phone;
                                tmpObject.mobile = newObject.mobile;
                                tmpObject.fax = newObject.fax;
                                tmpObject.address = newObject.address;
                                tmpObject.agentLevel = newObject.agentLevel;
                                //  tmpObject.createDate = newObject.createDate;

                                tmpObject.code = newObject.code;
                                tmpObject.password = newObject.password;
                                tmpObject.type = newObject.type;
                                tmpObject.image = newObject.image;
                                tmpObject.notes = newObject.notes;
                                tmpObject.balance = newObject.balance;
                                //   tmpObject.createUserId = newObject.createUserId;
                                tmpObject.updateUserId = newObject.updateUserId;
                                tmpObject.isActive = newObject.isActive;
                                tmpObject.isOnline = newObject.isOnline;
                                tmpObject.countryId = newObject.countryId;


                                entity.SaveChanges();

                                message = tmpObject.userId.ToString();
                            }
                        }
                        return TokenManager.GenerateToken(message);
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
        public string Delete(string token)//int userId, int signuserId, bool final
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
                int userId = 0;
                int signuserId = 0;
                bool final = false;

                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "userId")
                    {
                        userId = int.Parse(c.Value);
                    }
                    else if (c.Type == "signuserId")
                    {
                        signuserId = int.Parse(c.Value);
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
                            users objectDelete = entity.users.Find(userId);

                            entity.users.Remove(objectDelete);
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
                            users objectDelete = entity.users.Find(userId);

                            objectDelete.isActive = 0;
                            objectDelete.updateUserId = signuserId;
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

        [Route("PostUserImage")]
        public IHttpActionResult PostUserImage()
        {

            try
            {
                var httpRequest = HttpContext.Current.Request;

                foreach (string file in httpRequest.Files)
                {

                    HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created);

                    var postedFile = httpRequest.Files[file];
                    string imageName = postedFile.FileName;
                    string imageWithNoExt = Path.GetFileNameWithoutExtension(postedFile.FileName);

                    if (postedFile != null && postedFile.ContentLength > 0)
                    {

                        int MaxContentLength = 1024 * 1024 * 1; //Size = 1 MB

                        IList<string> AllowedFileExtensions = new List<string> { ".jpg", ".gif", ".png", ".bmp", ".jpeg", ".tiff", ".jfif" };
                        var ext = postedFile.FileName.Substring(postedFile.FileName.LastIndexOf('.'));
                        var extension = ext.ToLower();

                        if (!AllowedFileExtensions.Contains(extension))
                        {

                            var message = string.Format("Please Upload image of type .jpg,.gif,.png, .jfif, .bmp , .jpeg ,.tiff");
                            return Ok(message);
                        }
                        else if (postedFile.ContentLength > MaxContentLength)
                        {

                            var message = string.Format("Please Upload a file upto 1 mb.");

                            return Ok(message);
                        }
                        else
                        {
                            //  check if image exist
                            var pathCheck = Path.Combine(System.Web.Hosting.HostingEnvironment.MapPath("~\\images\\user"), imageWithNoExt);
                            var files = Directory.GetFiles(System.Web.Hosting.HostingEnvironment.MapPath("~\\images\\user"), imageWithNoExt + ".*");
                            if (files.Length > 0)
                            {
                                File.Delete(files[0]);
                            }

                            //Userimage myfolder name where i want to save my image
                            var filePath = Path.Combine(System.Web.Hosting.HostingEnvironment.MapPath("~\\images\\user"), imageName);
                            postedFile.SaveAs(filePath);

                        }
                    }

                    var message1 = string.Format("Image Updated Successfully.");
                    return Ok(message1);
                }
                var res = string.Format("Please Upload a image.");

                return Ok(res);
            }
            catch (Exception ex)
            {
                var res = string.Format("some Message");

                return Ok(res);
            }
        }

        [HttpGet]
        [Route("GetImage")]
        public HttpResponseMessage GetImage(string imageName)
        {
            if (String.IsNullOrEmpty(imageName))
                return Request.CreateResponse(HttpStatusCode.BadRequest);

            string localFilePath;

            localFilePath = Path.Combine(System.Web.Hosting.HostingEnvironment.MapPath("~\\images\\user"), imageName);

            HttpResponseMessage response = new HttpResponseMessage(HttpStatusCode.OK);
            response.Content = new StreamContent(new FileStream(localFilePath, FileMode.Open, FileAccess.Read));
            response.Content.Headers.ContentDisposition = new System.Net.Http.Headers.ContentDispositionHeaderValue("attachment");
            response.Content.Headers.ContentDisposition.FileName = imageName;

            return response;
        }
        [HttpPost]
        [Route("UpdateImage")]
        public string UpdateImage(string token)//string userObject//
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
                users userObj = null;
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "Object")
                    {
                        Object = c.Value.Replace("\\", string.Empty);
                        Object = Object.Trim('"');
                        userObj = JsonConvert.DeserializeObject<users>(Object, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });
                        break;
                    }
                }
                if (userObj != null)
                {


                    if (userObj.updateUserId == 0 || userObj.updateUserId == null)
                    {
                        Nullable<int> id = null;
                        userObj.updateUserId = id;
                    }
                    if (userObj.createUserId == 0 || userObj.createUserId == null)
                    {
                        Nullable<int> id = null;
                        userObj.createUserId = id;
                    }

                    try
                    {
                        users user;
                        using (incprogramsdbEntities entity = new incprogramsdbEntities())
                        {
                            var userEntity = entity.Set<users>();
                            user = entity.users.Where(p => p.userId == userObj.userId).First();
                            user.image = userObj.image;
                            entity.SaveChanges();
                        }

                        return TokenManager.GenerateToken(user.userId.ToString());
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
        [Route("GetLastNumOfCode")]
        public string GetLastNumOfCode(string token)//string type
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
                string type = "";
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "type")
                    {
                        type = c.Value;
                    }


                }

                try
                {

                    List<string> numberList;
                    int lastNum = 0;
                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        numberList = entity.users.Where(b => b.code.Contains(type + "-")).Select(b => b.code).ToList();

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
                catch
                {
                    return TokenManager.GenerateToken("0");
                }
            }

           
        }


    }
}