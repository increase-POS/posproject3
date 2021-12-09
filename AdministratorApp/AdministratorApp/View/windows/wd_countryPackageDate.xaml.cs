using AdministratorApp.ApiClasses;
using AdministratorApp.Classes;
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
using System.Windows.Shapes;

namespace AdministratorApp.View.windows
{
    /// <summary>
    /// Interaction logic for wd_countryPackageDate.xaml
    /// </summary>
    public partial class wd_countryPackageDate : Window
    {
        public static List<string> requiredControlList;
        CountryPackageDate countryPackageDate = new CountryPackageDate();
        CountryPackageDate countryPackageDateModel = new CountryPackageDate();
        IEnumerable<CountryPackageDate> countryPackageDateQuery;
        IEnumerable<CountryPackageDate> countryPackageDates;
        public int packageID = 0;
        byte tgl_countryPackageDateState;
        string searchText = "";
        public wd_countryPackageDate()
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

        private async void Window_Loaded(object sender, RoutedEventArgs e)
        {//load
            try
            {
                HelpClass.StartAwait(grid_main);
                requiredControlList = new List<string> { "country", "month", "price" };
            
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

                await FillCombo.fillCountriesNames(cb_country);
                FillCombo.fillPackageMonth(cb_month);

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

        #region methods
        private void translate()
        {
            //MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_search, MainWindow.resourcemanager.GetString("trSearchHint"));
            //txt_packageDetails.Text = MainWindow.resourcemanager.GetString("trBaseInformation");
            //txt_active.Text = MainWindow.resourcemanager.GetString("trActive");
            //MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_code, MainWindow.resourcemanager.GetString("trCodeHint"));
            //MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_name, MainWindow.resourcemanager.GetString("trNameHint"));
            //MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_lastName, MainWindow.resourcemanager.GetString("trLastNameHint"));
            //MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_email, MainWindow.resourcemanager.GetString("trEmailHint"));
            //MaterialDesignThemes.Wpf.HintAssist.SetHint(pb_password, MainWindow.resourcemanager.GetString("trPasswordHint"));
            //MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_passwordMirror, MainWindow.resourcemanager.GetString("trPasswordHint"));
            //MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_mobile, MainWindow.resourcemanager.GetString("trMobileHint"));
            //MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_phone, MainWindow.resourcemanager.GetString("trPhoneHint"));
            //MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_fax, MainWindow.resourcemanager.GetString("trFaxHint"));
            //MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_address, MainWindow.resourcemanager.GetString("trAdressHint"));
            //txt_workInformation.Text = MainWindow.resourcemanager.GetString("trWorkInformation");
            //MaterialDesignThemes.Wpf.HintAssist.SetHint(cb_type, MainWindow.resourcemanager.GetString("trJobHint"));
            //txt_loginInformation.Text = MainWindow.resourcemanager.GetString("trLoginInformation");
            //MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_accountName, MainWindow.resourcemanager.GetString("trUserNameHint"));
            //MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_notes, MainWindow.resourcemanager.GetString("trNoteHint"));
            //MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_address, MainWindow.resourcemanager.GetString("trAdressHint"));

            //dg_user.Columns[0].Header = MainWindow.resourcemanager.GetString("trCode");
            //dg_user.Columns[1].Header = MainWindow.resourcemanager.GetString("trName");
            //dg_user.Columns[2].Header = MainWindow.resourcemanager.GetString("trMobile");

            //tt_clear.Content = MainWindow.resourcemanager.GetString("trClear");
            //tt_report.Content = MainWindow.resourcemanager.GetString("trPdf");
            //tt_preview.Content = MainWindow.resourcemanager.GetString("trPreview");
            //tt_print.Content = MainWindow.resourcemanager.GetString("trPrint");
            //tt_excel.Content = MainWindow.resourcemanager.GetString("trExcel");
            //tt_count.Content = MainWindow.resourcemanager.GetString("trCount");

            //btn_add.Content = MainWindow.resourcemanager.GetString("trAdd");
            //btn_update.Content = MainWindow.resourcemanager.GetString("trUpdate");
            //btn_delete.Content = MainWindow.resourcemanager.GetString("trDelete");

        }

        async Task Search()
        {//search
            if (countryPackageDates is null)
                await RefreshCountryPackageDateList();

            searchText = tb_search.Text.ToLower();
            countryPackageDateQuery = countryPackageDates
            .Where(s => (s.countryName.ToLower().Contains(searchText)
            ||
            s.monthCount.ToString().ToLower().Contains(searchText) ||
            s.yearCount.ToString().ToLower().Contains(searchText)
            ) && s.isActive == tgl_countryPackageDateState
            );
            RefreshCountryPackageDateView();
        }
        async Task<IEnumerable<CountryPackageDate>> RefreshCountryPackageDateList()
        {
            countryPackageDates = await countryPackageDateModel.GetAll();
            countryPackageDates = countryPackageDates.Where(c => c.packageId == packageID);
            return countryPackageDates;
        }
        void RefreshCountryPackageDateView()
        {
            dg_package.ItemsSource = countryPackageDateQuery;
        }
        void Clear()
        {
            cb_country.SelectedIndex = -1;
            cb_month.SelectedIndex = -1;
            this.DataContext = new Users();

            // last 
            HelpClass.clearValidateWindow(requiredControlList, this);
        }

        private void validate()
        {
            try
            {
                HelpClass.validateWindow(requiredControlList, this);
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        private async Task activate()
        {//activate
            countryPackageDate.isActive = 1;
            int s = await countryPackageDateModel.Save(countryPackageDate);
            if (s <= 0)
                Toaster.ShowWarning(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopError"), animation: ToasterAnimation.FadeIn);
            else
            {
                Toaster.ShowSuccess(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopActive"), animation: ToasterAnimation.FadeIn);
                await RefreshCountryPackageDateList();
                await Search();
            }
        }

        #endregion

        #region events

        private async void Tgl_isActive_Checked(object sender, RoutedEventArgs e)
        {
            try
            {
                HelpClass.StartAwait(grid_main);
                if (countryPackageDates is null)
                    await RefreshCountryPackageDateList();
                tgl_countryPackageDateState = 1;
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
                if (countryPackageDates is null)
                    await RefreshCountryPackageDateList();
                tgl_countryPackageDateState = 0;
                await Search();
                HelpClass.EndAwait(grid_main);
            }
            catch (Exception ex)
            {

                HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        private void Window_Unloaded(object sender, RoutedEventArgs e)
        {
            GC.Collect();
        }

        private void Window_MouseDown(object sender, MouseButtonEventArgs e)
        {
            try
            {
                DragMove();
            }
            catch (Exception)
            {

            }
        }

        private void HandleKeyPress(object sender, KeyEventArgs e)
        {
            try
            {
                if (sender != null)
                    HelpClass.StartAwait(grid_main);

                if (e.Key == Key.Return)
                {
                    Btn_save_Click(null, null);
                }
                if (sender != null)
                    HelpClass.EndAwait(grid_main);
            }
            catch (Exception ex)
            {
                if (sender != null)
                    HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        private void Btn_colse_Click(object sender, RoutedEventArgs e)
        {//close
            try
            {
                this.Close();
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        private void Tgl_islimitDate_Checked(object sender, RoutedEventArgs e)
        {
            try
            {
                cb_month.IsEnabled = false;
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        private void Tgl_islimitDate_Unchecked(object sender, RoutedEventArgs e)
        {
            try
            {
                cb_month.IsEnabled = true;
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

        private void Number_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {//decimal
            try
            {
                var regex = new Regex(@"^[0-9]*(?:\.[0-9]*)?$");
                if (regex.IsMatch(e.Text) && !(e.Text == "." && ((TextBox)sender).Text.Contains(e.Text)))
                    e.Handled = false;

                else
                    e.Handled = true;
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        private void validateEmpty_LostFocus(object sender, RoutedEventArgs e)
        {
            validate();
        }

        private void ValidateEmpty_TextChange(object sender, TextChangedEventArgs e)
        {
            validate();
        }
        #endregion

        #region save  update delete  clear  search   select  refresh

        private async void Btn_refresh_Click(object sender, RoutedEventArgs e)
        {//refresh
            try
            {
                HelpClass.StartAwait(grid_main);

                await RefreshCountryPackageDateList();
                await Search();

                HelpClass.EndAwait(grid_main);
            }
            catch (Exception ex)
            {
                HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }

        }
        private void Dg_package_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {//selection
            try
            {
                if (dg_package.SelectedIndex != -1)
                {
                    countryPackageDate = dg_package.SelectedItem as CountryPackageDate;
                    this.DataContext = countryPackageDate;
                    if (countryPackageDate != null)
                    {
                        this.DataContext = countryPackageDate;

                        #region delete
                        if (countryPackageDate.canDelete)
                            btn_delete.Content = MainWindow.resourcemanager.GetString("trDelete");
                        else
                        {
                            if (countryPackageDate.isActive == 0)
                                btn_delete.Content = MainWindow.resourcemanager.GetString("trActive");
                            else
                                btn_delete.Content = MainWindow.resourcemanager.GetString("trInActive");
                        }
                        #endregion
                    }
                }

                HelpClass.clearValidateWindow(requiredControlList, this);

            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        private async void Tb_search_TextChanged(object sender, TextChangedEventArgs e)
        {//search
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
        {//clear
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
        private async void Btn_save_Click(object sender, RoutedEventArgs e)
        {//save
            try
            {
                HelpClass.StartAwait(grid_main);

                countryPackageDate = new CountryPackageDate();
                if (cb_month.IsEnabled == true) requiredControlList.Remove("month");

                if (HelpClass.validateWindow(requiredControlList, this))
                {
                    countryPackageDate.countryId = Convert.ToInt32(cb_country.SelectedValue);
                    countryPackageDate.packageId = packageID;
                    if (cb_month.IsEnabled == true)
                        countryPackageDate.monthCount = Convert.ToInt32(cb_month.SelectedValue);
                    else
                        countryPackageDate.monthCount = 0;
                    if (Convert.ToInt32(cb_month.SelectedValue) == 12)
                        countryPackageDate.yearCount = 1;
                    else
                        countryPackageDate.yearCount = 0;
                    countryPackageDate.price = Convert.ToInt32(tb_price.Text);
                    countryPackageDate.islimitDate = tgl_islimitDate.IsChecked.Value;
                    countryPackageDate.notes = tb_notes.Text;
                    countryPackageDate.isActive = 1;
                    countryPackageDate.createUserId = MainWindow.userLogin.userId;
                    countryPackageDate.updateUserId = MainWindow.userLogin.userId;

                    int s = await countryPackageDateModel.Save(countryPackageDate);
                    if (s <= 0)
                        Toaster.ShowWarning(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopError"), animation: ToasterAnimation.FadeIn);
                    else
                    {
                        Toaster.ShowSuccess(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopAdd"), animation: ToasterAnimation.FadeIn);

                        Clear();
                        await RefreshCountryPackageDateList();
                        await Search();
                        if (!requiredControlList.Contains("month")) requiredControlList.Remove("month");
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

                if (cb_month.IsEnabled == true) requiredControlList.Remove("month");

                if (HelpClass.validateWindow(requiredControlList, this))
                {
                    countryPackageDate.countryId = Convert.ToInt32(cb_country.SelectedValue);
                    countryPackageDate.packageId = packageID;
                    if (cb_month.IsEnabled == true)
                        countryPackageDate.monthCount = Convert.ToInt32(cb_month.SelectedValue);
                    else
                        countryPackageDate.monthCount = 0;
                    if (Convert.ToInt32(cb_month.SelectedValue) == 12)
                        countryPackageDate.yearCount = 1;
                    else
                        countryPackageDate.yearCount = 0;
                    countryPackageDate.price = Convert.ToInt32(tb_price.Text);
                    countryPackageDate.islimitDate = tgl_islimitDate.IsChecked.Value;
                    countryPackageDate.notes = tb_notes.Text;
                    countryPackageDate.isActive = 1;
                    countryPackageDate.createUserId = MainWindow.userLogin.userId;
                    countryPackageDate.updateUserId = MainWindow.userLogin.userId;

                    int s = await countryPackageDateModel.Save(countryPackageDate);
                    if (s <= 0)
                        Toaster.ShowWarning(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopError"), animation: ToasterAnimation.FadeIn);
                    else
                    {
                        Toaster.ShowSuccess(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopUpdate"), animation: ToasterAnimation.FadeIn);

                        await Search();
                        if (!requiredControlList.Contains("month")) requiredControlList.Remove("month");
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
        {//delete
            try
            {
                HelpClass.StartAwait(grid_main);
                if (countryPackageDate.Id != 0)
                {
                    if ((!countryPackageDate.canDelete) && (countryPackageDate.isActive == 0))
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
                        if (countryPackageDate.canDelete)
                            w.contentText = MainWindow.resourcemanager.GetString("trMessageBoxDelete");
                        if (!countryPackageDate.canDelete)
                            w.contentText = MainWindow.resourcemanager.GetString("trMessageBoxDeactivate");
                        w.ShowDialog();
                        Window.GetWindow(this).Opacity = 1;
                        #endregion

                        if (w.isOk)
                        {
                            string popupContent = "";
                            if (countryPackageDate.canDelete) popupContent = MainWindow.resourcemanager.GetString("trPopDelete");
                            if ((!countryPackageDate.canDelete) && (countryPackageDate.isActive == 1)) popupContent = MainWindow.resourcemanager.GetString("trPopInActive");

                            int s = await countryPackageDate.Delete(countryPackageDate.Id, MainWindow.userLogin.userId, countryPackageDate.canDelete);
                            if (s < 0)
                                Toaster.ShowWarning(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopError"), animation: ToasterAnimation.FadeIn);
                            else
                            {
                                Toaster.ShowSuccess(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopDelete"), animation: ToasterAnimation.FadeIn);

                                await RefreshCountryPackageDateList();
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


        #endregion

        
    }
}
