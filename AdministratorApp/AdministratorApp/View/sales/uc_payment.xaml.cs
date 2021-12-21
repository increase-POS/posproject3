using AdministratorApp.Classes;
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
    /// Interaction logic for uc_payment.xaml
    /// </summary>
    public partial class uc_payment : UserControl
    {
        private static uc_payment _instance;
        public static uc_payment Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new uc_payment();
                return _instance;
            }
        }
        public uc_payment()
        {
            try
            {
                InitializeComponent();
            }
            catch (Exception ex)
            {
                HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }

        }
        byte tgl_packageUserState;
        string searchText = "";
        public static List<string> requiredControlList;
        private async void UserControl_Loaded(object sender, RoutedEventArgs e)
        {//load
            try
            {
                HelpClass.StartAwait(grid_main);
                requiredControlList = new List<string> { "" };
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

                await FillCombo.fillCustomer(cb_customerId);

                await Search();
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
            MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_search, MainWindow.resourcemanager.GetString("trSearchHint"));
            txt_baseInformation.Text = MainWindow.resourcemanager.GetString("trBaseInformation");
            txt_title.Text = MainWindow.resourcemanager.GetString("trAgentPackage");

            MaterialDesignThemes.Wpf.HintAssist.SetHint(cb_customerId, MainWindow.resourcemanager.GetString("trCustomerHint"));

            btn_pay.Content = MainWindow.resourcemanager.GetString("trPay");

            //dg_payments.Columns[0].Header = MainWindow.resourcemanager.GetString("trProcessNumTooltip");
            //dg_payments.Columns[1].Header = MainWindow.resourcemanager.GetString("trAgent");
            //dg_payments.Columns[2].Header = MainWindow.resourcemanager.GetString("trCustomer");
            //dg_payments.Columns[3].Header = MainWindow.resourcemanager.GetString("trCode");

            tt_clear.Content = MainWindow.resourcemanager.GetString("trClear");
            tt_refresh.Content = MainWindow.resourcemanager.GetString("trRefresh");
            tt_report.Content = MainWindow.resourcemanager.GetString("trPdf");
            tt_print.Content = MainWindow.resourcemanager.GetString("trPrint");
            tt_excel.Content = MainWindow.resourcemanager.GetString("trExcel");
            tt_count.Content = MainWindow.resourcemanager.GetString("trCount");
        }

        private async void Btn_refresh_Click(object sender, RoutedEventArgs e)
        {
            try
            {//refresh

                HelpClass.StartAwait(grid_main);
                //await RefreshPackageUserList();
                await Search();
                HelpClass.EndAwait(grid_main);
            }
            catch (Exception ex)
            {

                HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        private async void Tb_search_TextChanged(object sender, TextChangedEventArgs e)
        {
            try
            {
                HelpClass.StartAwait(grid_main);
                await Search();
                HelpClass.EndAwait(grid_main);
            }
            catch (Exception ex)
            {
                HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }
        }
          private void Btn_clear_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                HelpClass.StartAwait(grid_main);

                Clear();

                HelpClass.EndAwait(grid_main);
            }
            catch (Exception ex)
            {

                HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        private async void Dg_payments_SelectionChanged(object sender, SelectionChangedEventArgs e)
        { //selection
            //try
            //{
            //    HelpClass.StartAwait(grid_main);

            //    if (dg_payments.SelectedIndex != -1)
            //    {
            //        packageUser = dg_payments.SelectedItem as PackageUser;
            //        this.DataContext = packageUser;

            //        if (packageUser != null)
            //        {
            //            Packages packageModel = new Packages();
            //            Packages package = await packageModel.GetByID(packageUser.packageId.Value);

            //        }
            //    }

            //    clearValidate();
            //    HelpClass.EndAwait(grid_main);
            //}
            //catch (Exception ex)
            //{

            //    HelpClass.EndAwait(grid_main);
            //    HelpClass.ExceptionMessage(ex, this);
            //}
        }
        #region Refresh & Search
        async Task Search()
        {
            //search
            //if (packageUsers is null)
            //    await RefreshPackageUserList();

            //searchText = tb_search.Text.ToLower();
            //packageUsersQuery = packageUsers.Where(s => (s.packageSaleCode.ToLower().Contains(searchText)
            //|| s.userName.ToLower().Contains(searchText)
            //|| s.customerName.ToLower().Contains(searchText)
            //|| s.packageNumber.ToLower().Contains(searchText)
            //) && s.isActive == tgl_packageUserState);

            //RefreshPackageUserView();
        }
        //async Task<IEnumerable<PackageUser>> RefreshPackageUserList()
        //{
        //    packageUsers = await packageUser.GetAll();
        //    return packageUsers;
        //}
        //void RefreshPackageUserView()
        //{
        //    dg_payments.ItemsSource = packageUsersQuery;
        //    txt_count.Text = packageUsersQuery.Count().ToString();
        //}
        #endregion
        #region validate - clearValidate - textChange - lostFocus - . . . . 
        void Clear()
        {
            //this.DataContext = new PackageUser();
            clearValidate();
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
        private void Code_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            try
            {
                //only english and digits
                Regex regex = new Regex("^[a-zA-Z0-9. -_?]*$");
                if (!regex.IsMatch(e.Text))
                    e.Handled = true;
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
            try
            {
                validate();
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        private void validateEmpty_LostFocus(object sender, RoutedEventArgs e)
        {
            try
            {
                validate();
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        bool validate()
        {
            bool isValid = true;
            try
            {
                foreach (var control in requiredControlList)
                {
                    TextBox textBox = FindControls.FindVisualChildren<TextBox>(this).Where(x => x.Name == "tb_" + control)
                        .FirstOrDefault();
                    Path path = FindControls.FindVisualChildren<Path>(this).Where(x => x.Name == "p_error_" + control)
                        .FirstOrDefault();
                    Border border = FindControls.FindVisualChildren<Border>(this).Where(x => x.Name == "brd_" + control)
                         .FirstOrDefault();
                    if (textBox != null && path != null)
                        if (!HelpClass.validateEmpty(textBox.Text, path))
                            isValid = false;
                }
                foreach (var control in requiredControlList)
                {
                    ComboBox comboBox = FindControls.FindVisualChildren<ComboBox>(this).Where(x => x.Name == "cb_" + control)
                        .FirstOrDefault();
                    Path path = FindControls.FindVisualChildren<Path>(this).Where(x => x.Name == "p_error_" + control)
                        .FirstOrDefault();
                    Border border = FindControls.FindVisualChildren<Border>(this).Where(x => x.Name == "brd_" + control)
                         .FirstOrDefault();
                    if (comboBox != null && path != null)
                        if (!HelpClass.validateEmpty(comboBox.Text, path))
                            isValid = false;
                }
            }
            catch { }
            return isValid;
        }
        void clearValidate()
        {
            try
            {
                foreach (var control in requiredControlList)
                {
                    Path path = FindControls.FindVisualChildren<Path>(this).Where(x => x.Name == "p_error_" + control)
                        .FirstOrDefault();
                    if (path != null)
                        HelpClass.clearValidate(path);
                }
            }
            catch { }
        }
        #endregion
        private async void Dg_payments_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {//double click
         //try
         //{
         //HelpClass.StartAwait(grid_main);

            //Packages package = new Packages();
            //if (dg_payments.SelectedIndex != -1)
            //{
            //    if (packageUser.packageId > 0)
            //    {
            //        package = await package.GetByID(packageUser.packageId.Value);
            //        MainWindow.mainWindow.Btn_sales_Click(MainWindow.mainWindow.btn_sales, null);
            //        uc_sales.Instance.Window_Loaded(null, null);
            //        uc_sales.Instance.Btn_sale_Click(uc_sales.Instance.btn_sale, null);
            //        uc_sale.Instance.UserControl_Loaded(null, null);
            //        uc_sale.Instance.package = package;

            //        uc_sale.Instance.customerId = packageUser.customerId.Value;
            //        uc_sale.Instance.agentId = packageUser.userId.Value;
            //        uc_sale.Instance.packageId = packageUser.packageId.Value;
            //        try
            //        {
            //            uc_sale.Instance.countryPackageId = packageUser.countryPackageId.Value;
            //        }
            //        catch { }
            //        await uc_sale.Instance.fillInputs(package, packageUser.userId.Value, packageUser.customerId.Value);
            //    }
            //}

            //HelpClass.EndAwait(grid_main);
            //}
            //catch (Exception ex)
            //{
            //    HelpClass.EndAwait(grid_main);
            //    HelpClass.ExceptionMessage(ex, this);
            //}
        }
        private void UserControl_Unloaded(object sender, RoutedEventArgs e)
        {
            GC.Collect();
        }
    }
}
