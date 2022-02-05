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

namespace AdministratorApp.View.settings.emailGeneral
{
    /// <summary>
    /// Interaction logic for uc_emailGeneral.xaml
    /// </summary>
    public partial class uc_emailGeneral : UserControl
    {
        public uc_emailGeneral()
        {
            InitializeComponent();
        }
        private static uc_emailGeneral _instance;
        public static uc_emailGeneral Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new uc_emailGeneral();
                return _instance;
            }
        }

        private void UserControl_Unloaded(object sender, RoutedEventArgs e)
        {
            // Collect all generations of memory.
            GC.Collect();
        }

        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {//load
            try
            {
                if (sender != null)
                    HelpClass.StartAwait(grid_main);
                //MainWindow.mainWindow.initializationMainTrack(this.Tag.ToString(), 1);

                #region translate
                if (MainWindow.lang.Equals("en"))
                {
                    //MainWindow.resourcemanager = new ResourceManager("POS.en_file", Assembly.GetExecutingAssembly());
                    grid_main.FlowDirection = FlowDirection.LeftToRight;
                }
                else
                {
                    //MainWindow.resourcemanager = new ResourceManager("POS.ar_file", Assembly.GetExecutingAssembly());
                    grid_main.FlowDirection = FlowDirection.RightToLeft;
                }

                translate();
                #endregion

                if (sender != null)
                    HelpClass.EndAwait(grid_main);
            }
            catch (Exception ex)
            {
                if (sender != null)
                    HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        private void translate()
        {
            txt_emailsSettingInfo.Text = MainWindow.resourcemanager.GetString("trEmailSettings");
            txt_emailsSettingHint.Text = MainWindow.resourcemanager.GetString("trEmailSettings") + "...";

            txt_emailsTamplatesInfo.Text = MainWindow.resourcemanager.GetString("trEmailTemplates");
            txt_emailsTamplatesHint.Text = MainWindow.resourcemanager.GetString("trEmailTemplates") + "...";
        }
        private void Btn_emailsSetting_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (sender != null)
                    HelpClass.StartAwait(grid_main);

                uc_emailsSetting uc = new uc_emailsSetting();
                sc_main.Visibility = Visibility.Collapsed;
                main.Children.Add(uc);

                if (sender != null)
                    HelpClass.EndAwait(grid_main);
            }
            catch (Exception ex)
            {
                if (sender != null)
                    HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        private void Btn_emailsTamplates_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (sender != null)
                    HelpClass.StartAwait(grid_main);

                uc_emailTemplates uc = new uc_emailTemplates();
                sc_main.Visibility = Visibility.Collapsed;
                main.Children.Add(uc);

                if (sender != null)
                    HelpClass.EndAwait(grid_main);
            }
            catch (Exception ex)
            {
                if (sender != null)
                    HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }
        }
    }
}
