using AdministratorApp.ApiClasses;
using AdministratorApp.Classes;
using Microsoft.Reporting.WinForms;
using Microsoft.Win32;
using netoaster;
using System;
using System.Collections.Generic;
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
      
        public static List<string> requiredControlList;
        PackageUser packageUserModel = new PackageUser();
        PackageUser packageUser = new PackageUser();
        Packages package = new Packages();
        IEnumerable<PackageUser> packageUsers;
        IEnumerable<PayOp> payOps;
        PayOp payOp = new PayOp();
        decimal totalNet = 0;

        private async void UserControl_Loaded(object sender, RoutedEventArgs e)
        {//load
            //try
            //{
            //    HelpClass.StartAwait(grid_main);

                requiredControlList = new List<string> { "customer" , "bookNumber" };

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

                if(MainWindow.userLogin.type.Equals("ag"))
                    await FillCombo.fillCustomerByAgent(cb_customer , MainWindow.userLogin.userId);
                else
                    await FillCombo.fillCustomer(cb_customer);

                //await Search();
                Clear();
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
            MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_search, MainWindow.resourcemanager.GetString("trSearchHint"));
            txt_baseInformation.Text = MainWindow.resourcemanager.GetString("trBaseInformation");
            txt_title.Text = MainWindow.resourcemanager.GetString("trPayment");
            txt_packageDetails.Text = MainWindow.resourcemanager.GetString("trPackageDetails");
            txt_payDetails.Text = MainWindow.resourcemanager.GetString("trPayDetails");

            MaterialDesignThemes.Wpf.HintAssist.SetHint(cb_customer, MainWindow.resourcemanager.GetString("trCustomerHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(cb_packageNumber, MainWindow.resourcemanager.GetString("trBookNumHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_discount, MainWindow.resourcemanager.GetString("trDiscountHint"));

            txt_packageNameTitle.Text = MainWindow.resourcemanager.GetString("trPackageName");
            txt_periodTitle.Text = MainWindow.resourcemanager.GetString("trPeriod");
            txt_expirDateTitle.Text = MainWindow.resourcemanager.GetString("trExpirationDate");
            txt_priceTitle.Text = MainWindow.resourcemanager.GetString("trPrice");
            txt_discountTitle.Text = MainWindow.resourcemanager.GetString("trDiscount");
            txt_totalTitle.Text = MainWindow.resourcemanager.GetString("trTotal");

            btn_pay.Content = MainWindow.resourcemanager.GetString("trPay");

            dg_payments.Columns[0].Header = MainWindow.resourcemanager.GetString("trProcessNumTooltip");
            dg_payments.Columns[1].Header = MainWindow.resourcemanager.GetString("trBookNum");
            dg_payments.Columns[2].Header = MainWindow.resourcemanager.GetString("trProcessDate");
            dg_payments.Columns[3].Header = MainWindow.resourcemanager.GetString("trExpirationDate");
            dg_payments.Columns[4].Header = MainWindow.resourcemanager.GetString("trPaid");

            tt_clear.Content = MainWindow.resourcemanager.GetString("trClear");
            tt_refresh.Content = MainWindow.resourcemanager.GetString("trRefresh");
            tt_report.Content = MainWindow.resourcemanager.GetString("trPdf");
            tt_print.Content = MainWindow.resourcemanager.GetString("trPrint");
            tt_excel.Content = MainWindow.resourcemanager.GetString("trExcel");
            tt_count.Content = MainWindow.resourcemanager.GetString("trCount");
        }

        private async void Btn_refresh_Click(object sender, RoutedEventArgs e)
        {//refresh
            try
            {

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
            cb_customer.SelectedIndex = -1;
            cb_packageNumber.SelectedIndex = -1;
            tb_discount.Clear();
            cb_packageNumber.IsEnabled = false;
            tb_discount.IsEnabled = false;
            clearValidate();
        }
        private void Number_PreviewTextInput(object sender, TextCompositionEventArgs e)
        { //only  digits
            try
            {
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

        PayOp payOpModel = new PayOp();
        private async void Cb_customer_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {//select customer
         //try
         //{
         //    HelpClass.StartAwait(grid_main);

                cb_packageNumber.SelectedItem = null;
                cb_packageNumber.IsEnabled = true;
                tb_discount.IsEnabled = true;
                if (cb_customer.SelectedIndex != -1)
                {
                    await FillCombo.fillBookNum(cb_packageNumber, (int)cb_customer.SelectedValue);
                    payOps = await payOpModel.GetByCustomerId((int)cb_customer.SelectedValue);
                    dg_payments.ItemsSource = payOps;
                }

               
            //    HelpClass.EndAwait(grid_main);
            //}
            //catch (Exception ex)
            //{
            //    HelpClass.EndAwait(grid_main);
            //    HelpClass.ExceptionMessage(ex, this);
            //}
        }
        
        private async void Cb_packageNumber_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {//select package
         //try
         //{
         //    HelpClass.StartAwait(grid_main);

            if (cb_packageNumber.SelectedIndex != -1)
            {
                btn_upgrade.IsEnabled = true;

                packageUser = cb_packageNumber.SelectedItem as PackageUser;

                #region fill Package details
                //packageUser = await packageUserModel.GetByID((int)cb_packageNumber.SelectedValue);

                //Packages packageModel = new Packages();
                if (packageUser != null)
                {
                    txt_packageNumberTitle.Text = packageUser.packageNumber;
                    txt_packageName.Text = packageUser.packageName;
                    txt_period.Text = packageUser.monthCount.ToString();//converter
                    txt_expirDate.Text = packageUser.expireDate.ToString();
                    txt_price.Text = packageUser.price.ToString();
                    txt_moneyCode.Text = packageUser.currency;
                    txt_discount.Text = tb_discount.Text;
                    txt_expirDate.Text = packageUser.expireDate.ToString();
                    txt_moneyCode1.Text = packageUser.currency;
                    int discount = 0;
                    try
                    {
                        discount = int.Parse(tb_discount.Text);
                    }
                    catch { discount = 0; }
                    //txt_total.Text = (float.Parse(txt_price.Text) - discount).ToString();
                    txt_moneyCode3.Text = packageUser.currency;
                    //package = await packageModel.GetByID(packageUser.packageId.Value);
                    //txt_packageName.Text = package.packageName;
                    //CountryPackageDate countryPackageDate = new CountryPackageDate();
                    //CountryPackageDate countryPackageDateModel = new CountryPackageDate();
                    //countryPackageDate = await countryPackageDateModel.GetByID(packageUser.countryPackageId.Value);
                    //txt_period.Text = HelpClass.getPeriod(countryPackageDate);
                    //txt_expirDate.Text = packageUser.expireDate.ToString();
                    //txt_price.Text = countryPackageDate.price.ToString();
                    //txt_moneyCode.Text = countryPackageDate.currency;
                    //txt_discount.Text = tb_discount.Text;
                    //txt_moneyCode1.Text = countryPackageDate.currency;
                    //int discount = 0;
                    //try
                    //{
                    //    discount = int.Parse(tb_discount.Text);
                    //}
                    //catch { discount = 0; }
                    //txt_total.Text = (float.Parse(txt_price.Text) - discount).ToString();
                    //txt_moneyCode3.Text = countryPackageDate.currency;
                }
                #endregion

                #region fill datagrid
                payOps = await payOp.GetByCustomerId((int)cb_customer.SelectedValue);
                dg_payments.ItemsSource = payOps;
                #endregion
            }
            //    HelpClass.EndAwait(grid_main);
            //}
            //catch (Exception ex)
            //{
            //    HelpClass.EndAwait(grid_main);
            //    HelpClass.ExceptionMessage(ex, this);
            //}
        }

        private async void Btn_upgrade_Click(object sender, RoutedEventArgs e)
        {//upgrade
         //try
         //{
         //    HelpClass.StartAwait(grid_main);

                if (packageUser.packageId > 0)
                {
                    MainWindow.mainWindow.Btn_sales_Click(MainWindow.mainWindow.btn_sales, null);
                    uc_sales.Instance.Window_Loaded(null, null);
                    uc_sales.Instance.Btn_sale_Click(uc_sales.Instance.btn_sale, null);
                    uc_sale.Instance.UserControl_Loaded(null, null);
                    uc_sale.Instance.package = package;

                    uc_sale.Instance.oldCustomerId = packageUser.customerId.Value;
                    uc_sale.Instance.oldAgentId = packageUser.userId.Value;
                    uc_sale.Instance.oldPackageId = packageUser.packageId.Value;
                    uc_sale.Instance.oldCountryPackageId = packageUser.countryPackageId.Value;
                    uc_sale.Instance.packuser = packageUser;

                    //await uc_sale.Instance.fillInputs(package, packageUser.userId.Value, packageUser.customerId.Value);
            }

            //    HelpClass.EndAwait(grid_main);
            //}
            //catch (Exception ex)
            //{
            //    HelpClass.EndAwait(grid_main);
            //    HelpClass.ExceptionMessage(ex, this);
            //}
        }

        private async void Btn_pay_Click(object sender, RoutedEventArgs e)
        {//pay
         //try
         //{
         //   HelpClass.StartAwait(grid_main);
            int msg = 0;

            payOp.Price = decimal.Parse(txt_price.Text);
            payOp.code = "";//auto po-000000
            payOp.type = packageUser.notes;//from package user????????
            payOp.packageUserId = packageUser.packageUserId;
            payOp.createUserId = MainWindow.userID;
            payOp.notes = "";
            payOp.discountValue = decimal.Parse(txt_discount.Text);
            if (MainWindow.userLogin.type.Equals("ag"))
                payOp.agentId = MainWindow.userID;
            else payOp.agentId = 3;
            payOp.customerId = (int)cb_customer.SelectedValue;
            payOp.countryPackageId = packageUser.countryPackageId;
            payOp.totalnet = totalNet;

            msg = await packageUserModel.packagePay(packageUser , payOp);
            if (msg <= 0)
                Toaster.ShowWarning(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopError"), animation: ToasterAnimation.FadeIn);
            else
            {
                Toaster.ShowSuccess(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopPay"), animation: ToasterAnimation.FadeIn);

                Clear();
            }
            //    HelpClass.EndAwait(grid_main);
            //}
            //catch (Exception ex)
            //{
            //    HelpClass.EndAwait(grid_main);
            //    HelpClass.ExceptionMessage(ex, this);
            //}
        }

        private void Tb_discount_TextChanged(object sender, TextChangedEventArgs e)
        {
            try
            {

                try
                {
                    txt_discount.Text = tb_discount.Text;
                }
                catch { txt_discount.Text = "0"; }
                totalNet = decimal.Parse(txt_price.Text) - int.Parse(txt_discount.Text);
                txt_total.Text = totalNet.ToString();

            }
            catch (Exception ex)
            {
                //HelpClass.ExceptionMessage(ex, this);
            }
        }
    }
}
