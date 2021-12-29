using AdministratorApp.ApiClasses;
using AdministratorApp.Classes;
using AdministratorApp.View.windows;
using Microsoft.Reporting.WinForms;
using Microsoft.Win32;
using netoaster;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Resources;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
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

namespace AdministratorApp.View.sales
{
    /// <summary>
    /// Interaction logic for uc_sale.xaml
    /// </summary>
    public partial class uc_sale : UserControl
    {
        public Packages package = new Packages();
        public int oldCustomerId , oldAgentId , oldPackageId , oldCountryPackageId;
       
        public static List<string> requiredControlList;

        public PackageUser packuser = new PackageUser();
        PackageUser packuserModel = new PackageUser();

        public uc_sale()
        {
            try
            {
                InitializeComponent();
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        private static uc_sale _instance;
        public static uc_sale Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new uc_sale();
                return _instance;
            }
        }
     
        public async void UserControl_Loaded(object sender, RoutedEventArgs e)
        {//load
            try
            {
                HelpClass.StartAwait(grid_main);

                package = new Packages();
                //package.isActive = null;
                this.DataContext = package;

                #region translate
                if (MainWindow.lang.Equals("en"))
                {
                    MainWindow.resourcemanager = new ResourceManager("AdministratorApp.en_file", Assembly.GetExecutingAssembly());
                    grid_main.FlowDirection = FlowDirection.LeftToRight;
                }
                else
                {
                    MainWindow.resourcemanager = new ResourceManager("AdministratorApp.ar_file", Assembly.GetExecutingAssembly());
                    grid_main.FlowDirection = FlowDirection.RightToLeft;
                }
                translate();
                #endregion

                await FillCombo.fillAgent(cb_agent);
                requiredControlList = new List<string> { "package", "customer", "period" };

                if (MainWindow.userLogin.type.Equals("ag"))
                {
                    await FillCombo.fillCustomerByAgent(cb_customer, MainWindow.userLogin.userId);
                    cb_agent.SelectedValue = MainWindow.userLogin.userId;
                    await FillCombo.fillAgentPackage(cb_package , MainWindow.userLogin.userId);
                    cb_package.IsEnabled = true;
                }
                else
                {
                    await FillCombo.fillCustomer(cb_customer);
                    cb_agent.SelectedValue = 3;
                }

                if (oldPackageId == 0)
                {
                    Clear();
                    btn_add.Content = MainWindow.resourcemanager.GetString("trBook");
                }
                else
                {
                    btn_add.Content = MainWindow.resourcemanager.GetString("trUpgrade");
                    cb_customer.SelectedValue = oldCustomerId;
                    cb_agent.SelectedValue = oldAgentId;
                    if (MainWindow.userLogin.type.Equals("ag"))
                    {
                        cb_package.SelectedValue = oldPackageId;
                        cb_period.SelectedValue = oldCountryPackageId;
                    }
                }

                HelpClass.EndAwait(grid_main);
            }
            catch (Exception ex)
            {

                HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        private void translate()
        {
            txt_title.Text = MainWindow.resourcemanager.GetString("trSales");
            txt_saleDetails.Text = MainWindow.resourcemanager.GetString("trSaleDetails");
            tt_clear.Content = MainWindow.resourcemanager.GetString("trClear");
            MaterialDesignThemes.Wpf.HintAssist.SetHint(cb_package, MainWindow.resourcemanager.GetString("trPackageHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(cb_agent, MainWindow.resourcemanager.GetString("trAgentHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(cb_customer, MainWindow.resourcemanager.GetString("trCustomerHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(cb_period, MainWindow.resourcemanager.GetString("trPeriod"));

            txt_packageDetails.Text = MainWindow.resourcemanager.GetString("trPackageDetails");
            txt_packageCodeTitle.Text = MainWindow.resourcemanager.GetString("trCode");
            txt_packageNameTitle.Text = MainWindow.resourcemanager.GetString("trName");
            txt_priceTitle.Text = MainWindow.resourcemanager.GetString("trPrice");
            txt_statusTitle.Text = MainWindow.resourcemanager.GetString("trStatus");
            txt_serialsTitle.Text = MainWindow.resourcemanager.GetString("trSerials");

            txt_programDetails.Text = MainWindow.resourcemanager.GetString("trProgramDetails");
            txt_programTitle.Text = MainWindow.resourcemanager.GetString("trProgram");
            txt_versionTitle.Text = MainWindow.resourcemanager.GetString("trVersion");

            txt_packageLimits.Text = MainWindow.resourcemanager.GetString("trPackageLimits");
            txt_branchCountTitle.Text = MainWindow.resourcemanager.GetString("trBranches");
            txt_userCountTitle.Text = MainWindow.resourcemanager.GetString("trUsers");
            txt_customerCountTitle.Text = MainWindow.resourcemanager.GetString("trCustomers");
            txt_salesInvCountTitle.Text = MainWindow.resourcemanager.GetString("trInvoices");
            txt_storeCountNameTitle.Text = MainWindow.resourcemanager.GetString("trStores");
            txt_posCountNameTitle.Text = MainWindow.resourcemanager.GetString("trPOSs");
            txt_vendorCountNameTitle.Text = MainWindow.resourcemanager.GetString("trVendors");
            txt_itemCountNameTitle.Text = MainWindow.resourcemanager.GetString("trItems");
        }

        #region events
        CountryPackageDate cpdModel = new CountryPackageDate();
        IEnumerable<CountryPackageDate> countryPackageDates;

        private async void Cb_package_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {//selection
            try
            {
                if (cb_package.SelectedIndex != -1)
                {
                    package = cb_package.SelectedItem as Packages;

                    this.DataContext = package;
                    if (package != null)
                    {
                        await FillCombo.fillPeriod(cb_period , (int)cb_customer.SelectedValue , (int)cb_package.SelectedValue);
                        #region fill period 

                        if (oldPackageId != 0)
                            cb_period.SelectedValue = oldCountryPackageId;
                       
                        #endregion
                    }

                }

            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        private void Btn_clear_Click(object sender, RoutedEventArgs e)
        {//clear
            try
            {
                HelpClass.StartAwait(grid_main);

                Clear();
                cb_customer.SelectedIndex = -1;
                cb_agent.SelectedIndex = -1;
                cb_package.SelectedIndex = -1;
                cb_period.SelectedIndex = -1;
                cb_package.IsEnabled = false;
                cb_period.IsEnabled = false;
                btn_serials.IsEnabled = false;
                txt_activationCodeTitle.Text = "";

                HelpClass.EndAwait(grid_main);
            }
            catch (Exception ex)
            {
                HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        #endregion

        #region Refresh & Search
        //async Task<IEnumerable<Packages>> RefreshPackagesList()
        //{
        //    packages = await package.GetAll();
        //    return packages;
        //}
        #endregion

        #region validate - clearValidate - textChange - lostFocus - . . . . 
        void Clear()
        {
            try
            {
                this.DataContext = new Packages();
            }
            catch { }
            HelpClass.clearValidate(requiredControlList, this);
            cb_customer.SelectedIndex = -1;
            cb_package.SelectedIndex = -1;
            cb_period.SelectedIndex = -1;
        }

        private void Number_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            try
            {
                //only  digits
                TextBox textBox = sender as TextBox;
                HelpClass.InputJustNumber(ref textBox);
                Regex regex = new Regex("[^0-9]+");
                e.Handled = regex.IsMatch(e.Text);
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }
       
        private void Spaces_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            try
            {
                e.Handled = e.Key == Key.Space;
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        private void ValidateEmpty_TextChange(object sender, TextChangedEventArgs e)
        {
            _validate();
        }
        private void validateEmpty_LostFocus(object sender, RoutedEventArgs e)
        {
            _validate();
        }

        private void _validate()
        {
            try
            {
                HelpClass.validate(requiredControlList, this);
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        #endregion
        private async void Btn_add_Click(object sender, RoutedEventArgs e)
        {//book
            try
            {
                HelpClass.StartAwait(grid_main);

                int msg = 0;

                string pop = "";
               
                if (HelpClass.validate(requiredControlList, this))
                {
                    packuser.packageId = int.Parse(cb_package.SelectedValue.ToString());
                    Users userModel = new Users();
                    Users agent = new Users();
                    packuser.userId = int.Parse(cb_agent.SelectedValue.ToString());
                    agent = await userModel.GetByID((int)cb_agent.SelectedValue);
                    packuser.customerId = int.Parse(cb_customer.SelectedValue.ToString());
                    packuser.createUserId = MainWindow.userID;
                    packuser.packageNumber = await packuserModel.generateNumber("si", agent.code , agent.userId);
                    if(tgl_isActive.IsChecked == true)
                        packuser.isActive = 1;
                    else
                        packuser.isActive = 0;
                    packuser.canRenew = true;
                    packuser.packageSaleCode = packuser.packageSaleCode;
                    packuser.notes = "";
                    packuser.isOnlineServer = null;
                    packuser.countryPackageId = (int)cb_period.SelectedValue;
                    packuser.oldPackageId = oldPackageId;
                    packuser.oldCountryPackageId = oldCountryPackageId;

                if (packuser.packageUserId == 0) pop = "trPopAddBook";
                    else pop = "trPopUpgradeSucceed";

                    msg = await packuserModel.packageBook(packuser);

                    if (msg <= 0)
                        Toaster.ShowWarning(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopError"), animation: ToasterAnimation.FadeIn);
                    else
                    {
                        Toaster.ShowSuccess(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString(pop), animation: ToasterAnimation.FadeIn);
                        if(pop.Equals("trPopAddBook"))
                           Clear();
                    }
                }

                HelpClass.EndAwait(grid_main);
            }
            catch (Exception ex)
            {
                HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        private async void Cb_agent_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {//select agent
            try
            {
                if (cb_agent.SelectedIndex != -1)
                {
                    await FillCombo.fillAgentPackage(cb_package, (int)cb_agent.SelectedValue);
                    //if(customerId != 0) cb_package.SelectedValue = packageId;
                }
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }

        }

        private void Btn_upgrade_Click(object sender, RoutedEventArgs e)
        {//upgrade
            try
            {
                oldPackageId = (int)cb_package.SelectedValue ;
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        private async void Btn_addCustomer_Click(object sender, RoutedEventArgs e)
        {//add customer
            try
            {
                Window.GetWindow(this).Opacity = 0.2;
                wd_newCustomer w = new wd_newCustomer();
                w.customerID = 0;
                w.ShowDialog();
                Window.GetWindow(this).Opacity = 1;

                if (w.isOk)
                {
                    await FillCombo.fillCustomer(cb_customer);
                    cb_customer.SelectedValue = w.customerID;
                }
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        private async void Btn_updateCustomer_Click(object sender, RoutedEventArgs e)
        {//update customer
            try
            {
                Window.GetWindow(this).Opacity = 0.2;
                wd_newCustomer w = new wd_newCustomer();
                if (cb_customer.SelectedItem != null)
                    w.customerID = (int)cb_customer.SelectedValue;
                else
                    w.customerID = 0;
                w.ShowDialog();
                Window.GetWindow(this).Opacity = 1;

                if (w.isOk)
                {
                    await FillCombo.fillCustomer(cb_customer);
                    cb_customer.SelectedValue = w.customerID;
                }

            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        private void Btn_clearCustomer_Click(object sender, RoutedEventArgs e)
        {//clear customer
            try
            {
                cb_customer.SelectedIndex = -1;
                cb_package.IsEnabled = false;
                cb_period.IsEnabled = false;
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        private void Btn_serials_Click(object sender, RoutedEventArgs e)
        {//serials
            try
            {
                Window.GetWindow(this).Opacity = 0.2;
                wd_seialsList w = new wd_seialsList();
                w.packageUserID = packuser.packageUserId;
                w.ShowDialog();
                Window.GetWindow(this).Opacity = 1;

            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        private async void Cb_customer_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {//select customer
            try
            {
                if (cb_customer.SelectedIndex != -1)
                {
                    cb_package.IsEnabled = true;
                    cb_period.IsEnabled = true;

                    if (MainWindow.userLogin.type != "ag")
                    {
                        await FillCombo.fillPackageByCustomer(cb_package, (int)cb_customer.SelectedValue);
                        cb_package.SelectedValue = oldPackageId;
                    }
                }
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        
        private void UserControl_Unloaded(object sender, RoutedEventArgs e)
        {
            GC.Collect();
        }

        private async void Cb_period_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {//select period
            try
            {
                if (cb_period.SelectedIndex != -1)
                {
                    Country cModel = new Country();
                    CountryPackageDate cpd = new CountryPackageDate();
                    Country country = new Country();
                    List<Country> countries = new List<Country>();
                    cpd = await cpdModel.GetByID((int)cb_period.SelectedValue);
                    txt_price.Text = cpd.price.ToString();
                }
                else
                {
                    txt_price.Text = "";
                }
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        public async Task fillInputs(Packages _package , int agentID , int custID)
        {
            try
            {
                package = _package;
                this.DataContext = package;
                if (package != null)
                {
                    #region fill period 
                    Users userModel = new Users();
                    Customers custModel = new Customers();
                    Customers cust = new Customers();
                    //cust = await custModel.GetByID((int)cb_customer.SelectedValue);
                    cust = await custModel.GetByID(custID);
                    countryPackageDates = await cpdModel.GetAll();
                    if (bdr_agent.Visibility == Visibility.Visible)
                    {
                        //Users agent = await userModel.GetByID((int)cb_agent.SelectedValue);
                        Users agent = await userModel.GetByID(agentID);
                        //countryPackageDates = countryPackageDates.Where(x => x.isActive == 1 && x.packageId == (int)cb_package.SelectedValue && x.countryId == cust.countryId);
                        countryPackageDates = countryPackageDates.Where(x => x.isActive == 1 && x.packageId == _package.packageId && x.countryId == cust.countryId);
                    }
                    else
                        //countryPackageDates = countryPackageDates.Where(x => x.isActive == 1 && x.packageId == (int)cb_package.SelectedValue && x.countryId == cust.countryId);
                        countryPackageDates = countryPackageDates.Where(x => x.isActive == 1 && x.packageId == _package.packageId && x.countryId == cust.countryId);


                    foreach (var p in countryPackageDates)
                    {
                        if (p.islimitDate)
                            p.notes = MainWindow.resourcemanager.GetString("trUnLimited");
                        else
                        {
                            switch (p.monthCount)
                            {
                                case 1: p.notes = MainWindow.resourcemanager.GetString("trOneMonth"); break;
                                case 3: p.notes = MainWindow.resourcemanager.GetString("trThreeMonth"); break;
                                case 6: p.notes = MainWindow.resourcemanager.GetString("trSixMonth"); break;
                                case 0: p.notes = MainWindow.resourcemanager.GetString("trTwelveMonth"); break;
                            }
                        }
                    }
                    cb_period.DisplayMemberPath = "notes";
                    cb_period.SelectedValuePath = "Id";
                    cb_period.ItemsSource = countryPackageDates;
                    if(oldCustomerId != 0) cb_period.SelectedValue = oldCountryPackageId;
                #endregion

            }


            }
            catch (Exception ex)
            {

                HelpClass.ExceptionMessage(ex, this);
            }
        }

        #region reports
        private void Btn_pdf_Click(object sender, RoutedEventArgs e)
        {//pdf
            try
            {
                HelpClass.StartAwait(grid_main);

                #region
                BuildReport();

                saveFileDialog.Filter = "PDF|*.pdf;";

                if (saveFileDialog.ShowDialog() == true)
                {
                    string filepath = saveFileDialog.FileName;
                    //LocalReportExtensions.ExportToPDF(rep, filepath);
                }
                #endregion

                HelpClass.EndAwait(grid_main);
            }
            catch (Exception ex)
            {
                HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }

        }
        private void Btn_print_Click(object sender, RoutedEventArgs e)
        {//print
            try
            {
                HelpClass.StartAwait(grid_main);

                #region

                BuildReport();
                //LocalReportExtensions.PrintToPrinterbyNameAndCopy(rep, MainWindow.rep_printer_name, short.Parse(MainWindow.rep_print_count));

                #endregion

                HelpClass.EndAwait(grid_main);
            }
            catch (Exception ex)
            {
                HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }

        }

        private void Btn_exportToExcel_Click(object sender, RoutedEventArgs e)
        {//excel
            try
            {
                HelpClass.StartAwait(grid_main);

                #region
                Thread t1 = new Thread(() =>
                {
                    BuildReport();
                    this.Dispatcher.Invoke(() =>
                    {
                        saveFileDialog.Filter = "EXCEL|*.xls;";
                        if (saveFileDialog.ShowDialog() == true)
                        {
                            string filepath = saveFileDialog.FileName;
                            // LocalReportExtensions.ExportToExcel(rep, filepath);
                        }
                    });
                });
                t1.Start();
                #endregion

                HelpClass.EndAwait(grid_main);
            }
            catch (Exception ex)
            {
                HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }

        }

        private void Btn_preview_Click(object sender, RoutedEventArgs e)
        {//preview
            try
            {
                HelpClass.StartAwait(grid_main);

                #region
                Window.GetWindow(this).Opacity = 0.2;
                string pdfpath = "";

                pdfpath = @"\Thumb\report\temp.pdf";
                //pdfpath = reportclass.PathUp(Directory.GetCurrentDirectory(), 2, pdfpath);

                BuildReport();

                //LocalReportExtensions.ExportToPDF(rep, pdfpath);
                //wd_previewPdf w = new wd_previewPdf();
                //w.pdfPath = pdfpath;
                //if (!string.IsNullOrEmpty(w.pdfPath))
                //{
                    //w.ShowDialog();
                    //w.wb_pdfWebViewer.Dispose();
                //}
                Window.GetWindow(this).Opacity = 1;
                #endregion

                HelpClass.EndAwait(grid_main);
            }
            catch (Exception ex)
            {
                HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }

        }

        //ReportCls reportclass = new ReportCls();
        LocalReport rep = new LocalReport();
        SaveFileDialog saveFileDialog = new SaveFileDialog();
        public void BuildReport()
        {

            List<ReportParameter> paramarr = new List<ReportParameter>();

            string addpath = "";
            string firstTitle = "paymentsReport";
            string secondTitle = "";
            string subTitle = "";
            string Title = "";

            //bool isArabic = ReportCls.checkLang();
            //if (isArabic)
            //{
                //addpath = @"\Reports\StatisticReport\Accounts\Paymetns\Ar\ArVendor.rdlc";
                //secondTitle = "vendors";
            //}
            //else
            //{
                //addpath = @"\Reports\StatisticReport\Accounts\Paymetns\En\Vendor.rdlc";
                //secondTitle = "vendors";
            //}
            //string reppath = reportclass.PathUp(Directory.GetCurrentDirectory(), 2, addpath);

            //ReportCls.checkLang();
            //subTitle = clsReports.ReportTabTitle(firstTitle, secondTitle);
            Title = MainWindow.resourcemanagerreport.GetString("trAccountantReport") + " / " + subTitle;
            paramarr.Add(new ReportParameter("trTitle", Title));
            //clsReports.cashTransferStsPayment(temp, rep, reppath, paramarr);
            //clsReports.setReportLanguage(paramarr);
            //clsReports.Header(paramarr);

            rep.SetParameters(paramarr);

            rep.Refresh();
        }
        #endregion
    }
}
