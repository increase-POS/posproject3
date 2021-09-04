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
    public class Versions
    {

        public int verId { get; set; }
        public string name { get; set; }
        public string details { get; set; }
        public int isActive { get; set; }
        public string versionscode { get; set; }
        public Nullable<System.DateTime> createDate { get; set; }
        public Nullable<System.DateTime> updateDate { get; set; }
        public Nullable<int> createUserId { get; set; }
        public Nullable<int> updateUserId { get; set; }
        public bool canDelete { get; set; }

        private string urimainpath = "versions/";
        /// <summary>
        /// ///////////////////////////////////////
        /// </summary>
        /// <returns></returns>
        /// 

        public async Task<List<Versions>> GetAll()
        {
            List<Versions> memberships = null;

            HttpResponseMessage response = new HttpResponseMessage();
            using (var client = new HttpClient())
            {
                Uri uri = new Uri(Global.APIUri + urimainpath + "GetAll");
                response = await ApiConnect.ApiGetConnect(uri);

                response = await ApiConnect.ApiGetConnect(uri);
                if (response.IsSuccessStatusCode)
                {
                    var jsonString = await response.Content.ReadAsStringAsync();

                    memberships = JsonConvert.DeserializeObject<List<Versions>>(jsonString);

                    return memberships;
                }
                else //web api sent error response 
                {
                    memberships = new List<Versions>();
                }
                return memberships;
            }

        }

        public async Task<string> Save(Versions obj)
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

        public async Task<Versions> GetByID(int verId)
        {
            Versions obj = new Versions();
          
            HttpResponseMessage response = new HttpResponseMessage();
            using (var client = new HttpClient())
            {

                Uri uri = new Uri(Global.APIUri + urimainpath + "GetByID?verId=" + verId);

                response = await ApiConnect.ApiGetConnect(uri);
                if (response.IsSuccessStatusCode)
                {
                   var jsonString = await response.Content.ReadAsStringAsync();
                    obj = JsonConvert.DeserializeObject<Versions>(jsonString);
                    return obj;
                }

                return obj;
            }
        }

        public async Task<string> Delete(int verId, int userId, bool final)
        {
            HttpResponseMessage response = new HttpResponseMessage();
            using (var client = new HttpClient())
            {
                Uri uri = new Uri(Global.APIUri + urimainpath + "Delete?verId=" + verId + "&userId=" + userId + "&final=" + final);
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
