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

        private void Window_MouseDown(object sender, MouseButtonEventArgs e)
        {

        }

        private void HandleKeyPress(object sender, KeyEventArgs e)
        {

        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {//load

            FillCombo.fillOfflineActivation(cb_type);
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {

        }

        private void Window_Unloaded(object sender, RoutedEventArgs e)
        {//unload

        }

        private void Cb_type_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (cb_type.SelectedValue.ToString() == "0")
                btn_upload.Visibility = Visibility.Collapsed;
            else
                btn_upload.Visibility = Visibility.Visible;
        }

        private void Tb_validateEmptyLostFocus(object sender, RoutedEventArgs e)
        {

        }

        private void Btn_save_Click(object sender, RoutedEventArgs e)
        {//save

        }

        private void Btn_colse_Click(object sender, RoutedEventArgs e)
        {//close

        }
    }
}
