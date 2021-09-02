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

namespace AdministratorApp.View.applications
{
    /// <summary>
    /// Interaction logic for us_applications.xaml
    /// </summary>
    public partial class us_applications : UserControl
    {
        private static us_applications _instance;
        public static us_applications Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new us_applications();
                return _instance;
            }
        }
        public us_applications()
        {
            InitializeComponent();
        }
        public static List<string> menuList;
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {
                //if (sender != null)
                //    SectionData.StartAwait(grid_mainWindow);


                menuList = new List<string> { "programs", "versions", "packages" };





                //if (sender != null)
                //    SectionData.EndAwait(grid_mainWindow);
            }
            catch (Exception ex)
            {
                //if (sender != null)
                //    SectionData.EndAwait(grid_mainWindow);
                SectionData.ExceptionMessage(ex, this);
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
                                button.Background = Application.Current.Resources["LightGrey"] as SolidColorBrush;

                        }
                    }
                }
            }
        }
        private void Btn_programs_Click(object sender, RoutedEventArgs e)
        {
            //try
            //{
            Button button = sender as Button;
            colorButtonRefreash(button.Tag.ToString());
            grid_main.Children.Clear();
            grid_main.Children.Add(us_programs.Instance);
            //}
            //catch (Exception ex)
            //{
            //    SectionData.ExceptionMessage(ex, this);
            //}
        }

        private void Btn_versions_Click(object sender, RoutedEventArgs e)
        {
            //try
            //{
            Button button = sender as Button;
            colorButtonRefreash(button.Tag.ToString());
            grid_main.Children.Clear();
            //grid_main.Children.Add(us_applications.Instance);
            //}
            //catch (Exception ex)
            //{
            //    SectionData.ExceptionMessage(ex, this);
            //}
        }

        private void Btn_packages_Click(object sender, RoutedEventArgs e)
        {
            //try
            //{
            Button button = sender as Button;
            colorButtonRefreash(button.Tag.ToString());
            grid_main.Children.Clear();
            //grid_main.Children.Add(us_applications.Instance);
            //}
            //catch (Exception ex)
            //{
            //    SectionData.ExceptionMessage(ex, this);
            //}
        }
    }
}
