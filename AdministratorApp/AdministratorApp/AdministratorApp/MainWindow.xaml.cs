using AdministratorApp.Classes;
using AdministratorApp.View.applications;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Resources;
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
using WPFTabTip;

namespace AdministratorApp
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public static ResourceManager resourcemanager;
        public static ResourceManager resourcemanagerreport;
        static public MainWindow mainWindow;
        public static string lang;
        internal static User userLogin;
        public MainWindow()
        {
            try
            {
                InitializeComponent();
                mainWindow = this;
            }
            catch (Exception ex)
            {
                SectionData.ExceptionMessage(ex, this);
            }
        }
        void windowFlowDirection()
        {
            #region translate
            if (lang.Equals("en"))
            {
                resourcemanager = new ResourceManager("AdministratorApp.en_file", Assembly.GetExecutingAssembly());
                grid_mainWindow.FlowDirection = FlowDirection.LeftToRight;
            }
            else
            {
                resourcemanager = new ResourceManager("AdministratorApp.ar_file", Assembly.GetExecutingAssembly());
                grid_mainWindow.FlowDirection = FlowDirection.RightToLeft;
            }
            #endregion
        }

       public static List<string> menuList;

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {
                //if (sender != null)
                //    SectionData.StartAwait(grid_mainWindow);


               menuList = new List<string> { "applications", "sales", "reports",  
                   "sectionData","settings"};





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
    
        void colorTextRefreash(string str)
        {
            foreach (TextBlock textBlock in FindControls.FindVisualChildren<TextBlock>(this))
            {
                if (textBlock.Tag != null)
                {
                    foreach (var item in menuList)
                    {
                        if (item == textBlock.Tag.ToString())
                        {
                            if (item == str)
                            textBlock.Foreground = Application.Current.Resources["MainColor"] as SolidColorBrush;
                                else
                            textBlock.Foreground = Application.Current.Resources["LightGrey"] as SolidColorBrush;

                        }
                    }
                }
            }
        }
        void ColorIconRefreash(string str)
        {
            foreach (Path path in FindControls.FindVisualChildren<Path>(this))
            {
                if (path.Tag != null)
                {
                    foreach (var item in menuList)
                    {
                        if (item == path.Tag.ToString())
                        {
                            if (item == str)
                                path.Fill = Application.Current.Resources["MainColor"] as SolidColorBrush;
                            else
                                path.Fill = Application.Current.Resources["LightGrey"] as SolidColorBrush;

                        }
                    }
                }
            }
        }
        void openVisible(string str)
        {
            foreach (Rectangle rectangle in FindControls.FindVisualChildren<Rectangle>(this))
            {
                if (rectangle.Tag != null)
                {
                    foreach (var item in menuList)
                    {
                        if (item == rectangle.Tag.ToString())
                        {
                            if (item == str)
                                rectangle.Visibility = Visibility.Visible;
                            else
                                rectangle.Visibility = Visibility.Collapsed;

                        }
                    }
                }
            }

            
        }
       
        private void BTN_Close_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                //if (sender != null)
                //    SectionData.StartAwait(grid_mainWindow);
                Application.Current.Shutdown();

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
        private void BTN_Minimize_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                this.WindowState = System.Windows.WindowState.Minimized;
            }
            catch (Exception ex)
            {
                SectionData.ExceptionMessage(ex, this);
            }
        }
        private void Btn_applications_Click(object sender, RoutedEventArgs e)
        {
            //try
            //{
            Button button = sender as Button;
            colorTextRefreash(button.Tag.ToString());
            ColorIconRefreash(button.Tag.ToString());
            openVisible(button.Tag.ToString());
            grid_main.Children.Clear();
            grid_main.Children.Add(us_applications.Instance);
            //}
            //catch (Exception ex)
            //{
            //    SectionData.ExceptionMessage(ex, this);
            //}
        }
       
        private void Btn_sales_Click(object sender, RoutedEventArgs e)
        {
            //try
            //{
            Button button = sender as Button;
            colorTextRefreash(button.Tag.ToString());
            ColorIconRefreash(button.Tag.ToString());
            openVisible(button.Tag.ToString());
            grid_main.Children.Clear();
            //grid_main.Children.Add(uc_home.Instance);
            //}
            //catch (Exception ex)
            //{
            //    SectionData.ExceptionMessage(ex, this);
            //}
        }

        private void Btn_sectionData_Click(object sender, RoutedEventArgs e)
        {
            //try
            //{
            Button button = sender as Button;
            colorTextRefreash(button.Tag.ToString());
            ColorIconRefreash(button.Tag.ToString());
            openVisible(button.Tag.ToString());
            grid_main.Children.Clear();
            //grid_main.Children.Add(uc_home.Instance);
            //}
            //catch (Exception ex)
            //{
            //    SectionData.ExceptionMessage(ex, this);
            //}
        }

        private void Btn_reports_Click(object sender, RoutedEventArgs e)
        {
            //try
            //{
            Button button = sender as Button;
            colorTextRefreash(button.Tag.ToString());
            ColorIconRefreash(button.Tag.ToString());
            openVisible(button.Tag.ToString());
            grid_main.Children.Clear();
            //grid_main.Children.Add(uc_home.Instance);
            //}
            //catch (Exception ex)
            //{
            //    SectionData.ExceptionMessage(ex, this);
            //}
        }
        private void Btn_settings_Click(object sender, RoutedEventArgs e)
        {
            //try
            //{
            Button button = sender as Button;
            colorTextRefreash(button.Tag.ToString());
            ColorIconRefreash(button.Tag.ToString());
            openVisible(button.Tag.ToString());
            grid_main.Children.Clear();
            //grid_main.Children.Add(uc_home.Instance);
            //}
            //catch (Exception ex)
            //{
            //    SectionData.ExceptionMessage(ex, this);
            //}
        }

    }
}
