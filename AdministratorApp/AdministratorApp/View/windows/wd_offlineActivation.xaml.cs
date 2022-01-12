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
using System.Windows.Shapes;

namespace AdministratorApp.View.windows
{
    /// <summary>
    /// Interaction logic for wd_offlineActivation.xaml
    /// </summary>
    public partial class wd_offlineActivation : Window
    {
        public wd_offlineActivation()
        {
            InitializeComponent();
        }

        public static List<string> requiredControlList;
        private void Window_MouseDown(object sender, MouseButtonEventArgs e)
        {//mouse down
            try
            {
                DragMove();
            }
            catch (Exception ex)
            {
            }
        }

        private void HandleKeyPress(object sender, KeyEventArgs e)
        {
            try
            {
                if (e.Key == Key.Return)
                {
                    //Btn_save_Click(null, null);
                }
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

                requiredControlList = new List<string> { "type" };

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
                translat();
                #endregion

                FillCombo.fillOfflineActivation(cb_type);

                HelpClass.EndAwait(grid_main);
            }
            catch (Exception ex)
            {
                HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        private void translat()
        {
            txt_title.Text = MainWindow.resourcemanager.GetString("trOfflineActivation");
            MaterialDesignThemes.Wpf.HintAssist.SetHint(cb_type, MainWindow.resourcemanager.GetString("trOfflineActivation")+"...");
            btn_download.Content = MainWindow.resourcemanager.GetString("trDownload");
            btn_upload.Content = MainWindow.resourcemanager.GetString("trUpload");
        }

        private void _validate()
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
        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            try
            {
                e.Cancel = true;
                this.Visibility = Visibility.Hidden;
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        private void Window_Unloaded(object sender, RoutedEventArgs e)
        {//unload
            GC.Collect();
        }

        private void Cb_type_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                if (cb_type.SelectedValue.ToString() == "0")
                    btn_upload.Visibility = Visibility.Collapsed;
                else
                    btn_upload.Visibility = Visibility.Visible;
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
           
        }

        private void Tb_validateEmptyLostFocus(object sender, RoutedEventArgs e)
        {
            try
            {
                _validate();
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }

      
        private void Btn_colse_Click(object sender, RoutedEventArgs e)
        {//close
            this.Close();
        }

        private void Btn_download_Click(object sender, RoutedEventArgs e)
        {//download
            try
            {
                HelpClass.StartAwait(grid_main);


                HelpClass.EndAwait(grid_main);
            }
            catch (Exception ex)
            {
                HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        private void Btn_upload_Click(object sender, RoutedEventArgs e)
        {//upload
            try
            {
                HelpClass.StartAwait(grid_main);


                HelpClass.EndAwait(grid_main);
            }
            catch (Exception ex)
            {
                HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }
        }
    }
}
