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
        Packages package = new Packages();
        IEnumerable<Packages> packages;
        byte tgl_packageState;
        string searchText = "";
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
     
        private async void UserControl_Loaded(object sender, RoutedEventArgs e)
        {//load
            try
            {
                HelpClass.StartAwait(grid_main);
                requiredControlList = new List<string> { "package", "agent" , "customer" , "count"};

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

                await FillCombo.fillPackage(cb_package);
                await FillCombo.fillAgent(cb_agent);
                await FillCombo.fillCustomer(cb_customer);
               
                await RefreshPackagesList();
                Clear();

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
            MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_count, MainWindow.resourcemanager.GetString("trCountHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(cb_agent, MainWindow.resourcemanager.GetString("trAgentHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(cb_customer, MainWindow.resourcemanager.GetString("trCustomerHint"));
            btn_add.Content = MainWindow.resourcemanager.GetString("trSale");

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
        private void Cb_package_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {//selection
            try
            {
                HelpClass.StartAwait(grid_main);

                if (cb_package.SelectedIndex != -1)
                {
                    package = cb_package.SelectedItem as Packages;
                    this.DataContext = package;
                    if (package != null)
                    {

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

        private void Btn_clear_Click(object sender, RoutedEventArgs e)
        {//clear
            try
            {
                HelpClass.StartAwait(grid_main);

                Clear();
                cb_package.SelectedIndex = -1;
                cb_agent.SelectedIndex = -1;
                cb_customer.SelectedIndex = -1;
                tb_count.Clear();
                p_error_count.Visibility = Visibility.Collapsed;

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
        async Task<IEnumerable<Packages>> RefreshPackagesList()
        {
            packages = await package.GetAll();
            return packages;
        }
        #endregion

        #region validate - clearValidate - textChange - lostFocus - . . . . 
        void Clear()
        {
            this.DataContext = new Packages();
            HelpClass.clearValidate(requiredControlList, this);
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
                    packuser.userId = int.Parse(cb_agent.SelectedValue.ToString());
                    if (cb_customer.SelectedValue != null)
                        packuser.customerId = int.Parse(cb_customer.SelectedValue.ToString());
                    packuser.createUserId = MainWindow.userID;
                    packuser.packageNumber = "autoNum";///??????
                    packuser.isActive = 1;

                    msg = await packuserModel.MultiSave(packuser, int.Parse(tb_count.Text));

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

        private void UserControl_Unloaded(object sender, RoutedEventArgs e)
        {
            GC.Collect();
        }
    }
}
