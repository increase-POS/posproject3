using AdministratorApp.ApiClasses;
using AdministratorApp.Classes;
using netoaster;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Resources;
using System.Text;
using System.Text.RegularExpressions;
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
       
        public static List<string> requiredControlList;
        PackageUser packuser = new PackageUser();
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
            //try
            //{
            //    HelpClass.StartAwait(grid_main);

                requiredControlList = new List<string> { "package", "agent" , "customer" , "period"};

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
                await FillCombo.fillCustomer(cb_customer);
                
                if(MainWindow.userLogin.type.Equals("ag"))
                {
                    cb_agent.SelectedValue = MainWindow.userLogin.userId;
                    cb_agent.IsEnabled = false;
                }
                else
                {
                    bdr_agent.Visibility = Visibility.Collapsed;
                    await FillCombo.fillPackage(cb_package);
                }

                
                //if(uc_packageUser.packageUser != null)
                //try
                //{
                //    cb_customer.SelectedValue = uc_packageUser.packageUser.customerId.Value;
                //    cb_agent.SelectedValue = uc_packageUser.packageUser.userId.Value;
                //    cb_package.SelectedValue = uc_packageUser.packageUser.packageId;
                //    cb_period.SelectedValue = uc_packageUser.packageUser.countryPackageId;
                //}
                //catch { }
                //await RefreshPackagesList();
                if (uc_packageUser.packageUser == null) Clear();

            //    HelpClass.EndAwait(grid_main);
            //}
            //catch (Exception ex)
            //{

            //    HelpClass.EndAwait(grid_main);
            //    HelpClass.ExceptionMessage(ex, this);
            //}
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

            btn_add.Content = MainWindow.resourcemanager.GetString("trSale");
            btn_serial.Content = MainWindow.resourcemanager.GetString("trSerials");

            txt_packageDetails.Text = MainWindow.resourcemanager.GetString("trPackageDetails");
            txt_packageCodeTitle.Text = MainWindow.resourcemanager.GetString("trCode");
            txt_packageNameTitle.Text = MainWindow.resourcemanager.GetString("trName");
            txt_detailsTitle.Text = MainWindow.resourcemanager.GetString("trDetails");

            txt_programDetails.Text = MainWindow.resourcemanager.GetString("trProgramDetails");
            txt_programTitle.Text = MainWindow.resourcemanager.GetString("trProgram");
            txt_versionTitle.Text = MainWindow.resourcemanager.GetString("trVersion");
            txt_priceTitle.Text = MainWindow.resourcemanager.GetString("trPrice");

            txt_packageLimits.Text = MainWindow.resourcemanager.GetString("trPackageLimits");
            txt_branchCountTitle.Text = MainWindow.resourcemanager.GetString("trBranchCount");
            txt_userCountTitle.Text = MainWindow.resourcemanager.GetString("trUserCount");
            txt_customerCountTitle.Text = MainWindow.resourcemanager.GetString("trCustomerCount");
            txt_salesInvCountTitle.Text = MainWindow.resourcemanager.GetString("trInvoiceCount");
            txt_endDateTitle.Text = MainWindow.resourcemanager.GetString("trEndDate");
            txt_storeCountNameTitle.Text = MainWindow.resourcemanager.GetString("trStoreCount");
            txt_posCountNameTitle.Text = MainWindow.resourcemanager.GetString("trPOSCount");
            txt_vendorCountNameTitle.Text = MainWindow.resourcemanager.GetString("trVendorCount");
            txt_itemCountNameTitle.Text = MainWindow.resourcemanager.GetString("trItemCount");
        }

        #region events
        CountryPackageDate cpdModel = new CountryPackageDate();
        IEnumerable<CountryPackageDate> countryPackageDates;

        private async void Cb_package_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {//selection
            //try
            //{
                if (cb_package.SelectedIndex != -1)
                {
                    package = cb_package.SelectedItem as Packages;
                    int agentID = 0;
                    if(cb_agent.SelectedItem != null) agentID = (int)cb_agent.SelectedValue;

                    await fillInputs(package , agentID, (int)cb_customer.SelectedValue);

                    #region old
                    //this.DataContext = package;
                    //if (package != null)
                    //{
                    //    #region fill period 

                    //    Users userModel = new Users();
                    //    Customers custModel = new Customers();
                    //    Customers cust = new Customers();
                    //    cust = await custModel.GetByID((int)cb_customer.SelectedValue);
                    //    countryPackageDates = await cpdModel.GetAll();
                    //    if (bdr_agent.Visibility == Visibility.Visible)
                    //    {
                    //        Users agent = await userModel.GetByID((int)cb_agent.SelectedValue);
                    //        countryPackageDates = countryPackageDates.Where(x => x.isActive == 1 && x.packageId == (int)cb_package.SelectedValue && x.countryId == cust.countryId);
                    //    }
                    //    else
                    //        countryPackageDates = countryPackageDates.Where(x => x.isActive == 1 && x.packageId == (int)cb_package.SelectedValue && x.countryId == cust.countryId)
                    //                                //.GroupBy(s => new { s.monthCount })
                    //                                //.Select(s => new
                    //                                //{
                    //                                //    Name = s.FirstOrDefault().updateDate,
                    //                                //})
                    //                                ; 

                    //    foreach (var p in countryPackageDates)
                    //    {
                    //        if (p.islimitDate)
                    //            p.notes = MainWindow.resourcemanager.GetString("trUnLimited");
                    //        else
                    //        {
                    //            switch (p.monthCount)
                    //            {
                    //                case 1: p.notes = MainWindow.resourcemanager.GetString("trOneMonth"); break;
                    //                case 3: p.notes = MainWindow.resourcemanager.GetString("trThreeMonth"); break;
                    //                case 6: p.notes = MainWindow.resourcemanager.GetString("trSixMonth"); break;
                    //                case 0: p.notes = MainWindow.resourcemanager.GetString("trTwelveMonth"); break;
                    //            }
                    //        }
                    //    }
                    //    cb_period.DisplayMemberPath = "notes";
                    //    cb_period.SelectedValuePath = "Id";
                    //    cb_period.ItemsSource = countryPackageDates;
                    //    #endregion
                    //}
                    #endregion
                }

            //}
            //catch (Exception ex)
            //{
            //    HelpClass.ExceptionMessage(ex, this);
            //}
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
            this.DataContext = new Packages();
            HelpClass.clearValidate(requiredControlList, this);
            cb_period.SelectedIndex = -1;
            tb_price.Clear();
            txt_currency.Text = "";
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
        {//sale
            try
            {
                HelpClass.StartAwait(grid_main);

                int msg = 0;
                if (HelpClass.validate(requiredControlList, this))
                {
                    packuser.packageId = int.Parse(cb_package.SelectedValue.ToString());
                    if(cb_agent.Visibility == Visibility.Visible)
                        packuser.userId = int.Parse(cb_agent.SelectedValue.ToString());
                    else
                        packuser.userId = 3;
                    if (cb_customer.SelectedValue != null)
                        packuser.customerId = int.Parse(cb_customer.SelectedValue.ToString());
                    packuser.createUserId = MainWindow.userID;
                    packuser.packageNumber = "autoNum";///??????
                    //packuser.packageNumber = await packuserModel.generateCodeNumber();
                    packuser.isActive = 1;
                    packuser.canRenew = true;

                    msg = await packuserModel.MultiSave(packuser, 1);

                    if (msg <= 0)
                        Toaster.ShowWarning(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopError"), animation: ToasterAnimation.FadeIn);
                    else
                    {
                        Toaster.ShowSuccess(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopAdd"), animation: ToasterAnimation.FadeIn);

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
                    await FillCombo.fillAgentPackage(cb_package , (int)cb_agent.SelectedValue);
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
                    tb_price.Text = cpd.price.ToString();
                    countries = await cModel.GetAll();
                    txt_currency.Text = countries.Where(c => c.countryId == cpd.countryId).FirstOrDefault().currency;
                }
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        public async Task fillInputs(Packages _package , int agentID , int custID)
        {
            //try
            //{
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
                    #endregion
                }

            //}
            //catch (Exception ex)
            //{

            //    HelpClass.ExceptionMessage(ex, this);
            //}
        }

    }
}
