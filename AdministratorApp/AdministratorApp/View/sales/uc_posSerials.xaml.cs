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

namespace AdministratorApp.View.sales
{
    /// <summary>
    /// Interaction logic for uc_posSerials.xaml
    /// </summary>
    public partial class uc_posSerials : UserControl
    {
        private static uc_posSerials _instance;
        public static uc_posSerials Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new uc_posSerials();
                return _instance;
            }
        }
        public uc_posSerials()
        {
            InitializeComponent();
        }
    }
}
