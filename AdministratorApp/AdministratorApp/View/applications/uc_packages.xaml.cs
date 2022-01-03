using AdministratorApp.ApiClasses;
using AdministratorApp.Classes;
using AdministratorApp.View.windows;
using netoaster;
using POS.View.windows;
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

namespace AdministratorApp.View.applications
{
    /// <summary>
    /// Interaction logic for uc_packages.xaml
    /// </summary>
    public partial class uc_packages : UserControl
    {
      
        public uc_packages()
        {
            try
            {
                InitializeComponent();
                HelpClass.defaultDatePickerStyle(dp_endDate);
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        private static uc_packages _instance;
        public static uc_packages Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new uc_packages();
                return _instance;
            }
        }
        Packages package = new Packages();
        IEnumerable<Packages> packagesQuery;
        IEnumerable<Packages> packages;
        byte tgl_packageState;
        string searchText = "";
        public static List<string> requiredControlList;
        private async void UserControl_Loaded(object sender, RoutedEventArgs e)
        {//load
            try
            {
                HelpClass.StartAwait(grid_main);
                requiredControlList = new List<string> { "packageName", "program", "version", "price"
                , "branchCount", "storeCount", "userCount"
                , "posCount", "customerCount", "vendorCount"
                , "salesInvCount", "itemCount"};

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
                await FillCombo.fillProgram(cb_program);
                translate();
                #endregion

                Keyboard.Focus(tb_code);

                await RefreshPackagesList();
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
            txt_active.Text = MainWindow.resourcemanager.GetString("trActive");
            MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_search, MainWindow.resourcemanager.GetString("trSearchHint"));
            txt_title.Text = MainWindow.resourcemanager.GetString("trPackages");
            txt_packageDetails.Text = MainWindow.resourcemanager.GetString("trPackageDetails");
            MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_code, MainWindow.resourcemanager.GetString("trCodeHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_packageName, MainWindow.resourcemanager.GetString("trPackageHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_details, MainWindow.resourcemanager.GetString("trDetailsHint"));

            txt_programDetails.Text = MainWindow.resourcemanager.GetString("trProgramDetails");
            MaterialDesignThemes.Wpf.HintAssist.SetHint(cb_program, MainWindow.resourcemanager.GetString("trProgramHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(cb_version, MainWindow.resourcemanager.GetString("trVersionHint"));

            txt_packageLimits.Text = MainWindow.resourcemanager.GetString("trPackageLimits");
            MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_branchCount, MainWindow.resourcemanager.GetString("trBranchCountHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_storeCount, MainWindow.resourcemanager.GetString("trStoreCountHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_userCount, MainWindow.resourcemanager.GetString("trUserCountHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_posCount, MainWindow.resourcemanager.GetString("trPOSCountHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_customerCount, MainWindow.resourcemanager.GetString("trCustomerCountHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_vendorCount, MainWindow.resourcemanager.GetString("trVendorCountHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_salesInvCount, MainWindow.resourcemanager.GetString("trSaleInvCountHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_itemCount, MainWindow.resourcemanager.GetString("trItemsCountHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_notes, MainWindow.resourcemanager.GetString("trNoteHint"));

            btn_add.Content = MainWindow.resourcemanager.GetString("trAdd");
            btn_update.Content = MainWindow.resourcemanager.GetString("trUpdate");
            btn_delete.Content = MainWindow.resourcemanager.GetString("trDelete");
            btn_packagePriceDate.Content = MainWindow.resourcemanager.GetString("trPrice");

            dg_package.Columns[0].Header = MainWindow.resourcemanager.GetString("trCode");
            dg_package.Columns[1].Header = MainWindow.resourcemanager.GetString("trPackage");
            dg_package.Columns[2].Header = MainWindow.resourcemanager.GetString("trProgram");
            dg_package.Columns[3].Header = MainWindow.resourcemanager.GetString("trVersion");

            tt_clear.Content = MainWindow.resourcemanager.GetString("trClear");
            tt_refresh.Content = MainWindow.resourcemanager.GetString("trRefresh");
            tt_report.Content = MainWindow.resourcemanager.GetString("trPdf");
            tt_print.Content = MainWindow.resourcemanager.GetString("trPrint");
            tt_excel.Content = MainWindow.resourcemanager.GetString("trExcel");
            tt_count.Content = MainWindow.resourcemanager.GetString("trCount");

        }
        #region Add - Update - Delete - activate  

        private async void Btn_add_Click(object sender, RoutedEventArgs e)
        {//add
            try
            {
                HelpClass.StartAwait(grid_main);
                package = new Packages();
                if (validate())
                {
                    string isExist = await package.isExistCode(tb_code.Text.Trim());
                    if (isExist == "0")
                    {
                        package.packageCode = tb_code.Text.Trim();
                        package.packageName = tb_packageName.Text;
                        package.details = tb_details.Text;
                        package.programId = (int)cb_program.SelectedValue;
                        package.verId = (int)cb_version.SelectedValue;
                        //package.price = decimal.Parse(tb_price.Text);
                        if (tgl_branch.IsChecked == true)
                            package.branchCount = -1;
                        else
                            package.branchCount = int.Parse(tb_branchCount.Text);
                        if (tgl_store.IsChecked == true)
                            package.storeCount = -1;
                        else
                            package.storeCount = int.Parse(tb_storeCount.Text);
                        if (tgl_pos.IsChecked == true)
                            package.posCount = -1;
                        else
                            package.posCount = int.Parse(tb_posCount.Text);
                        if (tgl_user.IsChecked == true)
                            package.userCount = -1;
                        else
                            package.userCount = int.Parse(tb_userCount.Text);
                        if (tgl_vendor.IsChecked == true)
                            package.vendorCount = -1;
                        else
                            package.vendorCount = int.Parse(tb_vendorCount.Text);
                        if (tgl_customer.IsChecked == true)
                            package.customerCount = -1;
                        else
                            package.customerCount = int.Parse(tb_customerCount.Text);
                        if (tgl_item.IsChecked == true)
                            package.itemCount = -1;
                        else
                            package.itemCount = int.Parse(tb_itemCount.Text);
                        if (tgl_saleInv.IsChecked == true)
                            package.salesInvCount = -1;
                        else
                            package.salesInvCount = int.Parse(tb_salesInvCount.Text);
                        //package.islimitDate = (bool)tgl_islimitDate.IsChecked;
                        //if (dp_endDate.SelectedDate != null)
                        //    package.endDate = dp_endDate.SelectedDate.Value;
                        //else package.endDate = null;
                        package.notes = tb_notes.Text;
                        package.isActive = 1;
                        package.createUserId = MainWindow.userLogin.userId;
                        package.updateUserId = MainWindow.userLogin.userId;

                        int s = await package.Save(package);
                        if (s <= 0)
                            Toaster.ShowWarning(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopError"), animation: ToasterAnimation.FadeIn);
                        else
                        {
                            Toaster.ShowSuccess(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopAdd"), animation: ToasterAnimation.FadeIn);
                            Clear();
                            await RefreshPackagesList();
                            await Search();
                        }
                    }
                    else
                    {
                        MessageBox.Show("exist ");
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
        private async void Btn_update_Click(object sender, RoutedEventArgs e)
        {//update
            try
            {
                HelpClass.StartAwait(grid_main);
                if (validate())
                {
                    package.packageCode = tb_code.Text.Trim();
                    package.packageName = tb_packageName.Text;
                    package.details = tb_details.Text;
                    package.programId = (int)cb_program.SelectedValue;
                    package.verId = (int)cb_version.SelectedValue;
                    //package.price = decimal.Parse(tb_price.Text);
                    if (tgl_branch.IsChecked == true)
                        package.branchCount = -1;
                    else
                        package.branchCount = int.Parse(tb_branchCount.Text);
                    if (tgl_store.IsChecked == true)
                        package.storeCount = -1;
                    else
                        package.storeCount = int.Parse(tb_storeCount.Text);
                    if (tgl_pos.IsChecked == true)
                        package.posCount = -1;
                    else
                        package.posCount = int.Parse(tb_posCount.Text);
                    if (tgl_user.IsChecked == true)
                        package.userCount = -1;
                    else
                        package.userCount = int.Parse(tb_userCount.Text);
                    if (tgl_vendor.IsChecked == true)
                        package.vendorCount = -1;
                    else
                        package.vendorCount = int.Parse(tb_vendorCount.Text);
                    if (tgl_customer.IsChecked == true)
                        package.customerCount = -1;
                    else
                        package.customerCount = int.Parse(tb_customerCount.Text);
                    if (tgl_item.IsChecked == true)
                        package.itemCount = -1;
                    else
                        package.itemCount = int.Parse(tb_itemCount.Text);
                    if (tgl_saleInv.IsChecked == true)
                        package.salesInvCount = -1;
                    else
                        package.salesInvCount = int.Parse(tb_salesInvCount.Text);
                    //package.islimitDate = (bool)tgl_islimitDate.IsChecked;
                    //if (dp_endDate.SelectedDate != null)
                    //    package.endDate = dp_endDate.SelectedDate.Value;
                    //else package.endDate = null;
                    package.notes = tb_notes.Text;
                    package.isActive = 1;
                    package.createUserId = MainWindow.userLogin.userId;
                    package.updateUserId = MainWindow.userLogin.userId;

                    int s = await package.Save(package);
                    if (s <= 0)
                        Toaster.ShowWarning(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopError"), animation: ToasterAnimation.FadeIn);
                    else
                    {
                        Toaster.ShowSuccess(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopUpdate"), animation: ToasterAnimation.FadeIn);
                        await RefreshPackagesList();
                        await Search();
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
        private async void Btn_delete_Click(object sender, RoutedEventArgs e)
        {
            try
            {//delete

                HelpClass.StartAwait(grid_main);
                if (package.packageId != 0)
                {
                    if ((!package.canDelete) && (package.isActive == 0))
                    {
                        #region
                        Window.GetWindow(this).Opacity = 0.2;
                        wd_acceptCancelPopup w = new wd_acceptCancelPopup();
                        w.contentText = MainWindow.resourcemanager.GetString("trMessageBoxActivate");
                        w.ShowDialog();
                        Window.GetWindow(this).Opacity = 1;
                        #endregion
                        if (w.isOk)
                            await activate();
                    }
                    else
                    {
                        #region
                        Window.GetWindow(this).Opacity = 0.2;
                        wd_acceptCancelPopup w = new wd_acceptCancelPopup();
                        if (package.canDelete)
                            w.contentText = MainWindow.resourcemanager.GetString("trMessageBoxDelete");
                        if (!package.canDelete)
                            w.contentText = MainWindow.resourcemanager.GetString("trMessageBoxDeactivate");
                        w.ShowDialog();
                        Window.GetWindow(this).Opacity = 1;
                        #endregion
                        if (w.isOk)
                        {
                            string popupContent = "";
                            if (package.canDelete) popupContent = MainWindow.resourcemanager.GetString("trPopDelete");
                            if ((!package.canDelete) && (package.isActive == 1)) popupContent = MainWindow.resourcemanager.GetString("trPopInActive");

                            int s = await package.Delete(package.packageId, MainWindow.userLogin.userId, package.canDelete);
                            if (s <= 0)
                                Toaster.ShowWarning(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopError"), animation: ToasterAnimation.FadeIn);
                            else
                            {
                                Toaster.ShowSuccess(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopDelete"), animation: ToasterAnimation.FadeIn);

                                await RefreshPackagesList();
                                await Search();
                                Clear();

                            }
                        }
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
        private async Task activate()
        {//activate
            package.isActive = 1;
            int s = await package.Save(package);
            if (s <= 0)
                Toaster.ShowWarning(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopError"), animation: ToasterAnimation.FadeIn);
            else
            {
                Toaster.ShowSuccess(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopActive"), animation: ToasterAnimation.FadeIn);
                await RefreshPackagesList();
                await Search();
            }
        }
        #endregion
        #region events
        private void Dg_package_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {//selection
            try
            {
                HelpClass.StartAwait(grid_main);

                if (dg_package.SelectedIndex != -1)
                {
                    package = dg_package.SelectedItem as Packages;
                    this.DataContext = package;

                    if (package != null)
                    {
                        btn_packagePriceDate.IsEnabled = true;

                        #region delete
                        if (package.canDelete)
                            btn_delete.Content = MainWindow.resourcemanager.GetString("trDelete");
                        else
                        {
                            if (package.isActive == 0)
                                btn_delete.Content = MainWindow.resourcemanager.GetString("trActive");
                            else
                                btn_delete.Content = MainWindow.resourcemanager.GetString("trInActive");
                        }
                        #endregion
                    }
                }

                clearValidate();
                HelpClass.EndAwait(grid_main);
            }
            catch (Exception ex)
            {

                HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        private async void Btn_refresh_Click(object sender, RoutedEventArgs e)
        {
            try
            {//refresh

                HelpClass.StartAwait(grid_main);
                await RefreshPackagesList();
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
        private async void Tgl_isActive_Checked(object sender, RoutedEventArgs e)
        {
            try
            {
                HelpClass.StartAwait(grid_main);
                if (packages is null)
                    await RefreshPackagesList();
                tgl_packageState = 1;
                await Search();
                HelpClass.EndAwait(grid_main);
            }
            catch (Exception ex)
            {
                HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        private async void Tgl_isActive_Unchecked(object sender, RoutedEventArgs e)
        {
            try
            {
                HelpClass.StartAwait(grid_main);
                if (packages is null)
                    await RefreshPackagesList();
                tgl_packageState = 0;
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
        #endregion
        #region Refresh & Search
        async Task Search()
        {
            //search
            if (packages is null)
                await RefreshPackagesList();
            searchText = tb_search.Text.ToLower();
            packagesQuery = packages.Where(s => (s.packageCode.ToLower().Contains(searchText) ||
            s.packageName.ToLower().Contains(searchText)
            || s.programName.ToLower().Contains(searchText)
            || s.verName.ToLower().Contains(searchText)
            ) && s.isActive == tgl_packageState);
            RefreshPackagesView();
        }
        async Task<IEnumerable<Packages>> RefreshPackagesList()
        {
            packages = await package.GetAll();
            return packages;
        }
        void RefreshPackagesView()
        {
            dg_package.ItemsSource = packagesQuery;
            txt_count.Text = packagesQuery.Count().ToString();
        }
        #endregion
        #region validate - clearValidate - textChange - lostFocus - . . . . 
        void Clear()
        {
            this.DataContext = new Packages();
            btn_packagePriceDate.IsEnabled = false;
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
                    if ( path != null)
                    HelpClass.clearValidate(path);
                }
            }
            catch { }
        }
        #endregion
        private async void Cb_program_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
            //HelpClass.StartAwait(grid_main);
            if (cb_program.SelectedValue != null)
                await FillCombo.fillVersionByProgram(cb_version, (int)cb_program.SelectedValue);
            if (package.verId != null )
                cb_version.SelectedValue = package.verId;
            //HelpClass.EndAwait(grid_main);
            }
            catch (Exception ex)
            {

                //HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        private void Btn_packagePriceDate_Click(object sender, RoutedEventArgs e)
        {//price-date
            try
            {
                Window.GetWindow(this).Opacity = 0.2;
                wd_countryPackageDate w = new wd_countryPackageDate();
                w.packageID = package.packageId;
                w.ShowDialog();
                Window.GetWindow(this).Opacity = 1;
                
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

        private void Tgl_Count_Checked(object sender, RoutedEventArgs e)
        {
            //try
            //{
            string name = ((CheckBox)sender).Name;
            chkCount(name, true);
            //}
            //catch (Exception ex)
            //{
            //    HelpClass.ExceptionMessage(ex, this);
            //}
        }

        private void Tgl_Count_Unchecked(object sender, RoutedEventArgs e)
        {
            //try
            //{
            string name = ((CheckBox)sender).Name;
            chkCount(name, true);
            //}
            //catch (Exception ex)
            //{
            //    HelpClass.ExceptionMessage(ex, this);
            //}
        }
        //int branchCount = 0 , storeCount = 0
        private void chkCount(string _name, bool isChk)
        {
            TextBox tb = new TextBox();
            switch (_name)
            {
                case "tgl_branch":   tb = tb_branchCount;   break;
                case "tgl_store":    tb = tb_storeCount;    break;
                case "tgl_user":     tb = tb_userCount;     break;
                case "tgl_pos":      tb = tb_posCount;      break;
                case "tgl_customer": tb = tb_customerCount; break;
                case "tgl_vendor":   tb = tb_vendorCount;   break;
                case "tgl_saleInv":  tb = tb_salesInvCount; break;
                case "tgl_item":     tb = tb_itemCount;     break;
            }

            tb.IsEnabled = !isChk;
        }
    }
}
