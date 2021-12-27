using AdministratorApp.ApiClasses;
using AdministratorApp.Classes;
using netoaster;
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
    /// Interaction logic for wd_seialsList.xaml
    /// </summary>
    public partial class wd_seialsList : Window
    {
        PosSerials posSerial = new PosSerials();
        PosSerials posSerialModel = new PosSerials();
        IEnumerable<PosSerials> posSerialsQuery;
        IEnumerable<PosSerials> posSerials;
        public int packageUserID = 0;
        string txtSearch = "";
        public wd_seialsList()
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

        private async void Window_Loaded(object sender, RoutedEventArgs e)
        {//load
            try
            {
                HelpClass.StartAwait(grid_serialsList);

                #region translate
                if (MainWindow.lang.Equals("en"))
                {
                    MainWindow.resourcemanager = new ResourceManager("AdministratorApp.en_file", Assembly.GetExecutingAssembly());
                    grid_serialsList.FlowDirection = FlowDirection.LeftToRight;
                }
                else
                {
                    MainWindow.resourcemanager = new ResourceManager("AdministratorApp.ar_file", Assembly.GetExecutingAssembly());
                    grid_serialsList.FlowDirection = FlowDirection.RightToLeft;
                }
                translat();
                #endregion

                posSerials = await posSerialModel.GetByPackUserId(packageUserID);

                dg_serials.ItemsSource = posSerials;
               
                HelpClass.EndAwait(grid_serialsList);
            }
            catch (Exception ex)
            {
                HelpClass.EndAwait(grid_serialsList);
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        private void translat()
        {
            txt_title.Text = MainWindow.resourcemanager.GetString("trSerials");
            MaterialDesignThemes.Wpf.HintAssist.SetHint(txb_searchitems, MainWindow.resourcemanager.GetString("trSearchHint"));
            txt_allSerials.Text = MainWindow.resourcemanager.GetString("trSerials");
            tt_close.Content = MainWindow.resourcemanager.GetString("trClose");
            btn_save.Content = MainWindow.resourcemanager.GetString("trSave");
        }

        private void HandleKeyPress(object sender, KeyEventArgs e)
        {
            try
            {
                if (e.Key == Key.Return)
                {
                    Btn_save_Click(null, null);
                }
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

        private void Btn_colse_Click(object sender, RoutedEventArgs e)
        {//close
         //isActive = false;
            this.Close();
        }

        private void Txb_searchitems_TextChanged(object sender, TextChangedEventArgs e)
        {//search
            try
            {
                txtSearch = txb_searchitems.Text;

                posSerialsQuery = posSerials.Where(s => s.serial.Contains(txtSearch));
                dg_serials.ItemsSource = posSerialsQuery;
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        private async void Btn_save_Click(object sender, RoutedEventArgs e)
        {//save
            try
            {
                HelpClass.StartAwait(grid_serialsList);

                int isActiveCount = posSerials.Count(s => s.isActive == 1);
                PackageUser pu = new PackageUser();
                PackageUser puModel = new PackageUser();
                Packages p = new Packages();
                Packages pModel = new Packages();
                pu = await puModel.GetByID(packageUserID);
                p = await pModel.GetByID(pu.packageId.Value);
                if (isActiveCount <= p.posCount)
                {
                    await posSerialModel.UpdateList(posSerials.ToList(), MainWindow.userID);

                    Toaster.ShowSuccess(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopSave"), animation: ToasterAnimation.FadeIn);
                    
                    //isActive = true;
                    this.Close();
                }
                else
                {
                    Toaster.ShowWarning(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopError"), animation: ToasterAnimation.FadeIn);
                }


                HelpClass.EndAwait(grid_serialsList);
            }
            catch (Exception ex)
            {
                HelpClass.EndAwait(grid_serialsList);
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        private void Window_MouseDown(object sender, MouseButtonEventArgs e)
        {//mouse down
            try
            {
                DragMove();
            }
            catch (Exception ex)
            {
                //SectionData.ExceptionMessage(ex, this);
            }
        }
    }
}
