using AdministratorApp.Classes;
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

namespace AdministratorApp.View.reports
{
    /// <summary>
    /// Interaction logic for uc_bookReport.xaml
    /// </summary>
    public partial class uc_bookReport : UserControl
    {
        private static uc_bookReport _instance;
        public static uc_bookReport Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new uc_bookReport();
                return _instance;
            }
        }
        public uc_bookReport()
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

        private async void UserControl_Loaded(object sender, RoutedEventArgs e)
        {//load
            try
            {
                //HelpClass.StartAwait(grid_mainGrid);

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

                if (!MainWindow.userLogin.type.Equals("ag"))
                {
                    cb_countries.Visibility = Visibility.Visible;
                    await FillCombo.fillCountriesNames(cb_countries);
                    cb_agents.IsEnabled = true;
                }
                else
                {
                    cb_countries.Visibility = Visibility.Collapsed;
                    cb_agents.IsEnabled = false;
                }
                //HelpClass.EndAwait(grid_mainGrid);
            }
            catch (Exception ex)
            {
                //HelpClass.EndAwait(grid_mainGrid);
                //HelpClass.ExceptionMessage(ex, this);
            }
        }

        private void translate()
        {
        }

        private void UserControl_Unloaded(object sender, RoutedEventArgs e)
        {//unload
            GC.Collect();
        }

        private async void Cb_countries_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {//select country
            try
            {
                if (!MainWindow.userLogin.type.Equals("ag"))
                {
                    await FillCombo.fillAgent(cb_agents);
                }
                else
                {
                    cb_countries.Visibility = Visibility.Collapsed;
                    cb_agents.IsEnabled = false;
                }
                //HelpClass.EndAwait(grid_mainGrid);
            }
            catch (Exception ex)
            {
                //HelpClass.ExceptionMessage(ex, this);
            }
        }

        private void Cb_agents_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {//select agent

        }

        private void Cb_customers_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {//select customer

        }

        private void Cb_packages_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {//select package

        }

        private void Txt_search_TextChanged(object sender, TextChangedEventArgs e)
        {//search

        }

        #region reports
        private void Btn_pdf_Click(object sender, RoutedEventArgs e)
        {//pdf

        }

        private void Btn_print_Click(object sender, RoutedEventArgs e)
        {//print

        }

        private void Btn_exportToExcel_Click(object sender, RoutedEventArgs e)
        {//excel

        }

        private void Btn_preview_Click(object sender, RoutedEventArgs e)
        {//preview

        }
        #endregion
       

      
    }
}
