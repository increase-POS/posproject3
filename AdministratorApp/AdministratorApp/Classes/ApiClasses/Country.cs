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
    public class Country
    {

        public int countryId { get; set; }
        public string code { get; set; }
        public string currency { get; set; }
        public string name { get; set; }
        public byte isDefault { get; set; }

        private string urimainpath = "Country/";
        /// <summary>
        /// ///////////////////////////////////////
        /// </summary>
        /// <returns></returns>
        /// 
        public async Task<List<Country>> GetAll()
        {
            List<Country> memberships = null;

            HttpResponseMessage response = new HttpResponseMessage();
            using (var client = new HttpClient())
            {
                Uri uri = new Uri(Global.APIUri + urimainpath + "GetAll");
                response = await ApiConnect.ApiGetConnect(uri);

                response = await ApiConnect.ApiGetConnect(uri);
                if (response.IsSuccessStatusCode)
                {
                    var jsonString = await response.Content.ReadAsStringAsync();

                    memberships = JsonConvert.DeserializeObject<List<Country>>(jsonString);

                    return memberships;
                }
                else //web api sent error response 
                {
                    memberships = new List<Country>();
                }
                return memberships;
            }

        }

        public async Task<List<Country>> GetAllRegion()
        {
            List<Country> memberships = null;

            HttpResponseMessage response = new HttpResponseMessage();
            using (var client = new HttpClient())
            {
                Uri uri = new Uri(Global.APIUri + urimainpath + "GetAllRegion");
                response = await ApiConnect.ApiGetConnect(uri);

                response = await ApiConnect.ApiGetConnect(uri);
                if (response.IsSuccessStatusCode)
                {
                    var jsonString = await response.Content.ReadAsStringAsync();

                    memberships = JsonConvert.DeserializeObject<List<Country>>(jsonString);

                    return memberships;
                }
                else //web api sent error response 
                {
                    memberships = new List<Country>();
                }
                return memberships;
            }

        }

        public async Task<Country> GetByID(int countryId)
        {
            Country obj = new Country();
          
            HttpResponseMessage response = new HttpResponseMessage();
            using (var client = new HttpClient())
            {

                Uri uri = new Uri(Global.APIUri + urimainpath + "GetByID?countryId=" + countryId);

                response = await ApiConnect.ApiGetConnect(uri);
                if (response.IsSuccessStatusCode)
                {
                   var jsonString = await response.Content.ReadAsStringAsync();
                    obj = JsonConvert.DeserializeObject<Country>(jsonString);
                    return obj;
                }

                return obj;
            }
        }

        public async Task<string> UpdateIsdefault(int countryId)
        {
            HttpResponseMessage response = new HttpResponseMessage();
            using (var client = new HttpClient())
            {
                Uri uri = new Uri(Global.APIUri + urimainpath + "UpdateIsdefault?countryId=" + countryId);
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
