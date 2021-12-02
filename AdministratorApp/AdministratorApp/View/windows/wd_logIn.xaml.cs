﻿using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Reflection;
using System.Resources;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using AdministratorApp.ApiClasses;
using AdministratorApp.Classes;

namespace AdministratorApp.View.windows
{
    /// <summary>
    /// Interaction logic for wd_logIn.xaml
    /// </summary>
    public partial class wd_logIn : Window
    {
        BrushConverter brushConverter = new BrushConverter();
        //public static string lang = "en";
        bool logInProcessing = false;
        Users userModel = new Users();
        Users user = new Users();
        public wd_logIn()
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

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {//load
            try
            {
                HelpClass.StartAwait(grid_main);

                bdrLogIn.RenderTransform = Animations.borderAnimation(-100, bdrLogIn, true);

                #region properties
                if (Properties.Settings.Default.userName != string.Empty)
                {
                    txtUserName.Text = Properties.Settings.Default.userName;
                    txtPassword.Password = Properties.Settings.Default.password;
                   // MainWindow.lang = "en";
                    MainWindow.lang = Properties.Settings.Default.Lang;
                    //menuIsOpen = Properties.Settings.Default.menuIsOpen;
                    cbxRemmemberMe.IsChecked = true;

                }
                else
                {
                    txtUserName.Clear();
                    txtPassword.Clear();
                    MainWindow.lang = "en";
                    //menuIsOpen = "close";
                    cbxRemmemberMe.IsChecked = false;
                }
                #endregion

                #region translate
                if (MainWindow.lang.Equals("en"))
                {
                    MainWindow.resourcemanager = new ResourceManager("AdministratorApp.en_file", Assembly.GetExecutingAssembly());
                    grid_main.FlowDirection = FlowDirection.LeftToRight;
                    //bdr_imageAr.Visibility = Visibility.Hidden;
                    //bdr_image.Visibility = Visibility.Visible;
                }
                else
                {
                    MainWindow.resourcemanager = new ResourceManager("AdministratorApp.ar_file", Assembly.GetExecutingAssembly());
                    grid_main.FlowDirection = FlowDirection.RightToLeft;
                    //bdr_imageAr.Visibility = Visibility.Visible;
                    //bdr_image.Visibility = Visibility.Hidden;
                }
                translate();
                #endregion

                #region Arabic Number
                CultureInfo ci = CultureInfo.CreateSpecificCulture(Thread.CurrentThread.CurrentCulture.Name);
                ci.NumberFormat.DigitSubstitution = DigitShapes.Context;
                Thread.CurrentThread.CurrentCulture = ci;
                #endregion

                HelpClass.EndAwait(grid_main);

                if (txtUserName.Text.Equals(""))
                    Keyboard.Focus(txtUserName);
                else if (txtPassword.Password.Equals(""))
                    Keyboard.Focus(txtPassword);
              
            }
            catch (Exception ex)
            {
                HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        private void HandleKeyPress(object sender, KeyEventArgs e)
        {
            try
            {
                if (e.Key == Key.Return)
                {
                    btnLogIn_Click(btnLogIn, null);
                }
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        private void Window_MouseDown(object sender, MouseButtonEventArgs e)
        {
            try
            {
                DragMove();
            }
            catch (Exception)
            { }
        }

       
        private async void btnLogIn_Click(object sender, RoutedEventArgs e)
        {//log in
            try
            {
                if (!logInProcessing)
                {
                    logInProcessing = true;
                    
                    HelpClass.StartAwait(grid_main);

                    HelpClass.clearValidate(p_errorUserName);
                    HelpClass.clearValidate(p_errorPassword);

                    string password = Md5Encription.MD5Hash("Inc-m" + txtPassword.Password);
                    string userName = txtUserName.Text;
                    
                    user = await userModel.Getloginuser(userName, password);

                    if (user.accountName == null)
                    {
                        //user does not exist
                        HelpClass.showTextBoxValidate(txtUserName, p_errorUserName, tt_errorUserName, "trUserNotFound");
                    }
                    else
                    {
                        if (user.userId == 0)
                        {
                            //wrong password
                            HelpClass.showPasswordValidate(txtPassword, p_errorPassword, tt_errorPassword, "trWrongPassword");
                        }
                        else
                        {
                            //correct
                            //send user info to main window
                            MainWindow.userID = user.userId;
                            MainWindow.userLogin = user;

                            #region check if menu is open
                            //try
                            //{
                            //    string m = await SectionData.getUserMenuIsOpen(user.userId);
                            //    if (!m.Equals("-1"))
                            //        MainWindow.menuIsOpen = m;
                            //    else
                            //        MainWindow.menuIsOpen = "close";
                            //    menuIsOpen = MainWindow.menuIsOpen;
                            //}
                            //catch
                            //{
                            //    MainWindow.menuIsOpen = "close";
                            //    menuIsOpen = MainWindow.menuIsOpen;
                            //}
                            #endregion

                            //make user online
                            user.isOnline = 1;

                            int s = await userModel.Save(user);

                            #region remember me
                            if (cbxRemmemberMe.IsChecked.Value)
                            {
                                Properties.Settings.Default.userName = txtUserName.Text;
                                Properties.Settings.Default.password = txtPassword.Password;
                                Properties.Settings.Default.Lang = MainWindow.lang;
                                //Properties.Settings.Default.menuIsOpen = menuIsOpen;
                            }
                            else
                            {
                                Properties.Settings.Default.userName = "";
                                Properties.Settings.Default.password = "";
                                Properties.Settings.Default.Lang = "";
                                //Properties.Settings.Default.menuIsOpen = "";
                            }
                            Properties.Settings.Default.Save();
                            #endregion

                            MainWindow main = new MainWindow();
                            main.Show();
                            this.Close();
                        }
                    }

                    HelpClass.EndAwait(grid_main);
                    logInProcessing = false;
                }
            }
            catch (Exception ex)
            {
                HelpClass.EndAwait(grid_main);
                logInProcessing = false;
                HelpClass.ExceptionMessage(ex, this);
            }

        }

        private void btnClose_Click(object sender, RoutedEventArgs e)
        {//close
            try
            {
                Application.Current.Shutdown();
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }

      
        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            // Collect all generations of memory.
            GC.Collect();

        }

        #region validate
        private void validateEmpty(object sender, RoutedEventArgs e)
        {
            try
            {
                if (sender.GetType().Name == "TextBox")
                {
                    if (txtUserName.Text.Equals(""))
                        HelpClass.showTextBoxValidate(txtUserName, p_errorUserName, tt_errorUserName, "trEmptyUserNameToolTip");
                }
                else if (sender.GetType().Name == "PasswordBox")
                {
                    if (txtPassword.Password.Equals(""))
                        HelpClass.showPasswordValidate(txtPassword, p_errorPassword, tt_errorPassword, "trEmptyPasswordToolTip");
                }
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        private void validateTextChanged(object sender, TextChangedEventArgs e)
        {
            clearValidate(p_errorUserName);
            txtUserName.Background = (Brush)brushConverter.ConvertFrom("#f8f8f8");
        }
        private void validatePasswordChanged(object sender, RoutedEventArgs e)
        {
            clearValidate(p_errorPassword);
            txtPassword.Background = (Brush)brushConverter.ConvertFrom("#f8f8f8");
        }


        private void P_showPassword_MouseEnter(object sender, MouseEventArgs e)
        {
            try
            {
                txtShowPassword.Text = txtPassword.Password;
                txtShowPassword.Visibility = Visibility.Visible;
                txtPassword.Visibility = Visibility.Collapsed;
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        private void P_showPassword_MouseLeave(object sender, MouseEventArgs e)
        {
            try
            {
                txtShowPassword.Visibility = Visibility.Collapsed;
                txtPassword.Visibility = Visibility.Visible;
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        #endregion

        #region methods
        private void translate()
        {
            cbxRemmemberMe.Content = MainWindow.resourcemanager.GetString("trRememberMe");
            MaterialDesignThemes.Wpf.HintAssist.SetHint(txtUserName, MainWindow.resourcemanager.GetString("trUserName"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(txtPassword, MainWindow.resourcemanager.GetString("trPassword"));
            txt_logIn.Text = MainWindow.resourcemanager.GetString("trLogIn");
            txt_close.Text = MainWindow.resourcemanager.GetString("trClose");
        }
        private void clearValidate(Path p)
        {
            try
            {
                HelpClass.clearValidate(p);
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        #region get language from database
        /*
        List<UserSetValues> usValues = new List<UserSetValues>();
        private async Task<string> getUserLanguage(int userId)
        {
            SettingCls setModel = new SettingCls();
            SettingCls set = new SettingCls();
            SetValues valueModel = new SetValues();
            List<SetValues> languages = new List<SetValues>();
            UserSetValues usValueModel = new UserSetValues();
            var lanSettings = await setModel.GetAll();
            set = lanSettings.Where(l => l.name == "language").FirstOrDefault<SettingCls>();
            var lanValues = await valueModel.GetAll();

            if (lanValues.Count > 0)
            {
                languages = lanValues.Where(vl => vl.settingId == set.settingId).ToList<SetValues>();

                usValues = await usValueModel.GetAll();
                if (usValues.Count > 0)
                {
                    var curUserValues = usValues.Where(c => c.userId == userId);

                    if (curUserValues.Count() > 0)
                    {
                        foreach (var l in curUserValues)
                            if (languages.Any(c => c.valId == l.valId))
                            {
                                usLanguage = l;
                            }

                        var lan = await valueModel.GetByID(usLanguage.valId.Value);
                        return lan.value;
                    }
                    else return "en";
                }
                else return "en";
            }
            else return "en";
        }
        */
        #endregion

        #endregion



    }
}
