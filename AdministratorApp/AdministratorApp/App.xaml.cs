using AdministratorApp.Classes;
using POS.View.windows;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;

namespace AdministratorApp
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        /*
        private void Application_Startup(object sender, StartupEventArgs e)
        {
            try
            {
                Thread.CurrentThread.CurrentCulture = new CultureInfo("en-US");
                Thread.CurrentThread.CurrentUICulture = new CultureInfo("en-US");

                //POS.Properties.Settings.Default.posId = "0";
                //if (POS.Properties.Settings.Default.posId == "0")
                //{
                //    //wd_setupOtherPos logIn = new wd_setupOtherPos();
                //    //logIn.Show();
                //    wd_setupFirstPos logIn = new wd_setupFirstPos();
                //    logIn.Show();
                //}
                //else
                //{
                //    winLogIn logIn = new winLogIn();
                //    logIn.Show();
                //}

                winLogIn logIn = new winLogIn();
                logIn.Show();

            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        */
    }
}
