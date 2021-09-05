using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;

namespace AdministratorApp.ApiClasses
{
    public class Customers
    {

        public int custId { get; set; }
        public string custCode { get; set; }
        public string custname { get; set; }
        public string lastName { get; set; }
        public string custAccountName { get; set; }
        public string password { get; set; }
        public string email { get; set; }
        public string phone { get; set; }
        public string mobile { get; set; }
        public string fax { get; set; }
        public string address { get; set; }
        public string custlevel { get; set; }
        public string company { get; set; }
        public Nullable<System.DateTime> createDate { get; set; }
        public Nullable<System.DateTime> updateDate { get; set; }
        public string image { get; set; }
        public string notes { get; set; }
        public Nullable<decimal> balance { get; set; }
        public Nullable<int> createUserId { get; set; }
        public Nullable<int> updateUserId { get; set; }
        public bool canDelete { get; set; }
        public Nullable<int> isActive { get; set; }

        private string urimainpath = "customers/";
        /// <summary>
        /// ///////////////////////////////////////
        /// </summary>
        /// <returns></returns>
        /// 

        public async Task<List<Customers>> GetAll()
        {
            List<Customers> memberships = null;
      
            HttpResponseMessage response = new HttpResponseMessage();
            using (var client = new HttpClient())
            {
               Uri uri = new Uri(Global.APIUri + urimainpath + "GetAll");
                response = await ApiConnect.ApiGetConnect(uri);

                response = await ApiConnect.ApiGetConnect(uri);
                if (response.IsSuccessStatusCode)
                {
                    var jsonString = await response.Content.ReadAsStringAsync();

                    memberships = JsonConvert.DeserializeObject<List<Customers>>(jsonString);

                    return memberships;
                }
                else //web api sent error response 
                {
                    memberships = new List<Customers>();
                }
                return memberships;
            }

        }
        public async Task<string> Save(Customers obj)
        {

         //   string urimainpath = "Customers/";
           
            // ... Use HttpClient.
            // ServicePointManager.ServerCertificateValidationCallback += (sender, cert, chain, sslPolicyErrors) => true;
            // 
            var myContent = JsonConvert.SerializeObject(obj);
            myContent = System.Web.HttpUtility.UrlEncode(myContent);


            /*
        using (var client = new HttpClient())
        {
            ServicePointManager.SecurityProtocol |= SecurityProtocolType.Tls11 | SecurityProtocolType.Tls12;
            client.BaseAddress = new Uri(Global.APIUri);
            client.DefaultRequestHeaders.Clear();
            client.DefaultRequestHeaders.Add("Connection", "Keep-Alive");
            client.DefaultRequestHeaders.Add("Keep-Alive", "3600");
            HttpRequestMessage request = new HttpRequestMessage();
            // encoding parameter to get special characters
            myContent = HttpUtility.UrlEncode(myContent);
            request.RequestUri = new Uri(Global.APIUri + "Customers/Save?Object=" + myContent);
            request.Headers.Add("APIKey", Global.APIKey);
            request.Method = HttpMethod.Post;
            //set content type
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            var response = await client.SendAsync(request);
            */
            Uri uri = new Uri(Global.APIUri +urimainpath+ "Save?Object=" + myContent);
         
            HttpResponseMessage response = new HttpResponseMessage();
            response= await ApiConnect.ApiPostConnect(uri);
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
        public async Task<Customers> GetByID(int custId)
        {
            Customers obj = new Customers();
            // new Uri(Global.APIUri + "Customers/GetByID?custId=" + custId);

     
            HttpResponseMessage response = new HttpResponseMessage();
            using (var client = new HttpClient())
            {

              
                Uri uri = new Uri(Global.APIUri + urimainpath+"GetByID?custId=" + custId);

                response = await ApiConnect.ApiGetConnect(uri);


                if (response.IsSuccessStatusCode)
                {
                   

                    var jsonString = await response.Content.ReadAsStringAsync();

                    obj = JsonConvert.DeserializeObject<Customers>(jsonString);

                    return obj;
                }

                return obj;
            }
        }
        public async Task<string> Delete(int custId, int userId, bool final)
        {
            // request.RequestUri = new Uri(Global.APIUri + "Customers/Delete?custId=" + custId + "&userId=" + userId + "&final=" + final);

            // ... Use HttpClient.
            HttpResponseMessage response = new HttpResponseMessage();
            using (var client = new HttpClient())
            {

              
                Uri uri = new Uri(Global.APIUri + urimainpath+ "Delete?custId=" + custId + "&userId=" + userId + "&final=" + final);

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
