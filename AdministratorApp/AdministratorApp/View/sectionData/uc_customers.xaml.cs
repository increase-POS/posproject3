﻿using AdministratorApp.ApiClasses;
using AdministratorApp.Classes;
using Microsoft.Win32;
using netoaster;
using POS.View.windows;
using System;
using System.Collections.Generic;
using System.IO;
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

namespace AdministratorApp.View.sectionData
{
    /// <summary>
    /// Interaction logic for uc_customers.xaml
    /// </summary>
    public partial class uc_customers : UserControl
    {
        public uc_customers()
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
        private static uc_customers _instance;
        public static uc_customers Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new uc_customers();
                return _instance;
            }
        }
        
        Customers customer = new Customers();
        IEnumerable<Customers> customersQuery;
        IEnumerable<Customers> customers;
        byte tgl_customerState;
        string searchText = "";
        public static List<string> requiredControlList;
        private async void UserControl_Loaded(object sender, RoutedEventArgs e)
        {//load
            try
            {
                HelpClass.StartAwait(grid_main);
                requiredControlList = new List<string> { "custname", "lastName",  "mobile" };
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

                await FillCombo.fillCountries(cb_areaMobile);
                await FillCombo.fillCountries(cb_areaPhone);
                await FillCombo.fillCountries(cb_areaFax);
                FillCombo.fillAgentLevel(cb_custlevel);

                Keyboard.Focus(tb_custCode);
                await RefreshCustomersList();
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
            //txt_active.Text = MainWindow.resourcemanager.GetString("trActive");
            //MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_search, MainWindow.resourcemanager.GetString("trSearchHint"));
            //txt_userHeader.Text = MainWindow.resourcemanager.GetString("trUsers");
            //txt_baseInformation.Text = MainWindow.resourcemanager.GetString("trBaseInformation");
            //MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_code, MainWindow.resourcemanager.GetString("trCodeHint"));
            //MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_name, MainWindow.resourcemanager.GetString("trNameHint"));
            //txt_isActive.Text = MainWindow.resourcemanager.GetString("trActive");
            //txt_details.Text = MainWindow.resourcemanager.GetString("trDetails");

            //MaterialDesignThemes.Wpf.HintAssist.SetHint(cb_discountType, MainWindow.resourcemanager.GetString("trTypeDiscountHint"));
            //MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_discountValue, MainWindow.resourcemanager.GetString("trDiscountValueHint"));
            //MaterialDesignThemes.Wpf.HintAssist.SetHint(dp_startDate, MainWindow.resourcemanager.GetString("trStartDateHint"));
            //MaterialDesignThemes.Wpf.HintAssist.SetHint(dp_endDate, MainWindow.resourcemanager.GetString("trEndDateHint"));
            //TextBox tbStart = (TextBox)tp_startTime.Template.FindName("PART_TextBox", tp_startTime);
            //MaterialDesignThemes.Wpf.HintAssist.SetHint(tbStart, MainWindow.resourcemanager.GetString("trStartTimeHint"));
            //TextBox tbEnd = (TextBox)tp_endTime.Template.FindName("PART_TextBox", tp_endTime);
            //MaterialDesignThemes.Wpf.HintAssist.SetHint(tbEnd, MainWindow.resourcemanager.GetString("trEndTimeHint"));
            //MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_note, MainWindow.resourcemanager.GetString("trNoteHint"));

            //txt_addButton.Text = MainWindow.resourcemanager.GetString("trAdd");
            //txt_updateButton.Text = MainWindow.resourcemanager.GetString("trUpdate");
            //txt_deleteButton.Text = MainWindow.resourcemanager.GetString("trDelete");
            //tt_add_Button.Content = MainWindow.resourcemanager.GetString("trAdd");
            //tt_update_Button.Content = MainWindow.resourcemanager.GetString("trUpdate");
            //tt_delete_Button.Content = MainWindow.resourcemanager.GetString("trDelete");

            //dg_user.Columns[0].Header = MainWindow.resourcemanager.GetString("trCode");
            //dg_user.Columns[1].Header = MainWindow.resourcemanager.GetString("trName");
            //dg_user.Columns[2].Header = MainWindow.resourcemanager.GetString("trValue");
            //dg_user.Columns[3].Header = MainWindow.resourcemanager.GetString("trStartDate");
            //dg_user.Columns[4].Header = MainWindow.resourcemanager.GetString("trEndDate");

            //tt_startTime.Content = MainWindow.resourcemanager.GetString("trStartTime");
            //tt_endTime.Content = MainWindow.resourcemanager.GetString("trEndTime");

            //tt_clear.Content = MainWindow.resourcemanager.GetString("trClear");
            //tt_refresh.Content = MainWindow.resourcemanager.GetString("trRefresh");
            //tt_report.Content = MainWindow.resourcemanager.GetString("trPdf");
            //tt_print.Content = MainWindow.resourcemanager.GetString("trPrint");
            //tt_excel.Content = MainWindow.resourcemanager.GetString("trExcel");
            //tt_pieChart.Content = MainWindow.resourcemanager.GetString("trPieChart");
            //tt_count.Content = MainWindow.resourcemanager.GetString("trCount");
            //btn_items.Content = MainWindow.resourcemanager.GetString("trItems");

        }
        #region Add - Update - Delete - Search - Tgl - Clear - DG_SelectionChanged - refresh
        private async void Btn_add_Click(object sender, RoutedEventArgs e)
        {//add
            try
            {
                HelpClass.StartAwait(grid_main);
                customer = new Customers();
                if (HelpClass.validate(requiredControlList, this))
                {
                    tb_custCode.Text = await customer.generateCodeNumber("c");
                    customer.custCode = tb_custCode.Text;
                  //  customer.custCode = "Cu-000001";
                    customer.custname = tb_custname.Text;
                    customer.lastName = tb_lastName.Text;
                    customer.email = tb_email.Text;
                    customer.mobile = cb_areaMobile.Text + "-" + tb_mobile.Text; 
                    if (!tb_phone.Text.Equals(""))
                        customer.phone = cb_areaPhone.Text + "-" + cb_areaPhoneLocal.Text + "-" + tb_phone.Text;
                    if (!tb_fax.Text.Equals(""))
                        customer.fax = cb_areaFax.Text + "-" + cb_areaFaxLocal.Text + "-" + tb_fax.Text;
                    if (cb_custlevel.SelectedValue != null)
                        customer.custlevel = cb_custlevel.SelectedValue.ToString();
                    customer.company = tb_company.Text;
                    customer.address = tb_address.Text;
                    customer.notes = tb_notes.Text;
                    customer.isActive = 1;
                    customer.createUserId = MainWindow.userLogin.userId;
                    customer.updateUserId = MainWindow.userLogin.userId;

                    int s = int.Parse(await customer.Save(customer));
                    if (s <= 0)
                        Toaster.ShowWarning(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopError"), animation: ToasterAnimation.FadeIn);
                    else
                    {
                        Toaster.ShowSuccess(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopAdd"), animation: ToasterAnimation.FadeIn);

                        if (isImgPressed)
                        {
                            int customerId = s;
                            string b = await customer.uploadImage(imgFileName,
                                Md5Encription.MD5Hash("Inc-m" + customerId.ToString()), customerId);
                            customer.image = b;
                            isImgPressed = false;
                        }

                        Clear();
                        await RefreshCustomersList();
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
        private async void Btn_update_Click(object sender, RoutedEventArgs e)
        {//update
            try
            {
                HelpClass.StartAwait(grid_main);
                if (HelpClass.validate(requiredControlList, this))
                {
                    customer.custCode = "Us-000001";
                    customer.custname = tb_custname.Text;
                    customer.lastName = tb_lastName.Text;
                    customer.email = tb_email.Text;
                    customer.mobile = cb_areaMobile.Text + "-" + tb_mobile.Text; ;
                    if (!tb_phone.Text.Equals(""))
                        customer.phone = cb_areaPhone.Text + "-" + cb_areaPhoneLocal.Text + "-" + tb_phone.Text;
                    if (!tb_fax.Text.Equals(""))
                        customer.fax = cb_areaFax.Text + "-" + cb_areaFaxLocal.Text + "-" + tb_fax.Text;
                    if (cb_custlevel.SelectedValue != null)
                        customer.custlevel = cb_custlevel.SelectedValue.ToString();
                    customer.company = tb_company.Text;
                    customer.address = tb_address.Text;
                    customer.notes = tb_notes.Text;
                    customer.isActive = 1;
                    customer.createUserId = MainWindow.userLogin.userId;
                    customer.updateUserId = MainWindow.userLogin.userId;

                    int s = int.Parse(await customer.Save(customer));
                    if (s <= 0)
                        Toaster.ShowWarning(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopError"), animation: ToasterAnimation.FadeIn);
                    else
                    {
                        Toaster.ShowSuccess(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopUpdate"), animation: ToasterAnimation.FadeIn);
                        await RefreshCustomersList();
                        await Search();
                        if (isImgPressed)
                        {
                            int customerId = s;
                            string b = await customer.uploadImage(imgFileName, Md5Encription.MD5Hash("Inc-m" + customerId.ToString()), customerId);
                            customer.image = b;
                            isImgPressed = false;
                            if (!b.Equals(""))
                            {
                                await getImg();
                            }
                            else
                            {
                                HelpClass.clearImg(btn_image);
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
        private async void Btn_delete_Click(object sender, RoutedEventArgs e)
        {
            try
            {//delete

                HelpClass.StartAwait(grid_main);
                if (customer.custId != 0)
                {
                    if ((!customer.canDelete) && (customer.isActive == 0))
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
                        if (customer.canDelete)
                            w.contentText = MainWindow.resourcemanager.GetString("trMessageBoxDelete");
                        if (!customer.canDelete)
                            w.contentText = MainWindow.resourcemanager.GetString("trMessageBoxDeactivate");
                        w.ShowDialog();
                        Window.GetWindow(this).Opacity = 1;
                        #endregion
                        if (w.isOk)
                        {
                            string popupContent = "";
                            if (customer.canDelete) popupContent = MainWindow.resourcemanager.GetString("trPopDelete");
                            if ((!customer.canDelete) && (customer.isActive == 1)) popupContent = MainWindow.resourcemanager.GetString("trPopInActive");

                            int s = int.Parse(await customer.Delete(customer.custId, MainWindow.userLogin.userId, customer.canDelete));
                            if (s < 0)
                                Toaster.ShowWarning(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopError"), animation: ToasterAnimation.FadeIn);
                            else
                            {
                                Toaster.ShowSuccess(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopDelete"), animation: ToasterAnimation.FadeIn);

                                await RefreshCustomersList();
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
            customer.isActive = 1;
            int s = int.Parse(await customer.Save(customer));
            if (s <= 0)
                Toaster.ShowWarning(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopError"), animation: ToasterAnimation.FadeIn);
            else
            {
                Toaster.ShowSuccess(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopActive"), animation: ToasterAnimation.FadeIn);
                await RefreshCustomersList();
                await Search();
            }
        }
        #endregion
        #region events
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
                if (customers is null)
                    await RefreshCustomersList();
                tgl_customerState = 1;
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
                if (customers is null)
                    await RefreshCustomersList();
                tgl_customerState = 0;
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
        private async void Dg_customer_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                HelpClass.StartAwait(grid_main);
                //selection
                if (dg_customer.SelectedIndex != -1)
                {
                    customer = dg_customer.SelectedItem as Customers;
                    this.DataContext = customer;
                    if (customer != null)
                    {
                        await getImg();
                        #region delete
                        if (customer.canDelete)
                            btn_delete.Content = MainWindow.resourcemanager.GetString("trDelete");
                        else
                        {
                            if (customer.isActive == 0)
                                btn_delete.Content = MainWindow.resourcemanager.GetString("trActive");
                            else
                                btn_delete.Content = MainWindow.resourcemanager.GetString("trInActive");
                        }
                        #endregion
                        HelpClass.getMobile(customer.mobile, cb_areaMobile, tb_mobile);
                        HelpClass.getPhone(customer.phone, cb_areaPhone, cb_areaPhoneLocal, tb_phone);
                        HelpClass.getPhone(customer.fax, cb_areaFax, cb_areaFaxLocal, tb_fax);
                    }
                }
                HelpClass.clearValidate(requiredControlList, this);
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
                await RefreshCustomersList();
                await Search();
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
            if (customers is null)
                await RefreshCustomersList();
            searchText = tb_search.Text.ToLower();
            customersQuery = customers.Where(s => (s.custCode.ToLower().Contains(searchText) ||
            s.custname.ToLower().Contains(searchText) ||
            s.mobile.ToLower().Contains(searchText)
            ) && s.isActive == tgl_customerState);
            RefreshCustomersView();
        }
        async Task<IEnumerable<Customers>> RefreshCustomersList()
        {
            customers = await customer.GetAll();
            return customers;
        }
        void RefreshCustomersView()
        {
            dg_customer.ItemsSource = customersQuery;
            txt_count.Text = customersQuery.Count().ToString();
        }
        #endregion
        #region validate - clearValidate - textChange - lostFocus - . . . . 
        void Clear()
        {
            this.DataContext = new Customers();
            #region Phone
            tb_mobile.Clear();
            tb_email.Clear();
            #endregion
            #region image
            HelpClass.clearImg(btn_image);
            #endregion


            // last 
            HelpClass.clearValidate(requiredControlList, this);
        }
        private void Number_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            try
            {
                //only  digits
                TextBox textBox = sender as TextBox;
                HelpClass.InputJustNumber(textBox);
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
                HelpClass.validate(requiredControlList, this);
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
                HelpClass.validate(requiredControlList, this);
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        #endregion
        
        #region Phone
        int? countryid;
        private async void Cb_areaPhone_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                HelpClass.StartAwait(grid_main);
                if (cb_areaPhone.SelectedValue != null)
                {
                    if (cb_areaPhone.SelectedIndex >= 0)
                    {
                        countryid = int.Parse(cb_areaPhone.SelectedValue.ToString());
                        await FillCombo.fillCountriesLocal(cb_areaPhoneLocal, (int)countryid, brd_areaPhoneLocal);
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
        private async void Cb_areaFax_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                HelpClass.StartAwait(grid_main);
                if (cb_areaFax.SelectedValue != null)
                {
                    if (cb_areaFax.SelectedIndex >= 0)
                    {
                        countryid = int.Parse(cb_areaFax.SelectedValue.ToString());
                        await FillCombo.fillCountriesLocal(cb_areaFaxLocal, (int)countryid, brd_areaFaxLocal);
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
        #region Image
        string imgFileName = "pic/no-image-icon-125x125.png";
        bool isImgPressed = false;
        OpenFileDialog openFileDialog = new OpenFileDialog();
        SaveFileDialog saveFileDialog = new SaveFileDialog();
        private void Btn_image_Click(object sender, RoutedEventArgs e)
        {
            //select image
            try
            {
                HelpClass.StartAwait(grid_main);
                isImgPressed = true;
                openFileDialog.Filter = "Images|*.png;*.jpg;*.bmp;*.jpeg;*.jfif";
                if (openFileDialog.ShowDialog() == true)
                {
                    HelpClass.imageBrush.ImageSource = new BitmapImage(new Uri(openFileDialog.FileName, UriKind.Relative));
                    btn_image.Background = HelpClass.imageBrush;
                    imgFileName = openFileDialog.FileName;
                }
                else
                { }
                HelpClass.EndAwait(grid_main);
            }
            catch (Exception ex)
            {
                HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        private async Task getImg()
        {
            if (string.IsNullOrEmpty(customer.image))
            {
                HelpClass.clearImg(btn_image);
            }
            else
            {
                byte[] imageBuffer = await customer.downloadImage(customer.image); // read this as BLOB from your DB

                var bitmapImage = new BitmapImage();
                if (imageBuffer != null)
                {
                    using (var memoryStream = new MemoryStream(imageBuffer))
                    {
                        bitmapImage.BeginInit();
                        bitmapImage.CacheOption = BitmapCacheOption.OnLoad;
                        bitmapImage.StreamSource = memoryStream;
                        bitmapImage.EndInit();
                    }

                    btn_image.Background = new ImageBrush(bitmapImage);
                    // configure trmporary path
                    string dir = Directory.GetParent(Directory.GetCurrentDirectory()).Parent.FullName;
                    string tmpPath = System.IO.Path.Combine(dir, Global.TMPCustomersFolder);
                    tmpPath = System.IO.Path.Combine(tmpPath, customer.image);
                    openFileDialog.FileName = tmpPath;
                }
                else
                    HelpClass.clearImg(btn_image);
            }
        }
        #endregion
    }
}