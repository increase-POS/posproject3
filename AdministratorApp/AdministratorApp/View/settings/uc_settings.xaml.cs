using AdministratorApp.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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

namespace AdministratorApp.View.settings
{
    /// <summary>
    /// Interaction logic for uc_settings.xaml
    /// </summary>
    public partial class uc_settings : UserControl
    { 
        private static uc_settings _instance;
        public static uc_settings Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new uc_settings();
                return _instance;
            }
        }
        public uc_settings()
        {
            InitializeComponent();
        }
        public static List<string> menuList;
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {
                if (sender != null)
                    HelpClass.StartAwait(grid_mainGrid);



                menuList = new List<string> { "users" };





                if (sender != null)
                    HelpClass.EndAwait(grid_mainGrid);
            }
            catch (Exception ex)
            {
                if (sender != null)
                    HelpClass.EndAwait(grid_mainGrid);
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        void colorButtonRefreash(string str)
        {
            foreach (Button button in FindControls.FindVisualChildren<Button>(this))
            {
                if (button.Tag != null)
                {
                    foreach (var item in menuList)
                    {
                        if (item == button.Tag.ToString())
                        {
                            if (item == str)
                                button.Background = Application.Current.Resources["MainColor"] as SolidColorBrush;
                            else
                                button.Background = Application.Current.Resources["SecondColor"] as SolidColorBrush;

                        }
                    }
                }
            }
        }

        //private void Btn_permissions_Click(object sender, RoutedEventArgs e)
        //{
        //    try
        //    {
        //        Button button = sender as Button;
        //        colorButtonRefreash(button.Tag.ToString());
        //        grid_main.Children.Clear();
        //        grid_main.Children.Add(uc_permissions.Instance);
        //    }
        //    catch (Exception ex)
        //    {
        //        HelpClass.ExceptionMessage(ex, this);
        //    }
        //}
    }
}
