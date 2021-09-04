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

namespace POS.Classes
{
    public class PosSerials
    {

        public int serialId { get; set; }
        public string serial { get; set; }
        public string posDeviceCode { get; set; }
        public Nullable<int> packageUserId { get; set; }
        public int isBooked { get; set; }
        public int isActive { get; set; }
        public Nullable<System.DateTime> createDate { get; set; }
        public Nullable<System.DateTime> updateDate { get; set; }
        public string apikey { get; set; }
        public Nullable<int> createUserId { get; set; }
        public Nullable<int> updateUserId { get; set; }
        public bool canDelete { get; set; }

        private string urimainpath = "posSerials/";
        /// <summary>
        /// ///////////////////////////////////////
        /// </summary>
        /// <returns></returns>
        /// 

        public async Task<List<PosSerials>> GetAll()
        {
            List<PosSerials> memberships = null;

            HttpResponseMessage response = new HttpResponseMessage();
            using (var client = new HttpClient())
            {
                Uri uri = new Uri(Global.APIUri + urimainpath + "GetAll");
                response = await ApiConnect.ApiGetConnect(uri);

                response = await ApiConnect.ApiGetConnect(uri);
                if (response.IsSuccessStatusCode)
                {
                    var jsonString = await response.Content.ReadAsStringAsync();

                    memberships = JsonConvert.DeserializeObject<List<PosSerials>>(jsonString);

                    return memberships;
                }
                else //web api sent error response 
                {
                    memberships = new List<PosSerials>();
                }
                return memberships;
            }

        }

        public async Task<string> Save(PosSerials obj)
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

        public async Task<PosSerials> GetByID(int serialId)
        {
            PosSerials obj = new PosSerials();
          
            HttpResponseMessage response = new HttpResponseMessage();
            using (var client = new HttpClient())
            {

                Uri uri = new Uri(Global.APIUri + urimainpath + "GetByID?serialId=" + serialId);

                response = await ApiConnect.ApiGetConnect(uri);
                if (response.IsSuccessStatusCode)
                {
                   var jsonString = await response.Content.ReadAsStringAsync();
                    obj = JsonConvert.DeserializeObject<PosSerials>(jsonString);
                    return obj;
                }

                return obj;
            }
        }

        public async Task<string> Delete(int serialId, int userId, bool final)
        {
            HttpResponseMessage response = new HttpResponseMessage();
            using (var client = new HttpClient())
            {
                Uri uri = new Uri(Global.APIUri + urimainpath + "Delete?serialId=" + serialId + "&userId=" + userId + "&final=" + final);
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
