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

namespace AdministratorApp.View.sectionData
{
    /// <summary>
    /// Interaction logic for uc_customers.xaml
    /// </summary>
    public partial class uc_customers : UserControl
    {
        private static uc_customers _instance;
        public static uc_customers Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new uc_customers();
                return _instance;
            }
        }
        public uc_customers()
        {
            InitializeComponent();
        }
    }
}
