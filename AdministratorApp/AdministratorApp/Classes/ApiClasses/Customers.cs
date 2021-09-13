﻿using AdministratorApp.Classes;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
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

        public async Task<string> generateCodeNumber(string type)
        {
            int sequence = await GetLastNumOfCode(type);
            sequence++;
            string strSeq = sequence.ToString();
            if (sequence <= 999999)
                strSeq = sequence.ToString().PadLeft(6, '0');
            string transNum = type.ToUpper() + "-" + strSeq;
            return transNum;
        }


        public async Task<int> GetLastNumOfCode(string type)
        {

            HttpResponseMessage response = new HttpResponseMessage();
            using (var client = new HttpClient())
            {

                Uri uri = new Uri(Global.APIUri + urimainpath + "GetLastNumOfCode?type=" + type);

                response = await ApiConnect.ApiGetConnect(uri);
                if (response.IsSuccessStatusCode)
                {
                    string message = await response.Content.ReadAsStringAsync();
                    message = JsonConvert.DeserializeObject<string>(message);
                    return int.Parse(message);
                }
                return 0;
            }
        }


        public async Task<string> uploadImage(string imagePath, string imageName, int customerId)
        {
            if (imagePath != "")
            {
                //string imageName = customerId.ToString();
                MultipartFormDataContent form = new MultipartFormDataContent();
                // get file extension
                var ext = imagePath.Substring(imagePath.LastIndexOf('.'));
                var extension = ext.ToLower();
                try
                {
                    // configure trmporery path
                    string dir = Directory.GetParent(Directory.GetCurrentDirectory()).Parent.FullName;
                    string tmpPath = Path.Combine(dir, Global.TMPFolder);
                    tmpPath = Path.Combine(tmpPath, imageName + extension);
                    if (System.IO.File.Exists(tmpPath))
                    {
                        System.IO.File.Delete(tmpPath);
                    }
                    // resize image
                    ImageProcess imageP = new ImageProcess(150, imagePath);
                    imageP.ScaleImage(tmpPath);

                    // read image file
                    var stream = new FileStream(tmpPath, FileMode.Open, FileAccess.Read);

                    // create http client request
                    using (var client = new HttpClient())
                    {
                        client.BaseAddress = new Uri(Global.APIUri);
                        client.Timeout = System.TimeSpan.FromSeconds(3600);
                        string boundary = string.Format("----WebKitFormBoundary{0}", DateTime.Now.Ticks.ToString("x"));
                        HttpContent content = new StreamContent(stream);
                        content.Headers.ContentType = MediaTypeHeaderValue.Parse("multipart/form-data");
                        content.Headers.Add("client", "true");

                        string fileName = imageName + extension;
                        content.Headers.ContentDisposition = new ContentDispositionHeaderValue("form-data")
                        {
                            Name = imageName,
                            FileName = fileName
                        };
                        form.Add(content, "fileToUpload");

                        var response = await client.PostAsync(@"customers/PostCustomerImage", form);
                        if (response.IsSuccessStatusCode)
                        {
                            // save image name in DB
                            Customers customer = new Customers();
                            customer.custId = customerId;
                            customer.image = fileName;
                            await updateImage(customer);
                            return fileName;
                        }
                    }
                    stream.Dispose();
                    //delete tmp image
                    if (System.IO.File.Exists(tmpPath))
                    {
                        System.IO.File.Delete(tmpPath);
                    }
                }
                catch
                { return ""; }
            }
            return "";
        }
        public async Task<string> updateImage(Customers customer)
        {
            string message = "";

            // ... Use HttpClient.
            ServicePointManager.ServerCertificateValidationCallback += (sender, cert, chain, sslPolicyErrors) => true;

            string myContent = JsonConvert.SerializeObject(customer);

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

                request.RequestUri = new Uri(Global.APIUri + "customers/UpdateImage?customerObject=" + myContent);
                request.Headers.Add("APIKey", Global.APIKey);
                request.Method = HttpMethod.Post;
                //set content type
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                var response = await client.SendAsync(request);

                if (response.IsSuccessStatusCode)
                {
                    message = await response.Content.ReadAsStringAsync();
                    message = JsonConvert.DeserializeObject<string>(message);
                }
                return message;
            }
        }
        public async Task<byte[]> downloadImage(string imageName)

        {
            Stream jsonString = null;
            byte[] byteImg = null;
            Image img = null;
            // ... Use HttpClient.
            ServicePointManager.ServerCertificateValidationCallback += (sender, cert, chain, sslPolicyErrors) => true;
            using (var client = new HttpClient())
            {
                ServicePointManager.SecurityProtocol |= SecurityProtocolType.Tls11 | SecurityProtocolType.Tls12;
                client.BaseAddress = new Uri(Global.APIUri);
                client.DefaultRequestHeaders.Clear();
                client.DefaultRequestHeaders.Add("Connection", "Keep-Alive");
                client.DefaultRequestHeaders.Add("Keep-Alive", "3600");
                HttpRequestMessage request = new HttpRequestMessage();
                request.RequestUri = new Uri(Global.APIUri + "customers/GetImage?imageName=" + imageName);
                request.Headers.Add("APIKey", Global.APIKey);
                request.Method = HttpMethod.Get;
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                HttpResponseMessage response = await client.SendAsync(request);

                if (response.IsSuccessStatusCode)
                {
                    jsonString = await response.Content.ReadAsStreamAsync();
                    img = Bitmap.FromStream(jsonString);
                    byteImg = await response.Content.ReadAsByteArrayAsync();

                    // configure trmporery path
                    string dir = Directory.GetParent(Directory.GetCurrentDirectory()).Parent.FullName;
                    string tmpPath = Path.Combine(dir, Global.TMPCustomersFolder);
                    if (!Directory.Exists(tmpPath))
                        Directory.CreateDirectory(tmpPath);
                    tmpPath = Path.Combine(tmpPath, imageName);
                    if (System.IO.File.Exists(tmpPath))
                    {
                        System.IO.File.Delete(tmpPath);
                    }
                    using (FileStream fs = new FileStream(tmpPath, FileMode.Create, FileAccess.ReadWrite))
                    {
                        fs.Write(byteImg, 0, byteImg.Length);
                    }
                }
                return byteImg;
            }
        }
    }
}
