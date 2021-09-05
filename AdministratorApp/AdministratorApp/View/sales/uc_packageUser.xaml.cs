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

namespace AdministratorApp.View.sales
{
    /// <summary>
    /// Interaction logic for uc_packageUser.xaml
    /// </summary>
    public partial class uc_packageUser : UserControl
    {
        private static uc_packageUser _instance;
        public static uc_packageUser Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new uc_packageUser();
                return _instance;
            }
        }
        public uc_packageUser()
        {
            InitializeComponent();
            HelpClass.defaultDatePickerStyle(dp_bookDate);
            HelpClass.defaultDatePickerStyle(dp_expireDate);
        }
    }
}
