using AdministratorApp.Classes;
using AdministratorApp.View.applications;
using POS.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Resources;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using WPFTabTip;
using AdministratorApp.ApiClasses;
using System.Threading;
using AdministratorApp.View.sectionData;
using AdministratorApp.View.sales;
using AdministratorApp.View.settings;
using System.Windows.Resources;
using AdministratorApp.View.windows;

namespace AdministratorApp
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public static ResourceManager resourcemanager;
        public static ResourceManager resourcemanagerreport;
        static public MainWindow mainWindow;
        public static string lang = "ar";
        internal static Users userLogin = new Users();
        public static int userID=1;
        //public static CountryCode Region;
        internal static int? userLogInID;
        public static Boolean go_out = false;

        internal static string dateFormat;
        internal static string accuracy;
        static public GroupObject groupObject = new GroupObject();
        static public List<GroupObject> groupObjects = new List<GroupObject>();
        Users userModel = new Users();
        ImageBrush myBrush = new ImageBrush();

        public MainWindow()
        {
            try
            {
                InitializeComponent();
                mainWindow = this;
                windowFlowDirection();
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        void windowFlowDirection()
        {
            #region
            if (lang.Equals("en"))
            {
                resourcemanager = new ResourceManager("AdministratorApp.en_file", Assembly.GetExecutingAssembly());
                grid_mainGrid.FlowDirection = FlowDirection.LeftToRight;
            }
            else
            {
                resourcemanager = new ResourceManager("AdministratorApp.ar_file", Assembly.GetExecutingAssembly());
                grid_mainGrid.FlowDirection = FlowDirection.RightToLeft;
            }
            #endregion
        }

        private void translate()
        {
            txt_applications.Text = resourcemanager.GetString("trApplications");
            txt_sales.Text = resourcemanager.GetString("trSales");
            txt_reports.Text = resourcemanager.GetString("trReports");
            txt_sectionData.Text = resourcemanager.GetString("trSectionData");
            txt_settings.Text = resourcemanager.GetString("trSettings");

            mi_changePassword.Header = resourcemanager.GetString("trChangePassword");
            BTN_logOut.Header = resourcemanager.GetString("trLogOut");

            //txt_notifications.Text = resourcemanager.GetString("trNotifications");
            //txt_noNoti.Text = resourcemanager.GetString("trNoNotifications");
            //btn_showAll.Content = resourcemanager.GetString("trShowAll");
        }

        public static List<string> menuList;

        #region loading
        List<keyValueBool> loadingList;
        //loadingThread[] loadingList = new loadingThread[25];
        /*
        async void loading_getUserPath()
        {
            #region get user path
            try
            {
                UserSetValues uSetValueModel = new UserSetValues();
                List<UserSetValues> lst = await uSetValueModel.GetAll();

                SetValues setValueModel = new SetValues();

                List<SetValues> setVLst = await setValueModel.GetBySetName("user_path");
                if (setVLst.Count > 0)
                {
                    int firstId = setVLst[0].valId;
                    int secondId = setVLst[1].valId;
                    firstPath = lst.Where(u => u.valId == firstId && u.userId == userID).FirstOrDefault().note;
                    secondPath = lst.Where(u => u.valId == secondId && u.userId == userID).FirstOrDefault().note;
                }
                else
                {
                    firstPath = "";
                    secondPath = "";
                }
            }
            catch
            {
                firstPath = "";
                secondPath = "";
            }
            #endregion
            foreach (var item in loadingList)
            {
                if (item.key.Equals("loading_getUserPath"))
                {
                    item.value = true;
                    break;
                }
            }
        }
        async void loading_getDateForm()
        {
            //get dateform
            try
            {
                dateFormat = await getDefaultDateForm();
            }
            catch
            {
                dateFormat = "ShortDatePattern";
            }
            foreach (var item in loadingList)
            {
                if (item.key.Equals("loading_getDateForm"))
                {
                    item.value = true;
                    break;
                }
            }
        }
        async void loading_getRegionAndCurrency()
        {
            //get region and currency
            try
            {
                CountryCode c = await getDefaultRegion();
                Region = c;
                Currency = c.currency;
                CurrencyId = c.currencyId;
                txt_cashSympol.Text = MainWindow.Currency;

            }
            catch
            {

            }
            foreach (var item in loadingList)
            {
                if (item.key.Equals("loading_getRegionAndCurrency"))
                {
                    item.value = true;
                    break;
                }
            }
        }
        async void loading_getAccurac()
        {
            //get accuracy
            try
            {
                accuracy = await getDefaultAccuracy();
            }
            catch
            {
                accuracy = "1";
            }
            foreach (var item in loadingList)
            {
                if (item.key.Equals("loading_getAccurac"))
                {
                    item.value = true;
                    break;
                }
            }
        }
        */
        async void loading_getUserPersonalInfo()
        {
            #region user personal info
            txt_userName.Text = userLogin.name;
            string job = "";
            switch(userLogin.type)
            {
                case "us":    job = "Employee"; break;
                case "ad":    job = "Admin";    break;
                case "ag":    job = "Agent";    break;
            }
            txt_userJob.Text = job;
            try
            {
                if (!string.IsNullOrEmpty(userLogin.image))
                {
                    byte[] imageBuffer = await userModel.downloadImage(userLogin.image); // read this as BLOB from your DB

                    var bitmapImage = new BitmapImage();

                    using (var memoryStream = new System.IO.MemoryStream(imageBuffer))
                    {
                        bitmapImage.BeginInit();
                        bitmapImage.CacheOption = BitmapCacheOption.OnLoad;
                        bitmapImage.StreamSource = memoryStream;
                        bitmapImage.EndInit();
                    }

                    img_userLogin.Fill = new ImageBrush(bitmapImage);
                }
                else
                {
                    clearImg();
                }
            }
            catch
            {
                clearImg();
            }
            foreach (var item in loadingList)
            {
                if (item.key.Equals("loading_getUserPersonalInfo"))
                {
                    item.value = true;
                    break;
                }
            }
            #endregion
        }
        /*
        async void loading_getDefaultSystemInfo()
        {
            try
            {
                List<SettingCls> settingsCls = await setModel.GetAll();
                List<SetValues> settingsValues = await valueModel.GetAll();
                SettingCls set = new SettingCls();
                SetValues setV = new SetValues();
                List<char> charsToRemove = new List<char>() { '@', '_', ',', '.', '-' };
                #region get company name
                Thread t1 = new Thread(() =>
                {
                    this.Dispatcher.Invoke(() =>
                    {
                        //get company name
                        set = settingsCls.Where(s => s.name == "com_name").FirstOrDefault<SettingCls>();
                        nameId = set.settingId;
                        setV = settingsValues.Where(i => i.settingId == nameId).FirstOrDefault();
                        if (setV != null)
                            companyName = setV.value;

                    });
                });
                t1.Start();
                #endregion

                #region  get company address
                Thread t2 = new Thread(() =>
                {
                    this.Dispatcher.Invoke(() =>
                    {
                        //get company address
                        set = settingsCls.Where(s => s.name == "com_address").FirstOrDefault<SettingCls>();
                        addressId = set.settingId;
                        setV = settingsValues.Where(i => i.settingId == addressId).FirstOrDefault();
                        if (setV != null)
                            Address = setV.value;
                    });
                });
                t2.Start();
                #endregion

                #region  get company email
                Thread t3 = new Thread(() =>
                {
                    this.Dispatcher.Invoke(() =>
                    {
                        //get company email
                        set = settingsCls.Where(s => s.name == "com_email").FirstOrDefault<SettingCls>();
                        emailId = set.settingId;
                        setV = settingsValues.Where(i => i.settingId == emailId).FirstOrDefault();
                        if (setV != null)
                            Email = setV.value;
                    });
                });
                t3.Start();
                #endregion

                #region  get company mobile
                Thread t4 = new Thread(() =>
                {
                    this.Dispatcher.Invoke(() =>
                    {
                        //get company mobile
                        set = settingsCls.Where(s => s.name == "com_mobile").FirstOrDefault<SettingCls>();
                        mobileId = set.settingId;
                        setV = settingsValues.Where(i => i.settingId == mobileId).FirstOrDefault();
                        if (setV != null)
                        {
                            charsToRemove.ForEach(x => setV.value = setV.value.Replace(x.ToString(), String.Empty));
                            Mobile = setV.value;
                        }
                    });
                });
                t4.Start();
                #endregion

                #region  get company phone
                Thread t5 = new Thread(() =>
                {
                    this.Dispatcher.Invoke(() =>
                    {
                        //get company phone
                        set = settingsCls.Where(s => s.name == "com_phone").FirstOrDefault<SettingCls>();
                        phoneId = set.settingId;
                        setV = settingsValues.Where(i => i.settingId == phoneId).FirstOrDefault();
                        if (setV != null)
                        {
                            charsToRemove.ForEach(x => setV.value = setV.value.Replace(x.ToString(), String.Empty));
                            Phone = setV.value;
                        }
                    });
                });
                t5.Start();
                #endregion

                #region  get company fax
                Thread t6 = new Thread(() =>
                {
                    this.Dispatcher.Invoke(() =>
                    {
                        //get company fax
                        set = settingsCls.Where(s => s.name == "com_fax").FirstOrDefault<SettingCls>();
                        faxId = set.settingId;
                        setV = settingsValues.Where(i => i.settingId == faxId).FirstOrDefault();
                        if (setV != null)
                        {
                            charsToRemove.ForEach(x => setV.value = setV.value.Replace(x.ToString(), String.Empty));
                            Fax = setV.value;
                        }
                    });
                });
                t6.Start();
                #endregion

                #region   get company logo
                //get company logo
                set = settingsCls.Where(s => s.name == "com_logo").FirstOrDefault<SettingCls>();
                logoId = set.settingId;
                setV = settingsValues.Where(i => i.settingId == logoId).FirstOrDefault();
                if (setV != null)
                {
                    logoImage = setV.value;
                    await setV.getImg(logoImage);
                }
                #endregion
            }
            catch (Exception)
            { }
            foreach (var item in loadingList)
            {
                if (item.key.Equals("loading_getDefaultSystemInfo"))
                {
                    item.value = true;
                    break;
                }
            }

        }
        async void loading_getprintSitting()
        {
            try
            {
                await getprintSitting();
            }
            catch (Exception)
            { }
            foreach (var item in loadingList)
            {
                if (item.key.Equals("loading_getprintSitting"))
                {
                    item.value = true;
                    break;
                }
            }
        }
        async void loading_POSList()
        {
            try
            {
                posList = await posLogIn.Get();
            }
            catch (Exception)
            { }
            foreach (var item in loadingList)
            {
                if (item.key.Equals("loading_POSList"))
                {
                    item.value = true;
                    break;
                }
            }
        }
        */
        async void loading_getGroupObjects()
        {
            try
            {
                groupObjects = await groupObject.GetUserpermission(userLogin.userId);
            }
            catch (Exception)
            { }
            foreach (var item in loadingList)
            {
                if (item.key.Equals("loading_getGroupObjects"))
                {
                    item.value = true;
                    break;
                }
            }
        }

        #endregion

        private async void Window_Loaded(object sender, RoutedEventArgs e)
        {//load
            try
            {
                if (sender != null)
                    HelpClass.StartAwait(grid_mainGrid);
                //windowFlowDirection();
                menuList = new List<string> { "applications", "sales", "reports",
                   "sectionData","settings"};

                translate();

                #region loading
                loadingList = new List<keyValueBool>();
                bool isDone = true;
                loadingList.Add(new keyValueBool { key = "loading_getGroupObjects", value = false });
                //loadingList.Add(new keyValueBool { key = "loading_getUserPath", value = false });
                //loadingList.Add(new keyValueBool { key = "loading_getTax", value = false });
                //loadingList.Add(new keyValueBool { key = "loading_getDateForm", value = false });
                //loadingList.Add(new keyValueBool { key = "loading_getRegionAndCurrency", value = false });
                //loadingList.Add(new keyValueBool { key = "loading_getStorageCost", value = false });
                //loadingList.Add(new keyValueBool { key = "loading_getAccurac", value = false });
                loadingList.Add(new keyValueBool { key = "loading_getUserPersonalInfo", value = false });
                //loadingList.Add(new keyValueBool { key = "loading_getDefaultSystemInfo", value = false });
                //loadingList.Add(new keyValueBool { key = "loading_getItemUnitsUsers", value = false });
                //loadingList.Add(new keyValueBool { key = "loading_getprintSitting", value = false });
                //loadingList.Add(new keyValueBool { key = "loading_GlobalItemUnitsList", value = false });
                //loadingList.Add(new keyValueBool { key = "loading_GlobalUnitsList", value = false });
                //loadingList.Add(new keyValueBool { key = "loading_POSList", value = false });


                loading_getGroupObjects();
                //loading_getUserPath();
                //loading_getTax();
                //loading_getDateForm();
                //loading_getRegionAndCurrency();
                //loading_getStorageCost();
                //loading_getAccurac();
                //loading_getItemUnitsUsers();
                loading_getUserPersonalInfo();
                //loading_getDefaultSystemInfo();
                //loading_getprintSitting();
                //loading_GlobalItemUnitsList();
                //loading_GlobalUnitsList();
                //loading_POSList();

                do
                {
                    isDone = true;
                    foreach (var item in loadingList)
                    {
                        if (item.value == false)
                        {
                            isDone = false;
                            break;
                        }
                    }
                    if (!isDone)
                    {
                        //MessageBox.Show("not done");
                        //string s = "";
                        //foreach (var item in loadingList)
                        //{
                        //    s += item.name + " - " + item.value + "\n";
                        //}
                        //MessageBox.Show(s);
                        await Task.Delay(0500);
                        //MessageBox.Show("do");
                    }
                }
                while (!isDone);
                #endregion

                Btn_applications_Click(btn_applications , null);
                if (sender != null)
                    HelpClass.EndAwait(grid_mainGrid);
            }
            catch (Exception ex)
            {
                if (sender != null)
                    HelpClass.EndAwait(grid_mainGrid);
                HelpClass.ExceptionMessage(ex, this);
            }
        }
       

        void colorTextRefreash(string str)
        {
            foreach (TextBlock textBlock in FindControls.FindVisualChildren<TextBlock>(this))
            {
                if (textBlock.Tag != null)
                {
                    foreach (var item in menuList)
                    {
                        if (item == textBlock.Tag.ToString())
                        {
                            if (item == str)
                            textBlock.Foreground = Application.Current.Resources["MainColor"] as SolidColorBrush;
                                else
                            textBlock.Foreground = Application.Current.Resources["LightGrey"] as SolidColorBrush;

                        }
                    }
                }
            }
        }
        void ColorIconRefreash(string str)
        {
            foreach (Path path in FindControls.FindVisualChildren<Path>(this))
            {
                if (path.Tag != null)
                {
                    foreach (var item in menuList)
                    {
                        if (item == path.Tag.ToString())
                        {
                            if (item == str)
                                path.Fill = Application.Current.Resources["MainColor"] as SolidColorBrush;
                            else
                                path.Fill = Application.Current.Resources["LightGrey"] as SolidColorBrush;

                        }
                    }
                }
            }
        }
        void openVisible(string str)
        {
            foreach (Rectangle rectangle in FindControls.FindVisualChildren<Rectangle>(this))
            {
                if (rectangle.Tag != null)
                {
                    foreach (var item in menuList)
                    {
                        if (item == rectangle.Tag.ToString())
                        {
                            if (item == str)
                                rectangle.Visibility = Visibility.Visible;
                            else
                                rectangle.Visibility = Visibility.Collapsed;

                        }
                    }
                }
            }
        }
       
        private void BTN_Close_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (sender != null)
                    HelpClass.StartAwait(grid_mainGrid);
                Application.Current.Shutdown();

                if (sender != null)
                    HelpClass.EndAwait(grid_mainGrid);
            }
            catch (Exception ex)
            {
                if (sender != null)
                    HelpClass.EndAwait(grid_mainGrid);
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        private void BTN_Minimize_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                this.WindowState = System.Windows.WindowState.Minimized;
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        private void Btn_applications_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Button button = sender as Button;
                colorTextRefreash(button.Tag.ToString());
                ColorIconRefreash(button.Tag.ToString());
                openVisible(button.Tag.ToString());
                grid_main.Children.Clear();
                grid_main.Children.Add(uc_applications.Instance);
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }
       
        private  void Btn_sales_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Button button = sender as Button;
                colorTextRefreash(button.Tag.ToString());
                ColorIconRefreash(button.Tag.ToString());
                openVisible(button.Tag.ToString());
                grid_main.Children.Clear();
                grid_main.Children.Add(uc_sales.Instance);
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        private void Btn_sectionData_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Button button = sender as Button;
                colorTextRefreash(button.Tag.ToString());
                ColorIconRefreash(button.Tag.ToString());
                openVisible(button.Tag.ToString());
                grid_main.Children.Clear();
                grid_main.Children.Add(uc_sectionData.Instance);
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        private void Btn_reports_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Button button = sender as Button;
                colorTextRefreash(button.Tag.ToString());
                ColorIconRefreash(button.Tag.ToString());
                openVisible(button.Tag.ToString());
                grid_main.Children.Clear();
                //grid_main.Children.Add(uc_home.Instance);
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        private void Btn_settings_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Button button = sender as Button;
                colorTextRefreash(button.Tag.ToString());
                ColorIconRefreash(button.Tag.ToString());
                openVisible(button.Tag.ToString());
                grid_main.Children.Clear();
                grid_main.Children.Add(uc_settings.Instance);
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        private void clearImg()
        {
            Uri resourceUri = new Uri("pic/no-image-icon-90x90.png", UriKind.Relative);
            StreamResourceInfo streamInfo = Application.GetResourceStream(resourceUri);

            BitmapFrame temp = BitmapFrame.Create(streamInfo.Stream);
            myBrush.ImageSource = temp;
            img_userLogin.Fill = myBrush;

        }

        private async void BTN_logOut_Click(object sender, RoutedEventArgs e)
        {//log out
            try
            {
                await close();

                Application.Current.Shutdown();
                System.Diagnostics.Process.Start(Application.ResourceAssembly.Location);

            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }

        }
        async Task close()
        {
            //log out
            userLogin.isOnline = 0;
            await userModel.Save(userLogin);
            //close
            wd_logIn logIn = new wd_logIn();
            logIn.Show();
            this.Close();

        }

        private async void Mi_changePassword_Click(object sender, RoutedEventArgs e)
        {//change password
            try
            {
                Window.GetWindow(this).Opacity = 0.2;
                wd_changePassword w = new wd_changePassword();
                w.ShowDialog();
                Window.GetWindow(this).Opacity = 1;

                userLogin = await userModel.GetByID(userLogin.userId);

            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }
    }
}
