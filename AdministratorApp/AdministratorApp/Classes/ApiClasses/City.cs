using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using AdministratorApp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using AdministratorApp.Classes;

namespace AdministratorApp.ApiClasses
{
    public class City
    {
        public int cityId { get; set; }
        public string cityCode { get; set; }
        public Nullable<int> countryId { get; set; }

        private string urimainpath = "city/";

      
        public async Task<List<City>> Get()
        {
            List<City> memberships = null;

            HttpResponseMessage response = new HttpResponseMessage();
            using (var client = new HttpClient())
            {
                Uri uri = new Uri(Global.APIUri + urimainpath + "Get");
                response = await ApiConnect.ApiGetConnect(uri);

                response = await ApiConnect.ApiGetConnect(uri);
                if (response.IsSuccessStatusCode)
                {
                    var jsonString = await response.Content.ReadAsStringAsync();

                    memberships = JsonConvert.DeserializeObject<List<City>>(jsonString);

                    return memberships;
                }
                else //web api sent error response 
                {
                    memberships = new List<City>();
                }
                return memberships;
            }

        }






    }
}

