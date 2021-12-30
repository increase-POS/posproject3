using AdministratorApp.ApiClasses;
using AdministratorApp.Classes;
using Microsoft.Reporting.WinForms;
using Microsoft.Win32;
using netoaster;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Resources;
using System.Text;
using System.Threading;
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

                posSerialsQuery = await RefreshList();
                RefreshView();
               
                HelpClass.EndAwait(grid_serialsList);
            }
            catch (Exception ex)
            {
                HelpClass.EndAwait(grid_serialsList);
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        #region save - search - close - refresh
        private void Btn_colse_Click(object sender, RoutedEventArgs e)
        {//close
            this.Close();
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
                    int res = await posSerialModel.UpdateList(posSerials.ToList(), MainWindow.userID);

                    if (res >= 0)
                    {
                        Toaster.ShowSuccess(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopSave"), animation: ToasterAnimation.FadeIn);
                        this.Close();
                    }
                    else
                        Toaster.ShowWarning(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopError"), animation: ToasterAnimation.FadeIn);
                }
                else
                {
                    Toaster.ShowWarning(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trIsActiveCountPopError"), animation: ToasterAnimation.FadeIn);
                }


                HelpClass.EndAwait(grid_serialsList);
            }
            catch (Exception ex)
            {
                HelpClass.EndAwait(grid_serialsList);
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        private void Tb_search_TextChanged(object sender, TextChangedEventArgs e)
        {//search
            try
            {
                txtSearch = tb_search.Text;

                posSerialsQuery = posSerialsQuery.Where(s => s.serial.Contains(txtSearch));

                RefreshView();
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        private async void Btn_refresh_Click(object sender, RoutedEventArgs e)
        {//refresh
            try
            {

                HelpClass.StartAwait(grid_serialsList);

                posSerialsQuery = await RefreshList();
                RefreshView();

                HelpClass.EndAwait(grid_serialsList);
            }
            catch (Exception ex)
            {

                HelpClass.EndAwait(grid_serialsList);
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        #endregion

        #region events
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

        private void TextBox_ContextMenuOpening(object sender, ContextMenuEventArgs e)
        {
            (sender as TextBox).IsReadOnly = false;
        }

        private void TextBox_ContextMenuClosing(object sender, ContextMenuEventArgs e)
        {
            (sender as TextBox).IsReadOnly = true;
        }

        private void TextBox_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == System.Windows.Input.Key.C && Keyboard.IsKeyDown(Key.LeftCtrl) || Keyboard.IsKeyDown(Key.RightCtrl))
            {
                (sender as TextBox).IsReadOnly = false;
            }
        }

        private void TextBox_KeyDown(object sender, KeyEventArgs e)
        {
            (sender as TextBox).IsReadOnly = true;
        }

        #endregion

        #region methods
        private void translat()
        {
            txt_title.Text = MainWindow.resourcemanager.GetString("trSerials");
            MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_search, MainWindow.resourcemanager.GetString("trSearchHint"));
            tt_close.Content = MainWindow.resourcemanager.GetString("trClose");
            btn_save.Content = MainWindow.resourcemanager.GetString("trSave");

            dg_serials.Columns[0].Header = MainWindow.resourcemanager.GetString("trSerialNum");
            dg_serials.Columns[1].Header = MainWindow.resourcemanager.GetString("trIsActive");

            tt_refresh.Content = MainWindow.resourcemanager.GetString("trRefresh");
            tt_report.Content = MainWindow.resourcemanager.GetString("trPdf");
            tt_excel.Content = MainWindow.resourcemanager.GetString("trExcel");
            tt_count.Content = MainWindow.resourcemanager.GetString("trCount");
        }

        async Task<IEnumerable<PosSerials>> RefreshList()
        {
            posSerials = await posSerialModel.GetByPackUserId(packageUserID);
            return posSerials;
        }
        private void RefreshView()
        {
            dg_serials.ItemsSource = posSerialsQuery;
            txt_count.Text = dg_serials.Items.Count.ToString();
        }
        #endregion

        #region reports

        //ReportCls reportclass = new ReportCls();
        LocalReport rep = new LocalReport();
        SaveFileDialog saveFileDialog = new SaveFileDialog();
        public void BuildReport()
        {

            List<ReportParameter> paramarr = new List<ReportParameter>();

            string addpath = "";
            string firstTitle = "paymentsReport";
            string secondTitle = "";
            string subTitle = "";
            string Title = "";

            //bool isArabic = ReportCls.checkLang();
            //if (isArabic)
            //{
            //addpath = @"\Reports\StatisticReport\Accounts\Paymetns\Ar\ArVendor.rdlc";
            //secondTitle = "vendors";
            //}
            //else
            //{
            //addpath = @"\Reports\StatisticReport\Accounts\Paymetns\En\Vendor.rdlc";
            //secondTitle = "vendors";
            //}
            //string reppath = reportclass.PathUp(Directory.GetCurrentDirectory(), 2, addpath);

            //ReportCls.checkLang();
            //subTitle = clsReports.ReportTabTitle(firstTitle, secondTitle);
            Title = MainWindow.resourcemanagerreport.GetString("trAccountantReport") + " / " + subTitle;
            paramarr.Add(new ReportParameter("trTitle", Title));
            //clsReports.cashTransferStsPayment(temp, rep, reppath, paramarr);
            //clsReports.setReportLanguage(paramarr);
            //clsReports.Header(paramarr);

            rep.SetParameters(paramarr);

            rep.Refresh();
        }
        private void Btn_pdf_Click(object sender, RoutedEventArgs e)
        {//pdf
            try
            {
                HelpClass.StartAwait(grid_serialsList);

                #region
                BuildReport();

                saveFileDialog.Filter = "PDF|*.pdf;";

                if (saveFileDialog.ShowDialog() == true)
                {
                    string filepath = saveFileDialog.FileName;
                    //LocalReportExtensions.ExportToPDF(rep, filepath);
                }
                #endregion

                HelpClass.EndAwait(grid_serialsList);
            }
            catch (Exception ex)
            {
                HelpClass.EndAwait(grid_serialsList);
                HelpClass.ExceptionMessage(ex, this);
            }

        }
        private void Btn_exportToExcel_Click(object sender, RoutedEventArgs e)
        {//excel
            try
            {
                HelpClass.StartAwait(grid_serialsList);

                #region
                Thread t1 = new Thread(() =>
                {
                    BuildReport();
                    this.Dispatcher.Invoke(() =>
                    {
                        saveFileDialog.Filter = "EXCEL|*.xls;";
                        if (saveFileDialog.ShowDialog() == true)
                        {
                            string filepath = saveFileDialog.FileName;
                            // LocalReportExtensions.ExportToExcel(rep, filepath);
                        }
                    });
                });
                t1.Start();
                #endregion

                HelpClass.EndAwait(grid_serialsList);
            }
            catch (Exception ex)
            {
                HelpClass.EndAwait(grid_serialsList);
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        #endregion
    }
}
