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

namespace AdministratorApp.View.reports
{
    /// <summary>
    /// Interaction logic for uc_reports.xaml
    /// </summary>
    public partial class uc_reports : UserControl
    {
        private static uc_reports _instance;
        public static uc_reports Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new uc_reports();
                return _instance;
            }
        }
        public uc_reports()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {//load

        }

        private void UserControl_Unloaded(object sender, RoutedEventArgs e)
        {//unload

        }
    }
}
