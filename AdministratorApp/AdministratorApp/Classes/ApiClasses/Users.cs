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
    public class Users
    {

        public int userId { get; set; }
        public string code { get; set; }
        public string name { get; set; }
        public string lastName { get; set; }
        public string accountName { get; set; }
        public string password { get; set; }
        public string email { get; set; }
        public string phone { get; set; }
        public string mobile { get; set; }
        public string fax { get; set; }
        public string company { get; set; }
        public string agentLevel { get; set; }
        public Nullable<System.DateTime> createDate { get; set; }
        public Nullable<System.DateTime> updateDate { get; set; }
        public string type { get; set; }
        public string image { get; set; }
        public string address { get; set; }
        public string notes { get; set; }
        public decimal balance { get; set; }
        public Nullable<int> createUserId { get; set; }
        public Nullable<int> updateUserId { get; set; }
        public Nullable<int> isActive { get; set; }
        public bool canDelete { get; set; }

        private string urimainpath = "users/";
        /// <summary>
        /// ///////////////////////////////////////
        /// </summary>
        /// <returns></returns>
        /// 

        public async Task<List<Users>> GetAll()
        {
            List<Users> memberships = null;

            HttpResponseMessage response = new HttpResponseMessage();
            using (var client = new HttpClient())
            {
                Uri uri = new Uri(Global.APIUri + urimainpath + "GetAll");
                response = await ApiConnect.ApiGetConnect(uri);

                response = await ApiConnect.ApiGetConnect(uri);
                if (response.IsSuccessStatusCode)
                {
                    var jsonString = await response.Content.ReadAsStringAsync();

                    memberships = JsonConvert.DeserializeObject<List<Users>>(jsonString);

                    return memberships;
                }
                else //web api sent error response 
                {
                    memberships = new List<Users>();
                }
                return memberships;
            }

        }

        public async Task<string> Save(Users obj)
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

        public async Task<Users> GetByID(int userId)
        {
            Users obj = new Users();
          
            HttpResponseMessage response = new HttpResponseMessage();
            using (var client = new HttpClient())
            {

                Uri uri = new Uri(Global.APIUri + urimainpath + "GetByID?userId=" + userId);

                response = await ApiConnect.ApiGetConnect(uri);
                if (response.IsSuccessStatusCode)
                {
                   var jsonString = await response.Content.ReadAsStringAsync();
                    obj = JsonConvert.DeserializeObject<Users>(jsonString);
                    return obj;
                }

                return obj;
            }
        }

        public async Task<string> Delete(int userId, int signuserId, bool final)
        {
            HttpResponseMessage response = new HttpResponseMessage();
            using (var client = new HttpClient())
            {
                Uri uri = new Uri(Global.APIUri + urimainpath + "Delete?userId=" + userId + "&signuserId=" + signuserId + "&final=" + final);
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
