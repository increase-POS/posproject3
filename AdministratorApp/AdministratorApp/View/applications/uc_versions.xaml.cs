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
    /// Interaction logic for uc_versions.xaml
    /// </summary>
    public partial class uc_versions : UserControl
    {
        private static uc_versions _instance;
        public static uc_versions Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new uc_versions();
                return _instance;
            }
        }
        public uc_versions()
        {
            InitializeComponent();
        }
    }
}
