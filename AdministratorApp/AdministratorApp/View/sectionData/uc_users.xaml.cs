using AdministratorApp.ApiClasses;
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
    /// Interaction logic for uc_users.xaml
    /// </summary>
    public partial class uc_users : UserControl
    {
        public uc_users()
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
        private static uc_users _instance;
        public static uc_users Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new uc_users();
                return _instance;
            }
        }
        Users user = new Users();
        IEnumerable<Users> usersQuery;
        IEnumerable<Users> users;
        byte tgl_userState;
        string searchText = "";
        public static List<string> requiredControlList;
        private async void UserControl_Loaded(object sender, RoutedEventArgs e)
        {//load
            try
            {
                HelpClass.StartAwait(grid_main);
                requiredControlList = new List<string> { "name", "lastName", "accountName",  "type", "mobile" , "country" };

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

                await FillCombo.fillCountries(cb_areaMobile);
                await FillCombo.fillCountries(cb_areaPhone);
                await FillCombo.fillCountries(cb_areaFax);
                await FillCombo.fillCountriesNames(cb_country);
                FillCombo.fillUserType(cb_type);

                Keyboard.Focus(tb_code);

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
            txt_active.Text = MainWindow.resourcemanager.GetString("trActive");
            MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_code, MainWindow.resourcemanager.GetString("trCodeHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_name, MainWindow.resourcemanager.GetString("trNameHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_lastName, MainWindow.resourcemanager.GetString("trLastNameHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(cb_country, MainWindow.resourcemanager.GetString("trCountryHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_email, MainWindow.resourcemanager.GetString("trEmailHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(pb_password, MainWindow.resourcemanager.GetString("trPasswordHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_passwordMirror, MainWindow.resourcemanager.GetString("trPasswordHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_mobile, MainWindow.resourcemanager.GetString("trMobileHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_phone, MainWindow.resourcemanager.GetString("trPhoneHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_fax, MainWindow.resourcemanager.GetString("trFaxHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_address, MainWindow.resourcemanager.GetString("trAdressHint"));
            txt_workInformation.Text = MainWindow.resourcemanager.GetString("trWorkInformation");
            MaterialDesignThemes.Wpf.HintAssist.SetHint(cb_type, MainWindow.resourcemanager.GetString("trJobHint"));
            txt_loginInformation.Text = MainWindow.resourcemanager.GetString("trLoginInformation");
            MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_accountName, MainWindow.resourcemanager.GetString("trUserNameHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_notes, MainWindow.resourcemanager.GetString("trNoteHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_address, MainWindow.resourcemanager.GetString("trAdressHint"));

            dg_user.Columns[0].Header = MainWindow.resourcemanager.GetString("trCode");
            dg_user.Columns[1].Header = MainWindow.resourcemanager.GetString("trName");
            dg_user.Columns[2].Header = MainWindow.resourcemanager.GetString("trMobile");

            tt_clear.Content = MainWindow.resourcemanager.GetString("trClear");
            tt_report.Content = MainWindow.resourcemanager.GetString("trPdf");
            tt_preview.Content = MainWindow.resourcemanager.GetString("trPreview");
            tt_print.Content = MainWindow.resourcemanager.GetString("trPrint");
            tt_excel.Content = MainWindow.resourcemanager.GetString("trExcel");
            tt_count.Content = MainWindow.resourcemanager.GetString("trCount");

            btn_add.Content = MainWindow.resourcemanager.GetString("trAdd");
            btn_update.Content = MainWindow.resourcemanager.GetString("trUpdate");
            btn_delete.Content = MainWindow.resourcemanager.GetString("trDelete");

        }
        #region Add - Update - Delete - Search - Tgl - Clear - DG_SelectionChanged - refresh
        private async void Btn_add_Click(object sender, RoutedEventArgs e)
        { //add
            try
            {
                HelpClass.StartAwait(grid_main);

                //chk duplicate userName
                bool duplicateUserName = false;
                duplicateUserName = await chkIfUserNameIsExists(tb_name.Text, 0);
                //chk password length
                bool passLength = false;
                passLength = chkPasswordLength(pb_password.Password);
               
                user = new Users();
                if (HelpClass.validate(requiredControlList, this) && duplicateUserName && passLength && HelpClass.IsValidEmail(this))
                {
                    if (cb_type.SelectedValue != null)
                    {
                        //tb_code.Text = await user.generateCodeNumber(cb_type.SelectedValue.ToString());
                        tb_code.Text = await HelpClass.generateRandomString(3, "us", "Users", 0);
                        user.code = tb_code.Text;
                    }
                    user.name = tb_name.Text;
                    user.lastName = tb_lastName.Text;
                    user.countryId = Convert.ToInt32(cb_country.SelectedValue);
                    user.accountName = tb_accountName.Text;
                    user.password = Md5Encription.MD5Hash("Inc-m" + pb_password.Password); ;
                    user.email = tb_email.Text;
                    user.mobile = cb_areaMobile.Text + "-" + tb_mobile.Text; ;
                    if (!tb_phone.Text.Equals(""))
                        user.phone = cb_areaPhone.Text + "-" + cb_areaPhoneLocal.Text + "-" + tb_phone.Text;
                    if (!tb_fax.Text.Equals(""))
                        user.fax = cb_areaFax.Text + "-" + cb_areaFaxLocal.Text + "-" + tb_fax.Text;
                    if (cb_type.SelectedValue != null)
                        user.type = cb_type.SelectedValue.ToString();
                    user.address = tb_address.Text;
                    user.notes = tb_notes.Text;
                    user.isActive = 1;
                    user.createUserId = MainWindow.userLogin.userId;
                    user.updateUserId = MainWindow.userLogin.userId;

                    int s = await user.Save(user);
                    if (s <= 0)
                        Toaster.ShowWarning(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopError"), animation: ToasterAnimation.FadeIn);
                    else
                    {
                        Toaster.ShowSuccess(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopAdd"), animation: ToasterAnimation.FadeIn);
                       
                        if (isImgPressed)
                        {
                            int userId = s;
                            string b = await user.uploadImage(imgFileName,
                                Md5Encription.MD5Hash("Inc-m" + userId.ToString()), userId);
                            user.image = b;
                            isImgPressed = false;
                        }

                        Clear();
                        await RefreshUsersList();
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

                //chk duplicate userName
                bool duplicateUserName = false;
                duplicateUserName = await chkIfUserNameIsExists(tb_name.Text, user.userId);

                if (HelpClass.validate(requiredControlList, this) && duplicateUserName && HelpClass.IsValidEmail(this))
                {
                    //user.code = user.code;
                    user.name = tb_name.Text;
                    user.lastName = tb_lastName.Text;
                    user.countryId = Convert.ToInt32(cb_country.SelectedValue);
                    user.accountName = tb_accountName.Text;
                    //user.password = Md5Encription.MD5Hash("Inc-m" + pb_password.Password); ;
                    user.email = tb_email.Text;
                    user.mobile = cb_areaMobile.Text + "-" + tb_mobile.Text; ;
                    if (!tb_phone.Text.Equals(""))
                        user.phone = cb_areaPhone.Text + "-" + cb_areaPhoneLocal.Text + "-" + tb_phone.Text;
                    if (!tb_fax.Text.Equals(""))
                        user.fax = cb_areaFax.Text + "-" + cb_areaFaxLocal.Text + "-" + tb_fax.Text;
                    if (cb_type.SelectedValue != null)
                        user.type = cb_type.SelectedValue.ToString();
                    user.address = tb_address.Text;
                    user.notes = tb_notes.Text;
                    //user.isActive = 1;
                    user.createUserId = MainWindow.userLogin.userId;
                    user.updateUserId = MainWindow.userLogin.userId;

                    int s = await user.Save(user);
                    if (s <= 0)
                        Toaster.ShowWarning(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopError"), animation: ToasterAnimation.FadeIn);
                    else
                    {
                        Toaster.ShowSuccess(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopUpdate"), animation: ToasterAnimation.FadeIn);
                        await Search();
                        if (isImgPressed)
                        {
                            int userId = s;
                            string b = await user.uploadImage(imgFileName, Md5Encription.MD5Hash("Inc-m" + userId.ToString()), userId);
                            user.image = b;
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
        {//delete
            try
            {
                HelpClass.StartAwait(grid_main);
                if (user.userId != 0)
                {
                    if ((!user.canDelete) && (user.isActive == 0))
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
                        if (user.canDelete)
                            w.contentText = MainWindow.resourcemanager.GetString("trMessageBoxDelete");
                        if (!user.canDelete)
                            w.contentText = MainWindow.resourcemanager.GetString("trMessageBoxDeactivate");
                        w.ShowDialog();
                        Window.GetWindow(this).Opacity = 1;
                        #endregion

                        if (w.isOk)
                        {
                            string popupContent = "";
                            if (user.canDelete) popupContent = MainWindow.resourcemanager.GetString("trPopDelete");
                            if ((!user.canDelete) && (user.isActive == 1)) popupContent = MainWindow.resourcemanager.GetString("trPopInActive");

                            int s = await user.Delete(user.userId, MainWindow.userLogin.userId, user.canDelete);
                            if (s < 0)
                                Toaster.ShowWarning(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopError"), animation: ToasterAnimation.FadeIn);
                            else
                            {
                                Toaster.ShowSuccess(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopDelete"), animation: ToasterAnimation.FadeIn);

                                await RefreshUsersList();
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
            user.isActive = 1;
            int s = await user.Save(user);
            if (s <= 0)
                Toaster.ShowWarning(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopError"), animation: ToasterAnimation.FadeIn);
            else
            {
                Toaster.ShowSuccess(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopActive"), animation: ToasterAnimation.FadeIn);
                await RefreshUsersList();
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
                if (users is null)
                    await RefreshUsersList();
                tgl_userState = 1;
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
                if (users is null)
                    await RefreshUsersList();
                tgl_userState = 0;
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
                p_error_password.Visibility = Visibility.Collapsed;
                p_error_email.Visibility = Visibility.Collapsed;

                HelpClass.EndAwait(grid_main);
            }
            catch (Exception ex)
            {
                HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        private async void Dg_user_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {//selection
            try
            {
                HelpClass.StartAwait(grid_main);

                if (dg_user.SelectedIndex != -1)
                {
                    user = dg_user.SelectedItem as Users;
                    this.DataContext = user;
                    if (user != null)
                    {
                        tb_code.Text = user.code;
                        cb_country.SelectedValue = user.countryId;
                        this.DataContext = user;
                        await getImg();
                        #region delete
                        if (user.canDelete)
                            btn_delete.Content = MainWindow.resourcemanager.GetString("trDelete");
                        else
                        {
                            if (user.isActive == 0)
                                btn_delete.Content = MainWindow.resourcemanager.GetString("trActive");
                            else
                                btn_delete.Content = MainWindow.resourcemanager.GetString("trInActive");
                        }
                        #endregion
                        HelpClass.getMobile(user.mobile, cb_areaMobile, tb_mobile);
                        HelpClass.getPhone(user.phone, cb_areaPhone, cb_areaPhoneLocal, tb_phone);
                        HelpClass.getPhone(user.fax, cb_areaFax, cb_areaFaxLocal, tb_fax);
                    }
                }

                HelpClass.clearValidate(requiredControlList, this);
                p_error_email.Visibility = Visibility.Collapsed;

                HelpClass.EndAwait(grid_main);
            }
            catch (Exception ex)
            {
                HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        private async void Btn_refresh_Click(object sender, RoutedEventArgs e)
        {//refresh
            try
            {
                HelpClass.StartAwait(grid_main);
                await RefreshUsersList();
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
            if (users is null)
                await RefreshUsersList();
            searchText = tb_search.Text.ToLower();
            usersQuery = users.Where(s => (s.code.ToLower().Contains(searchText) ||
            s.name.ToLower().Contains(searchText) ||
            s.mobile.ToLower().Contains(searchText)
            ) && s.isActive == tgl_userState);
            RefreshUsersView();
        }
        async Task<IEnumerable<Users>> RefreshUsersList()
        {
            users = await user.GetAll();
            users = users.Where(x => x.type != "ag");
            return users;
        }
        void RefreshUsersView()
        {
            dg_user.ItemsSource = usersQuery;
            txt_count.Text = usersQuery.Count().ToString();
        }
        #endregion

        #region validate - clearValidate - textChange - lostFocus - . . . . 
        private void Cb_country_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {//select country
            try
            {
                cb_areaMobile.SelectedIndex = cb_country.SelectedIndex;
                cb_areaFax.SelectedIndex = cb_country.SelectedIndex;
                cb_areaPhone.SelectedIndex = cb_country.SelectedIndex;
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }

        }
        void Clear()
        {
            this.DataContext = new Users();

            #region password-code
            pb_password.Clear();
            tb_passwordMirror.Clear();
            tb_code.Text = "";
            #endregion
            #region mobile-Phone-fax-country
            //cb_areaMobile.SelectedValue = MainWindow.Region.countryId;
            //cb_areaPhone.SelectedValue = MainWindow.Region.countryId;
            //cb_areaFax.SelectedValue = MainWindow.Region.countryId;
            cb_country.SelectedIndex = -1;
            cb_areaMobile.SelectedIndex = -1;
            cb_areaPhone.SelectedIndex = -1;
            cb_areaFax.SelectedIndex = -1;
            cb_areaPhoneLocal.SelectedIndex = -1;
            cb_areaFaxLocal.SelectedIndex = -1;
            tb_mobile.Clear();
            tb_phone.Clear();
            tb_fax.Clear();
            tb_email.Clear();
            #endregion
            #region image
            HelpClass.clearImg(btn_image);
            #endregion

            // last 
            HelpClass.clearValidate(requiredControlList, this);
            p_error_email.Visibility = Visibility.Collapsed;
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
                HelpClass.validate(requiredControlList,this);
                p_error_password.Visibility = Visibility.Collapsed;
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
        private async Task<bool> chkIfUserNameIsExists(string username, int uId)
        {
            bool isValid = true;
            if (users == null)
               await RefreshUsersList();
            if (users.Any(i => i.name == username && i.userId != uId && i.type != "ag"))
                isValid = false;
            if (!isValid)
                Toaster.ShowWarning(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trErrorDuplicateUserNameToolTip"), animation: ToasterAnimation.FadeIn);
            return isValid;
        }

        #region Password
        private void ValidateEmpty_PasswordChanged(object sender, RoutedEventArgs e)
        {
            try
            {
                HelpClass.validate(requiredControlList, this);
                p_error_password.Visibility = Visibility.Collapsed;
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        private void P_showPassword_MouseEnter(object sender, MouseEventArgs e)
        {
            try
            {
                tb_passwordMirror.Text = pb_password.Password;
                tb_passwordMirror.Visibility = Visibility.Visible;
                pb_password.Visibility = Visibility.Collapsed;
            }
            catch (Exception ex)
            { HelpClass.ExceptionMessage(ex, this); }
        }
        private void P_showPassword_MouseLeave(object sender, MouseEventArgs e)
        {
            try
            {
                tb_passwordMirror.Visibility = Visibility.Collapsed;
                pb_password.Visibility = Visibility.Visible;
            }
            catch (Exception ex)
            { HelpClass.ExceptionMessage(ex, this); }
        }
        private bool chkPasswordLength(string password)
        {
            bool isValid = true;

            if (password.Length < 6)
                isValid = false;

            if (!isValid)
            {
                p_error_password.Visibility = Visibility.Visible;
                #region Tooltip
                ToolTip toolTip = new ToolTip();
                toolTip.Content = MainWindow.resourcemanager.GetString("trErrorPasswordLengthToolTip");
                toolTip.Style = Application.Current.Resources["ToolTipError"] as Style;
                p_error_password.ToolTip = toolTip;
                #endregion
            }

            return isValid;
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
                            await FillCombo.fillCountriesLocal(cb_areaPhoneLocal, (int)countryid ,brd_areaPhoneLocal);
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
                          await  FillCombo.fillCountriesLocal(cb_areaFaxLocal, (int)countryid ,brd_areaFaxLocal);
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
            if (string.IsNullOrEmpty(user.image))
            {
                HelpClass.clearImg(btn_image);
            }
            else
            {
                byte[] imageBuffer = await user.downloadImage(user.image); // read this as BLOB from your DB

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
                    string tmpPath = System.IO.Path.Combine(dir, Global.TMPUsersFolder);
                    tmpPath = System.IO.Path.Combine(tmpPath, user.image);
                    openFileDialog.FileName = tmpPath;
                }
                else
                    HelpClass.clearImg(btn_image);
            }
        }
        #endregion

        private void UserControl_Unloaded(object sender, RoutedEventArgs e)
        {
            // Collect all generations of memory.
            GC.Collect();
        }

      
    }
}
