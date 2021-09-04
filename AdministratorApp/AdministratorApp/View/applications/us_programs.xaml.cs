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
    /// Interaction logic for us_programs.xaml
    /// </summary>
    public partial class uc_programs : UserControl
    {
        private static uc_programs _instance;
        public static uc_programs Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new uc_programs();
                return _instance;
            }
        }
        public uc_programs()
        {
            InitializeComponent();
        }

        
    }
}
