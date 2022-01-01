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


    [RoutePrefix("api/Statistics")]

    public class StatisticsController : ApiController

    {
        // GET api/<controller>


        [HttpPost]
        [Route("GetByAgentId")]
        public string GetByAgentId(string token)//int packageUserId
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
                int agentId = 0;


                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "agentId")
                    {
                        agentId = int.Parse(c.Value);
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
                                    join U in entity.users on PU.userId equals U.userId
                                    join UPUsr in entity.users on PU.updateUserId equals UPUsr.userId
                                    where PU.userId == agentId

                                    select new BookStsModel()
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
                                        //
                                        isServerActivated = PU.isServerActivated,
                                        activatedate = PU.activatedate,
                                        agentName = U.name,
                                        agentAccountName = U.AccountName,
                                        agentLastName = U.lastName,
                                        agentCompany = U.company,
                                        agentType = U.type,
                                        UPUsrName = UPUsr.name,
                                        UPUsrAccountName = UPUsr.AccountName,
                                        UPUsrLastName = UPUsr.lastName,
                                        UPUsrCompany = UPUsr.company,
                                        UPUsrType = UPUsr.type,
                                        countryName=N.name,


                                    }).ToList();

                        var glist = List.GroupBy(X => X.packageUserId).Select(X => new BookStsModel
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
                            //
                            isServerActivated = X.FirstOrDefault().isServerActivated,
                            activatedate = X.FirstOrDefault().activatedate,
                            agentName = X.FirstOrDefault().agentName,
                            agentAccountName = X.FirstOrDefault().agentAccountName,
                            agentLastName = X.FirstOrDefault().agentLastName,
                            agentCompany = X.FirstOrDefault().agentCompany,
                            agentType = X.FirstOrDefault().agentType,
                            UPUsrName = X.FirstOrDefault().UPUsrName,
                            UPUsrAccountName = X.FirstOrDefault().UPUsrAccountName,
                            UPUsrLastName = X.FirstOrDefault().UPUsrLastName,
                            UPUsrCompany = X.FirstOrDefault().UPUsrCompany,
                            UPUsrType = X.FirstOrDefault().UPUsrType,
                            countryName = X.FirstOrDefault().countryName,


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

    }
}