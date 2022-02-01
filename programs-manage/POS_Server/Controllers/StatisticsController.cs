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

        // for agent
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
                                   join PA in entity.payOp on PU.packageUserId equals PA.packageUserId
                                    join D in entity.countryPackageDate on PA.countryPackageId equals D.Id

                                    join N in entity.countriesCodes on D.countryId equals N.countryId
                                    join C in entity.customers on PA.customerId equals C.custId
                                 
                                    join S in entity.packages on D.packageId equals S.packageId
                                    join G in entity.programs on S.programId equals G.programId
                                    join V in entity.versions on S.verId equals V.verId
                                    join AG in entity.users on PA.agentId equals AG.userId//agent ID
                            
                                    join UPUsr in entity.users on PA.updateUserId equals UPUsr.userId
                                    where PU.userId == agentId && PA.type != "rn"

                                    select new BookStsModel()
                                    {
                                        packageUserId = PU.packageUserId,
                                        packageId = PU.packageId,
                                        packageNumber = PU.packageNumber, //book number
                                        bookDate = PU.bookDate,//book date
                                        createDatePo = PA.createDate,//upgrade date
                                        packageName = S.packageName,

                                        agentId = PA.agentId,
                                        agentName = AG.name,
                                        agentAccountName = AG.AccountName,
                                        agentLastName = AG.lastName,
                                        agentCompany = AG.company,
                                        agentType = AG.type,
                                        agentCountryId = AG.countryId,
                                        
                                        customerId = PA.customerId,
                                        customerName = C.custname,
                                        customerLastName = C.lastName,
                                        customerCompany=C.company,
                                        //  customerCountryId=CC.countryId
                                        Price = PA.Price,
                                        currency = N.currency,

                                        notes = PU.notes,

                                        isActive = PU.isActive,


                                        programName = G.name,
                                        programId = G.programId,
                                        verName = V.name,
                                        verId = V.verId,
                                        branchCount = S.branchCount,


                                        userId = PU.userId,

                                        packageSaleCode = PU.packageSaleCode,


                                        customerServerCode = PU.customerServerCode,
                                        isBooked = PU.isBooked,

                                        createDate = PU.createDate,
                                        //updateDate = PU.updateDate,
                                        //createUserId = PU.createUserId,
                                        //updateUserId = PU.updateUserId,
                                        expireDate = PA.expireDate,
                                        isOnlineServer = PU.isOnlineServer,
                                        countryPackageId = PU.countryPackageId,
                                        canRenew = PU.canRenew,
                                        typePu = PU.type,

                                        monthCount = D.monthCount,
                                        islimitDate = D.islimitDate,
                                        //
                                        isServerActivated = PU.isServerActivated,
                                        activatedate = PU.activatedate,

                                        CusrName = UPUsr.name,
                                        CusrAccountName = UPUsr.AccountName,
                                        CusrLastName = UPUsr.lastName,
                                        CusrCompany = UPUsr.company,
                                        CusrType = UPUsr.type,
                                        countryName = N.name,
                                        countryId = D.countryId,
                                        payOpId = PA.payOpId,

                                        //  Price=PA.Price,
                                        codePo = PA.code,
                                        typePo = PA.type,
                                        //discountValue=PA.discountValue
                                        agentIdPo = PA.agentId,
                                        customerIdPo = PA.customerId,
                                        countryPackageIdPo = PA.countryPackageId,
                                        // totalnet = PA.totalnet,

                                        // packageIdPo = PA.packageId,
                                        createUserIdPo = PA.createUserId,
                                        updateUserIdPo = PA.updateUserId,
                                        updateDatePo = PA.updateDate,
                                    }).ToList();

                        //var glist = List.GroupBy(X => X.payOpId).Select(X => new BookStsModel
                        //{


                        //    packageUserId =  X.FirstOrDefault().packageUserId,
                        //    packageId =  X.FirstOrDefault().packageId,
                        //    packageNumber =  X.FirstOrDefault().packageNumber, //book number
                        //    bookDate =  X.FirstOrDefault().bookDate,//book date
                        //    createDatePo =  X.FirstOrDefault().createDate,//upgrade date
                        //    packageName = X.FirstOrDefault().packageName,

                        //    agentId =  X.FirstOrDefault().agentId,
                        //    agentName =  X.FirstOrDefault().agentName,
                        //    agentAccountName =  X.FirstOrDefault().agentAccountName,
                        //    agentLastName =  X.FirstOrDefault().agentLastName,
                        //    agentCompany =  X.FirstOrDefault().agentCompany,
                        //    agentType =  X.FirstOrDefault().agentType,

                        //    customerId =  X.FirstOrDefault().customerId,
                        //    customerName =  X.FirstOrDefault().customerName,
                        //    customerLastName =  X.FirstOrDefault().customerLastName,
                        //    price =  X.FirstOrDefault().price,


                        //    notes =  X.FirstOrDefault().notes,

                        //    isActive =  X.FirstOrDefault().isActive,


                        //    programName =  X.FirstOrDefault().programName,
                        //    programId =  X.FirstOrDefault().programId,
                        //    verName =  X.FirstOrDefault().verName,
                        //    verId =  X.FirstOrDefault().verId,
                        //    branchCount = X.FirstOrDefault().branchCount,


                        //    userId =  X.FirstOrDefault().userId,

                        //    packageSaleCode =  X.FirstOrDefault().packageSaleCode,


                        //    customerServerCode =  X.FirstOrDefault().customerServerCode,
                        //    isBooked =  X.FirstOrDefault().isBooked,

                        //    createDate =  X.FirstOrDefault().createDate,
                        //    updateDate =  X.FirstOrDefault().updateDate,
                        //    createUserId =  X.FirstOrDefault().createUserId,
                        //    updateUserId =  X.FirstOrDefault().updateUserId,


                        //    expireDate =  X.FirstOrDefault().expireDate,
                        //    isOnlineServer =  X.FirstOrDefault().isOnlineServer,
                        //    countryPackageId =  X.FirstOrDefault().countryPackageId,
                        //    canRenew =  X.FirstOrDefault().canRenew,
                        //    typePu =  X.FirstOrDefault().typePu,

                        //    monthCount =  X.FirstOrDefault().monthCount,
                        //    islimitDate =  X.FirstOrDefault().islimitDate,
                        //    //
                        //    isServerActivated =  X.FirstOrDefault().isServerActivated,
                        //    activatedate =  X.FirstOrDefault().activatedate,

                        //    CusrName =  X.FirstOrDefault().CusrName,
                        //    CusrAccountName =  X.FirstOrDefault().CusrAccountName,
                        //    CusrLastName =  X.FirstOrDefault().CusrLastName,
                        //    CusrCompany =  X.FirstOrDefault().CusrCompany,
                        //    CusrType =  X.FirstOrDefault().CusrType,
                        //    countryName =  X.FirstOrDefault().countryName,
                        //    payOpId =  X.FirstOrDefault().payOpId,

                        //    //  Price= X.FirstOrDefault().Price,
                        //    codePo =  X.FirstOrDefault().codePo,
                        //    typePo =  X.FirstOrDefault().typePo,
                        //    //discountValue= X.FirstOrDefault().discountValue
                        //    agentIdPo =  X.FirstOrDefault().agentIdPo,
                        //    customerIdPo =  X.FirstOrDefault().customerIdPo,
                        //    countryPackageIdPo =  X.FirstOrDefault().countryPackageIdPo,
                        //    // totalnet =  X.FirstOrDefault().totalnet,

                        //    // packageIdPo =  X.FirstOrDefault().packageId,
                        //    createUserIdPo =  X.FirstOrDefault().createUserIdPo,
                        //    updateUserIdPo =  X.FirstOrDefault().updateUserIdPo,

                        //    updateDatePo =  X.FirstOrDefault().updateDatePo,


                        //}).ToList();
                        //   return TokenManager.GenerateToken(glist);
                        return TokenManager.GenerateToken(List);

                    }

                }
                catch
                {
                    return TokenManager.GenerateToken("0");
                }
            }



        }
        // for admin or user
        [HttpPost]
        [Route("GetAllBooks")]
        public string GetAllBooks(string token)//int packageUserId
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
                // int agentId = 0;


                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                //foreach (Claim c in claims)
                //{
                //    if (c.Type == "agentId")
                //    {
                //        agentId = int.Parse(c.Value);
                //    }


                //}
                try
                {
                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        var List = (from PU in entity.packageUser
                                    join PA in entity.payOp on PU.packageUserId equals PA.packageUserId
                                    join D in entity.countryPackageDate on PA.countryPackageId equals D.Id

                                    join N in entity.countriesCodes on D.countryId equals N.countryId
                                    join C in entity.customers on PA.customerId equals C.custId
                                    join CC in entity.countriesCodes on C.countryId equals CC.countryId
                                    join S in entity.packages on D.packageId equals S.packageId
                                    join G in entity.programs on S.programId equals G.programId
                                    join V in entity.versions on S.verId equals V.verId
                                    join AG in entity.users on PA.agentId equals AG.userId//agent ID
                                    join AC in entity.countriesCodes on AG.countryId equals AC.countryId
                                    join UPUsr in entity.users on PA.updateUserId equals UPUsr.userId
                                    where PA.type != "rn"

                                    select new BookStsModel()
                                    {
                                        packageUserId = PU.packageUserId,
                                        packageId = PU.packageId,
                                        packageNumber = PU.packageNumber, //book number
                                        bookDate = PU.bookDate,//book date
                                        createDatePo = PA.createDate,//upgrade date
                                        packageName = S.packageName,

                                        agentId = PA.agentId,
                                        agentName = AG.name,
                                        agentAccountName = AG.AccountName,
                                        agentLastName = AG.lastName,
                                        agentCompany = AG.company,
                                        agentType = AG.type,

                                        agentCountryId = AG.countryId,
                                        agentCountry = AC.name,

                                        customerCountryId = C.countryId,
                                        customerCountry = CC.name,

                                        customerId = PA.customerId,
                                        customerName = C.custname,
                                        customerLastName = C.lastName,
                                        customerCompany = C.company,
                                        Price = PA.Price,
                                        currency = N.currency,

                                        notes = PU.notes,

                                        isActive = PU.isActive,


                                        programName = G.name,
                                        programId = G.programId,
                                        verName = V.name,
                                        verId = V.verId,
                                        branchCount = S.branchCount,


                                        userId = PU.userId,

                                        packageSaleCode = PU.packageSaleCode,


                                        customerServerCode = PU.customerServerCode,
                                        isBooked = PU.isBooked,

                                        createDate = PU.createDate,
                                        //updateDate = PU.updateDate,
                                        //createUserId = PU.createUserId,
                                        //updateUserId = PU.updateUserId,


                                        expireDate = PA.expireDate,
                                        isOnlineServer = PU.isOnlineServer,
                                        countryPackageId = PU.countryPackageId,
                                        canRenew = PU.canRenew,
                                        typePu = PU.type,

                                        monthCount = D.monthCount,
                                        islimitDate = D.islimitDate,
                                        //
                                        isServerActivated = PU.isServerActivated,
                                        activatedate = PU.activatedate,

                                        CusrName = UPUsr.name,
                                        CusrAccountName = UPUsr.AccountName,
                                        CusrLastName = UPUsr.lastName,
                                        CusrCompany = UPUsr.company,
                                        CusrType = UPUsr.type,
                                        countryName = N.name,
                                        countryId = D.countryId,
                                        payOpId = PA.payOpId,

                                        //  Price=PA.Price,
                                        codePo = PA.code,
                                        typePo = PA.type,
                                        //discountValue=PA.discountValue
                                        agentIdPo = PA.agentId,
                                        customerIdPo = PA.customerId,
                                        countryPackageIdPo = PA.countryPackageId,
                                        // totalnet = PA.totalnet,

                                        // packageIdPo = PA.packageId,
                                        createUserIdPo = PA.createUserId,
                                        updateUserIdPo = PA.updateUserId,

                                        updateDatePo = PA.updateDate,


                                    }).ToList();

                        //var glist = List.GroupBy(X => X.payOpId).Select(X => new BookStsModel
                        //{


                        //    packageUserId =  X.FirstOrDefault().packageUserId,
                        //    packageId =  X.FirstOrDefault().packageId,
                        //    packageNumber =  X.FirstOrDefault().packageNumber, //book number
                        //    bookDate =  X.FirstOrDefault().bookDate,//book date
                        //    createDatePo =  X.FirstOrDefault().createDate,//upgrade date
                        //    packageName = X.FirstOrDefault().packageName,

                        //    agentId =  X.FirstOrDefault().agentId,
                        //    agentName =  X.FirstOrDefault().agentName,
                        //    agentAccountName =  X.FirstOrDefault().agentAccountName,
                        //    agentLastName =  X.FirstOrDefault().agentLastName,
                        //    agentCompany =  X.FirstOrDefault().agentCompany,
                        //    agentType =  X.FirstOrDefault().agentType,

                        //    customerId =  X.FirstOrDefault().customerId,
                        //    customerName =  X.FirstOrDefault().customerName,
                        //    customerLastName =  X.FirstOrDefault().customerLastName,
                        //    price =  X.FirstOrDefault().price,


                        //    notes =  X.FirstOrDefault().notes,

                        //    isActive =  X.FirstOrDefault().isActive,


                        //    programName =  X.FirstOrDefault().programName,
                        //    programId =  X.FirstOrDefault().programId,
                        //    verName =  X.FirstOrDefault().verName,
                        //    verId =  X.FirstOrDefault().verId,
                        //    branchCount = X.FirstOrDefault().branchCount,


                        //    userId =  X.FirstOrDefault().userId,

                        //    packageSaleCode =  X.FirstOrDefault().packageSaleCode,


                        //    customerServerCode =  X.FirstOrDefault().customerServerCode,
                        //    isBooked =  X.FirstOrDefault().isBooked,

                        //    createDate =  X.FirstOrDefault().createDate,
                        //    updateDate =  X.FirstOrDefault().updateDate,
                        //    createUserId =  X.FirstOrDefault().createUserId,
                        //    updateUserId =  X.FirstOrDefault().updateUserId,


                        //    expireDate =  X.FirstOrDefault().expireDate,
                        //    isOnlineServer =  X.FirstOrDefault().isOnlineServer,
                        //    countryPackageId =  X.FirstOrDefault().countryPackageId,
                        //    canRenew =  X.FirstOrDefault().canRenew,
                        //    typePu =  X.FirstOrDefault().typePu,

                        //    monthCount =  X.FirstOrDefault().monthCount,
                        //    islimitDate =  X.FirstOrDefault().islimitDate,
                        //    //
                        //    isServerActivated =  X.FirstOrDefault().isServerActivated,
                        //    activatedate =  X.FirstOrDefault().activatedate,

                        //    CusrName =  X.FirstOrDefault().CusrName,
                        //    CusrAccountName =  X.FirstOrDefault().CusrAccountName,
                        //    CusrLastName =  X.FirstOrDefault().CusrLastName,
                        //    CusrCompany =  X.FirstOrDefault().CusrCompany,
                        //    CusrType =  X.FirstOrDefault().CusrType,
                        //    countryName =  X.FirstOrDefault().countryName,
                        //    payOpId =  X.FirstOrDefault().payOpId,

                        //    //  Price= X.FirstOrDefault().Price,
                        //    codePo =  X.FirstOrDefault().codePo,
                        //    typePo =  X.FirstOrDefault().typePo,
                        //    //discountValue= X.FirstOrDefault().discountValue
                        //    agentIdPo =  X.FirstOrDefault().agentIdPo,
                        //    customerIdPo =  X.FirstOrDefault().customerIdPo,
                        //    countryPackageIdPo =  X.FirstOrDefault().countryPackageIdPo,
                        //    // totalnet =  X.FirstOrDefault().totalnet,

                        //    // packageIdPo =  X.FirstOrDefault().packageId,
                        //    createUserIdPo =  X.FirstOrDefault().createUserIdPo,
                        //    updateUserIdPo =  X.FirstOrDefault().updateUserIdPo,

                        //    updateDatePo =  X.FirstOrDefault().updateDatePo,


                        //}).ToList();
                        //   return TokenManager.GenerateToken(glist);
                        return TokenManager.GenerateToken(List);

                    }

                }
                catch
                {
                    return TokenManager.GenerateToken("0");
                }
            }



        }


        //payments
        // for agent
        [HttpPost]
        [Route("GetPaymentsByAgentId")]
        public string GetPaymentsByAgentId(string token)//int packageUserId
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
                                    join PA in entity.payOp on PU.packageUserId equals PA.packageUserId
                                    join D in entity.countryPackageDate on PA.countryPackageId equals D.Id

                                    join N in entity.countriesCodes on D.countryId equals N.countryId
                                    join C in entity.customers on PA.customerId equals C.custId

                                    join S in entity.packages on D.packageId equals S.packageId
                                    join G in entity.programs on S.programId equals G.programId
                                    join V in entity.versions on S.verId equals V.verId
                                    join AG in entity.users on PA.agentId equals AG.userId//agent ID

                                    join UPUsr in entity.users on PA.updateUserId equals UPUsr.userId
                                    where PU.userId == agentId 

                                    select new PaymentsStsModel()
                                    {
                                        packageUserId = PU.packageUserId,
                                        packageId = PU.packageId,
                                        packageNumber = PU.packageNumber, //book number
                                        bookDate = PU.bookDate,//book date
                                        createDatePo = PA.createDate,//upgrade date
                                        packageName = S.packageName,

                                        agentId = PA.agentId,
                                        agentName = AG.name,
                                        agentAccountName = AG.AccountName,
                                        agentLastName = AG.lastName,
                                        agentCompany = AG.company,
                                        agentType = AG.type,
                                        agentCountryId = AG.countryId,

                                        customerId = PA.customerId,
                                        customerName = C.custname,
                                        customerLastName = C.lastName,
                                        customerCompany = C.company,
                                        //  customerCountryId=CC.countryId
                                        Price = PA.Price,
                                        currency = N.currency,

                                        notes = PU.notes,

                                        isActive = PU.isActive,


                                        programName = G.name,
                                        programId = G.programId,
                                        verName = V.name,
                                        verId = V.verId,
                                        branchCount = S.branchCount,


                                        userId = PU.userId,

                                        packageSaleCode = PU.packageSaleCode,


                                        customerServerCode = PU.customerServerCode,
                                        isBooked = PU.isBooked,

                                        createDate = PU.createDate,
                                        //updateDate = PU.updateDate,
                                        //createUserId = PU.createUserId,
                                        //updateUserId = PU.updateUserId,


                                        expireDate = PA.expireDate,
                                        isOnlineServer = PU.isOnlineServer,
                                        countryPackageId = PU.countryPackageId,
                                        canRenew = PU.canRenew,
                                        typePu = PU.type,

                                        monthCount = D.monthCount,
                                        islimitDate = D.islimitDate,
                                        //
                                        isServerActivated = PU.isServerActivated,
                                        activatedate = PU.activatedate,

                                        CusrName = UPUsr.name,
                                        CusrAccountName = UPUsr.AccountName,
                                        CusrLastName = UPUsr.lastName,
                                        CusrCompany = UPUsr.company,
                                        CusrType = UPUsr.type,
                                        countryName = N.name,
                                        countryId = D.countryId,
                                        payOpId = PA.payOpId,

                                        //  Price=PA.Price,
                                        codePo = PA.code,
                                        typePo = PA.type,
                                  
                                        discountValue = PA.discountValue,
                                        totalnet = PA.totalnet,

                                        agentIdPo = PA.agentId,
                                        customerIdPo = PA.customerId,
                                        countryPackageIdPo = PA.countryPackageId,

                                        // packageIdPo = PA.packageId,
                                        createUserIdPo = PA.createUserId,
                                        updateUserIdPo = PA.updateUserId,

                                        updateDatePo = PA.updateDate,


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

        // for admin or user
        [HttpPost]
        [Route("GetAllPayments")]
        public string GetAllPayments(string token)//int packageUserId
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
                // int agentId = 0;


                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                //foreach (Claim c in claims)
                //{
                //    if (c.Type == "agentId")
                //    {
                //        agentId = int.Parse(c.Value);
                //    }


                //}
                try
                {
                    using (incprogramsdbEntities entity = new incprogramsdbEntities())
                    {
                        var List = (from PU in entity.packageUser
                                    join PA in entity.payOp on PU.packageUserId equals PA.packageUserId
                                    join D in entity.countryPackageDate on PA.countryPackageId equals D.Id

                                    join N in entity.countriesCodes on D.countryId equals N.countryId
                                    join C in entity.customers on PA.customerId equals C.custId
                                    join CC in entity.countriesCodes on C.countryId equals CC.countryId
                                    join S in entity.packages on D.packageId equals S.packageId
                                    join G in entity.programs on S.programId equals G.programId
                                    join V in entity.versions on S.verId equals V.verId
                                    join AG in entity.users on PA.agentId equals AG.userId//agent ID
                                    join AC in entity.countriesCodes on AG.countryId equals AC.countryId
                                    join UPUsr in entity.users on PA.updateUserId equals UPUsr.userId
                                   

                                    select new PaymentsStsModel()
                                    {
                                        packageUserId = PU.packageUserId,
                                        packageId = PU.packageId,
                                        packageNumber = PU.packageNumber, //book number
                                        bookDate = PU.bookDate,//book date
                                        createDatePo = PA.createDate,//upgrade date
                                        packageName = S.packageName,

                                        agentId = PA.agentId,
                                        agentName = AG.name,
                                        agentAccountName = AG.AccountName,
                                        agentLastName = AG.lastName,
                                        agentCompany = AG.company,
                                        agentType = AG.type,

                                        agentCountryId = AG.countryId,
                                        agentCountry = AC.name,

                                        customerCountryId = C.countryId,
                                        customerCountry = CC.name,

                                        customerId = PA.customerId,
                                        customerName = C.custname,
                                        customerLastName = C.lastName,
                                        customerCompany = C.company,
                                        Price = PA.Price,
                                        currency = N.currency,

                                        notes = PU.notes,

                                        isActive = PU.isActive,


                                        programName = G.name,
                                        programId = G.programId,
                                        verName = V.name,
                                        verId = V.verId,
                                        branchCount = S.branchCount,


                                        userId = PU.userId,

                                        packageSaleCode = PU.packageSaleCode,


                                        customerServerCode = PU.customerServerCode,
                                        isBooked = PU.isBooked,

                                        createDate = PU.createDate,
                                        //updateDate = PU.updateDate,
                                        //createUserId = PU.createUserId,
                                        //updateUserId = PU.updateUserId,


                                        expireDate = PA.expireDate,
                                        isOnlineServer = PU.isOnlineServer,
                                        countryPackageId = PU.countryPackageId,
                                        canRenew = PU.canRenew,
                                        typePu = PU.type,

                                        monthCount = D.monthCount,
                                        islimitDate = D.islimitDate,
                                        //
                                        isServerActivated = PU.isServerActivated,
                                        activatedate = PU.activatedate,

                                        CusrName = UPUsr.name,
                                        CusrAccountName = UPUsr.AccountName,
                                        CusrLastName = UPUsr.lastName,
                                        CusrCompany = UPUsr.company,
                                        CusrType = UPUsr.type,
                                        countryName = N.name,
                                        countryId = D.countryId,
                                        payOpId = PA.payOpId,

                                        //  Price=PA.Price,
                                        codePo = PA.code,
                                        typePo = PA.type,

                                        //discountValue=PA.discountValue
                                        agentIdPo = PA.agentId,
                                        customerIdPo = PA.customerId,
                                        countryPackageIdPo = PA.countryPackageId,
                                        discountValue=PA.discountValue,
                                        totalnet=PA.totalnet,
                                        // totalnet = PA.totalnet,

                                        // packageIdPo = PA.packageId,
                                        createUserIdPo = PA.createUserId,
                                        updateUserIdPo = PA.updateUserId,

                                        updateDatePo = PA.updateDate,


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

    }
}