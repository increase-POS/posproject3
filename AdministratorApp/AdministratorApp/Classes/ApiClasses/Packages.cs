using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace AdministratorApp.ApiClasses
{
    public class Packages
    {

        public int packageId { get; set; }
        public string packageName { get; set; }
        public string details { get; set; }
        public int branchCount { get; set; }
        public int posCount { get; set; }
        public int userCount { get; set; }
        public int vendorCount { get; set; }
        public int customerCount { get; set; }
        public int itemCount { get; set; }
        public int salesInvCount { get; set; }
        public Nullable<int> programId { get; set; }
        public Nullable<int> verId { get; set; }
        public Nullable<decimal> price { get; set; }
        public int isActive { get; set; }
        public Nullable<System.DateTime> createDate { get; set; }
        public Nullable<System.DateTime> updateDate { get; set; }
        public string packageCode { get; set; }
        public Nullable<int> storeCount { get; set; }
        public Nullable<System.DateTime> endDate { get; set; }
        public int islimitDate { get; set; }
        public Nullable<int> createUserId { get; set; }
        public Nullable<int> updateUserId { get; set; }
        public bool canDelete { get; set; }

        private string urimainpath = "packages/";
        /// <summary>
        /// ///////////////////////////////////////
        /// </summary>
        /// <returns></returns>
        /// 

        public async Task<List<Packages>> GetAll()
        {
            List<Packages> memberships = null;

            HttpResponseMessage response = new HttpResponseMessage();
            using (var client = new HttpClient())
            {
                Uri uri = new Uri(Global.APIUri + urimainpath + "GetAll");
                response = await ApiConnect.ApiGetConnect(uri);

                response = await ApiConnect.ApiGetConnect(uri);
                if (response.IsSuccessStatusCode)
                {
                    var jsonString = await response.Content.ReadAsStringAsync();

                    memberships = JsonConvert.DeserializeObject<List<Packages>>(jsonString);

                    return memberships;
                }
                else //web api sent error response 
                {
                    memberships = new List<Packages>();
                }
                return memberships;
            }

        }

        public async Task<string> Save(Packages obj)
        {
            var myContent = JsonConvert.SerializeObject(obj);
            myContent = HttpUtility.UrlEncode(myContent);
            Uri uri = new Uri(Global.APIUri + urimainpath + "Save?Object=" + myContent);

            HttpResponseMessage response = new HttpResponseMessage();
            response = await ApiConnect.ApiPostConnect(uri);
            using (var client = new HttpClient())
            {
                if (response.IsSuccessStatusCode)
                {
                    var message = await response.Content.ReadAsStringAsync();
                    message = JsonConvert.DeserializeObject<string>(message);
                    return message;
                }
                return "";
            }
        }

        public async Task<Packages> GetByID(int packageId)
        {
            Packages obj = new Packages();
          
            HttpResponseMessage response = new HttpResponseMessage();
            using (var client = new HttpClient())
            {

                Uri uri = new Uri(Global.APIUri + urimainpath + "GetByID?packageId=" + packageId);

                response = await ApiConnect.ApiGetConnect(uri);
                if (response.IsSuccessStatusCode)
                {
                   var jsonString = await response.Content.ReadAsStringAsync();
                    obj = JsonConvert.DeserializeObject<Packages>(jsonString);
                    return obj;
                }

                return obj;
            }
        }

        public async Task<string> Delete(int packageId, int userId, bool final)
        {
            HttpResponseMessage response = new HttpResponseMessage();
            using (var client = new HttpClient())
            {
                Uri uri = new Uri(Global.APIUri + urimainpath + "Delete?packageId=" + packageId + "&userId=" + userId + "&final=" + final);
                response = await ApiConnect.ApiPostConnect(uri);
                if (response.IsSuccessStatusCode)
                {
                    var message = await response.Content.ReadAsStringAsync();
                    message = JsonConvert.DeserializeObject<string>(message);
                    return message;
                }
                return "";
            }
        }





    }
}
