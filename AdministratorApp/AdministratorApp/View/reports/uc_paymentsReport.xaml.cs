using AdministratorApp.ApiClasses;
using AdministratorApp.Classes;
using LiveCharts;
using LiveCharts.Helpers;
using LiveCharts.Wpf;
using Microsoft.Reporting.WinForms;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Globalization;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace AdministratorApp.View.reports
{
    /// <summary>
    /// Interaction logic for uc_paymentsReport.xaml
    /// </summary>
    public partial class uc_paymentsReport : UserControl
    {
        IEnumerable<PaymentsSts> paymentSts;
        IEnumerable<PaymentsSts> paymentStsQuery;
        Statistics statisticsModel = new Statistics();
        string searchText = "";

        public uc_paymentsReport()
        {
            InitializeComponent();
        }

        private static uc_paymentsReport _instance;
        public static uc_paymentsReport Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new uc_paymentsReport();
                return _instance;
            }
        }

        private async void UserControl_Loaded(object sender, RoutedEventArgs e)
        {//load
         //try
         //{
         //HelpClass.StartAwait(grid_mainGrid);

            #region translate
            if (MainWindow.lang.Equals("en"))
            {
                MainWindow.resourcemanager = new ResourceManager("AdministratorApp.en_file", Assembly.GetExecutingAssembly());
                grid_main.FlowDirection = FlowDirection.LeftToRight;
            }
            else
            {
                MainWindow.resourcemanager = new ResourceManager("AdministratorApp.ar_file", Assembly.GetExecutingAssembly());
                grid_main.FlowDirection = FlowDirection.RightToLeft;
            }
            translate();
            #endregion

            if (!MainWindow.userLogin.type.Equals("ag"))
            {
                cb_countries.Visibility = Visibility.Visible;
                await FillCombo.fillCountriesNames(cb_countries);
                cb_agents.IsEnabled = true;
            }
            else
            {
                dpnl_country.Visibility = Visibility.Collapsed;
                var typelist = new[] {
                                            new { Text  = MainWindow.userLogin.accountName ,
                                                  Value = MainWindow.userLogin.userId        }
                                         };
                cb_agents.DisplayMemberPath = "Text";
                cb_agents.SelectedValuePath = "Value";
                cb_agents.ItemsSource = typelist;
                cb_agents.SelectedIndex = 0;
                cb_agents.IsEnabled = false;
                chk_allAgents.Visibility = Visibility.Hidden;
            }

            await Search();

            //HelpClass.EndAwait(grid_mainGrid);
            //}
            //catch (Exception ex)
            //{
            //HelpClass.EndAwait(grid_mainGrid);
            //HelpClass.ExceptionMessage(ex, this);
            //}
        }

        private async void Txt_search_TextChanged(object sender, TextChangedEventArgs e)
        {//search
         //try
         //{
            await Search();
            //}
            //catch (Exception ex)
            //{
            //    HelpClass.ExceptionMessage(ex, this);
            //}
        }

        private void UserControl_Unloaded(object sender, RoutedEventArgs e)
        {//unload
            GC.Collect();
        }

        #region methods
        async Task Search()
        {
            if (paymentSts is null)
                await RefreshPaymentSTSList();

            searchText = txt_search.Text.ToLower();
            paymentStsQuery = paymentSts
                .Where(s =>
            (
            s.countryName.ToLower().Contains(searchText)
            ||
            s.agentAccountName.ToString().ToLower().Contains(searchText)
            ||
            s.customerName.ToString().ToLower().Contains(searchText)
            ||
            s.packageName.ToString().ToLower().Contains(searchText)
            )
            &&
            //start date
            (dp_startDate.SelectedDate != null ? s.updateDatePo >= dp_startDate.SelectedDate : true)
            &&
            //end date            
            (dp_endDate.SelectedDate != null ? s.updateDatePo <= dp_endDate.SelectedDate : true)
            &&
            //country
            (cb_countries.SelectedIndex != -1 ? s.countryId == (int)cb_countries.SelectedValue : true)
            &&
            //agent
            (cb_agents.SelectedIndex != -1 ? s.userId == (int)cb_agents.SelectedValue : true)
             &&
            //customer
            (cb_customers.SelectedIndex != -1 ? s.customerId == (int)cb_customers.SelectedValue : true)
              &&
            //package
            (cb_packages.SelectedIndex != -1 ? s.packageId == (int)cb_packages.SelectedValue : true)
            )
            ;
            RefreshpaymentStsView();
        }


        void RefreshpaymentStsView()
        {
            dg_book.ItemsSource = paymentStsQuery;
            txt_count.Text = dg_book.Items.Count.ToString();
            fillColumnChart();
            fillPieChart();
            fillRowChart();
        }
        async Task<IEnumerable<PaymentsSts>> RefreshPaymentSTSList()
        {
            paymentSts = await statisticsModel.GetAllPayments();

            return paymentSts;
        }

        private void translate()
        {
            txt_tabTitle.Text = MainWindow.resourcemanager.GetString("trBook");

            MaterialDesignThemes.Wpf.HintAssist.SetHint(cb_countries, MainWindow.resourcemanager.GetString("trCountryHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(cb_agents, MainWindow.resourcemanager.GetString("trAgentHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(cb_customers, MainWindow.resourcemanager.GetString("trCustomerHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(cb_packages, MainWindow.resourcemanager.GetString("trPackageHint"));

            chk_allCountries.Content = MainWindow.resourcemanager.GetString("trAll");
            chk_allAgents.Content = MainWindow.resourcemanager.GetString("trAll");
            chk_allCustomers.Content = MainWindow.resourcemanager.GetString("trAll");
            chk_allPackages.Content = MainWindow.resourcemanager.GetString("trAll");

            MaterialDesignThemes.Wpf.HintAssist.SetHint(dp_startDate, MainWindow.resourcemanager.GetString("trStartDateHint"));
            MaterialDesignThemes.Wpf.HintAssist.SetHint(dp_endDate, MainWindow.resourcemanager.GetString("trEndDateHint"));

            MaterialDesignThemes.Wpf.HintAssist.SetHint(txt_search, MainWindow.resourcemanager.GetString("trSearchHint"));

            //dg_book.Columns[0].Header = MainWindow.resourcemanager.GetString("trNO");
            //dg_book.Columns[1].Header = MainWindow.resourcemanager.GetString("trBookDate");
            //dg_book.Columns[2].Header = MainWindow.resourcemanager.GetString("trUpgradeDate");
            //dg_book.Columns[3].Header = MainWindow.resourcemanager.GetString("trPackage");
            //dg_book.Columns[4].Header = MainWindow.resourcemanager.GetString("trAgent");
            //dg_book.Columns[5].Header = MainWindow.resourcemanager.GetString("trCustomer");
            //dg_book.Columns[6].Header = MainWindow.resourcemanager.GetString("trPrice");
            /*
             public string packageNumber { get; set; }//1- Book num
             public Nullable<System.DateTime> bookDate { get; set; }//2- Book Date
             public Nullable<System.DateTime> createDatePo { get; set; }//3-Upgrade Date
             public string packageName { get; set; }//4-Package Name
             public string agentName { get; set; }// 5- Agent name 
             public string agentAccountName { get; set; }//5- Agent AccountName
             public string agentLastName { get; set; }//5- Agent LastName
             public string customerName { get; set; }// 6- customer Name
             public string customerLastName { get; set; }// 6- customer LastName
             public decimal Price { get; set; }//7- price
             */
            tt_report.Content = MainWindow.resourcemanager.GetString("trPdf");
            tt_print.Content = MainWindow.resourcemanager.GetString("trPrint");
            tt_excel.Content = MainWindow.resourcemanager.GetString("trExcel");
            tt_count.Content = MainWindow.resourcemanager.GetString("trCount");
            tt_refresh.Content = MainWindow.resourcemanager.GetString("trRefresh");
        }
        private void chkAll(string _name, bool isChk)
        {
            List<ComboBox> cbList = new List<ComboBox>();
            List<CheckBox> chkList = new List<CheckBox>();
            switch (_name)
            {
                case "chk_allCountries":
                    cbList = new List<ComboBox>() { cb_countries, cb_agents, cb_customers, cb_packages };
                    chkList = new List<CheckBox>() { chk_allAgents, chk_allCustomers, chk_allPackages };
                    break;
                case "chk_allAgents":
                    cbList = new List<ComboBox>() { cb_agents, cb_customers, cb_packages };
                    chkList = new List<CheckBox>() { chk_allCustomers, chk_allPackages };
                    break;
                case "chk_allCustomers":
                    cbList = new List<ComboBox>() { cb_customers, cb_packages };
                    chkList = new List<CheckBox>() { chk_allPackages };
                    break;
                case "chk_allPackages":
                    cbList = new List<ComboBox>() { cb_packages };
                    chkList = new List<CheckBox>();
                    break;
            }
            foreach (var c in cbList)
            {
                c.IsEnabled = !isChk;
                c.SelectedIndex = -1;
            }
            foreach (var ch in chkList)
            {
                ch.IsEnabled = !isChk;
            }
        }
        #endregion

        #region events
        private async void Btn_refresh_Click(object sender, RoutedEventArgs e)
        {//refresh
         //try
         //{
            await RefreshPaymentSTSList();
            //if (!MainWindow.userLogin.type.Equals("ag"))
            //{
            //    cb_countries.SelectedIndex = -1;
            //    cb_agents.SelectedIndex = -1;
            //}
            cb_customers.SelectedIndex = -1;
            cb_packages.SelectedIndex = -1;
            await Search();
            //}
            //catch (Exception ex)
            //{
            //    HelpClass.ExceptionMessage(ex, this);
            //}
        }
        private async void Dp_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {//date
         //try
         //{
            await Search();
            //}
            //catch (Exception ex)
            //{
            //    HelpClass.ExceptionMessage(ex, this);
            //}
        }
        private async void Cb_countries_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {//select country
         //try
         //{
            if (cb_countries.SelectedIndex != -1)
                await FillCombo.fillAgentByCountry(cb_agents, (int)cb_countries.SelectedValue);
            else
            {
                cb_agents.IsEnabled = false;
                cb_agents.SelectedIndex = -1;
            }
            await Search();
            //}
            //catch (Exception ex)
            //{
            //    HelpClass.ExceptionMessage(ex, this);
            //}
        }

        private async void Cb_agents_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {//select agent
         //try
         //{
            if (cb_agents.SelectedIndex != -1)
                await FillCombo.fillCustomerByAgent(cb_customers, (int)cb_agents.SelectedValue);

            await Search();
            //}
            //catch (Exception ex)
            //{
            //    HelpClass.ExceptionMessage(ex, this);
            //}
        }

        private async void Cb_customers_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {//select customer
         //try
         //{
            if (cb_customers.SelectedIndex != -1)
                await FillCombo.fillPackageByCustomer(cb_packages, (int)cb_customers.SelectedValue);

            await Search();
            //}
            //catch (Exception ex)
            //{
            //    HelpClass.ExceptionMessage(ex, this);
            //}
        }

        private async void Cb_packages_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {//select package
         //try
         //{
            if (cb_agents.SelectedIndex != -1)
                paymentSts = await statisticsModel.GetPaymentsByAgentId((int)cb_agents.SelectedValue);

            await Search();
            //}
            //catch (Exception ex)
            //{
            //    HelpClass.ExceptionMessage(ex, this);
            //}
        }

        private void Chk_Checked(object sender, RoutedEventArgs e)
        {
            //try
            //{
            string name = ((CheckBox)sender).Name;
            chkAll(name, true);
            //}
            //catch (Exception ex)
            //{
            //    HelpClass.ExceptionMessage(ex, this);
            //}
        }

        private void Chk_Unchecked(object sender, RoutedEventArgs e)
        {
            //try
            //{
            string name = ((CheckBox)sender).Name;
            chkAll(name, false);
            //}
            //catch (Exception ex)
            //{
            //    HelpClass.ExceptionMessage(ex, this);
            //}
        }
        #endregion

        #region charts
        private void fillColumnChart()
        {
            //axcolumn.Labels = new List<string>();
            //List<string> names = new List<string>();
            //List<PaymentsSts> resultList = new List<PaymentsSts>();

           
            //resultList = res.GroupBy(x => new { x.customerId , x.packageId }).Select(x => new PaymentsSts
            //{
            //    customerId = x.FirstOrDefault().customerId,
            //    customerName = x.FirstOrDefault().customerName + " " + x.FirstOrDefault().customerLastName,
            //    packageId = x.FirstOrDefault().packageId,
            //    totalnet = x.FirstOrDefault().totalnet
            //    totalnet = x.Sum(g => (decimal)g.totalnet)
            //}
            //).ToList();

            //var tempName = res.GroupBy(s => new { s.customerId }).Select(s => new
            //{
            //    customerName = s.FirstOrDefault().customerName,
            //});
            //names.AddRange(tempName.Select(nn => nn.customerName));

            //SeriesCollection columnChartData = new SeriesCollection();
            //List<decimal> paid = new List<decimal>();

            //for (int i = 0; i < xCount; i++)
            //{
            //}
            //    int xCount = 6;
            //if (names.Count() <= 6)
            //    xCount = names.Count();
            //for (int i = 0; i < xCount; i++)
            //{
            //    paid.Add(resultList.ToList().Skip(i).FirstOrDefault().totalnet);

            //    axcolumn.Labels.Add(names.ToList().Skip(i).FirstOrDefault());
            //}
            ////   if (resultList.Count() > 6)
            ////   {
            ////       decimal cashSum = 0, cardSum = 0, docSum = 0, chequeSum = 0, balanceSum = 0, invoiceSum = 0;
            ////       for (int i = 6; i < resultList.Count; i++)
            ////       {
            ////           cashSum = cashSum + resultList.ToList().Skip(i).FirstOrDefault().cashTotal;
            ////           cardSum = cardSum + resultList.ToList().Skip(i).FirstOrDefault().cardTotal;
            ////           docSum = docSum + resultList.ToList().Skip(i).FirstOrDefault().docTotal;
            ////           chequeSum = chequeSum + resultList.ToList().Skip(i).FirstOrDefault().chequeTotal;
            ////           invoiceSum = invoiceSum + resultList.ToList().Skip(i).FirstOrDefault().invoiceTotal;
            ////       }
            ////       if (!((cashSum == 0) && (cardSum == 0) && (docSum == 0) && (chequeSum == 0) && (chequeSum == 0) && (balanceSum == 0) && (invoiceSum == 0)))
            ////       {
            ////           cash.Add(cashSum);
            ////           card.Add(cardSum);
            ////           doc.Add(docSum);
            ////           cheque.Add(chequeSum);
            ////           invoice.Add(invoiceSum);

            ////           axcolumn.Labels.Add(MainWindow.resourcemanager.GetString("trOthers"));
            ////       }
            ////   }
            ////   columnChartData.Add(
            ////   new StackedColumnSeries
            ////   {
            ////       Values = cash.AsChartValues(),
            ////       DataLabels = true,
            ////       Title = MainWindow.resourcemanager.GetString("trCash")
            ////   });
            ////   columnChartData.Add(
            ////   new StackedColumnSeries
            ////   {
            ////       Values = card.AsChartValues(),
            ////       DataLabels = true,
            ////       Title = MainWindow.resourcemanager.GetString("trAnotherPaymentMethods")
            ////   });
            ////   columnChartData.Add(
            ////   new StackedColumnSeries
            ////   {
            ////       Values = doc.AsChartValues(),
            ////       DataLabels = true,
            ////       Title = MainWindow.resourcemanager.GetString("trDocument")
            ////   });
            ////   columnChartData.Add(
            ////new StackedColumnSeries
            ////{
            ////    Values = cheque.AsChartValues(),
            ////    DataLabels = true,
            ////    Title = MainWindow.resourcemanager.GetString("trCheque")
            ////});

            ////   columnChartData.Add(
            ////new StackedColumnSeries
            ////{
            ////    Values = invoice.AsChartValues(),
            ////    DataLabels = true,
            ////    Title = MainWindow.resourcemanager.GetString("trInv")
            ////});

            ////   DataContext = this;
            ////   cartesianChart.Series = columnChartData;
        }

        private void fillPieChart()
        {
            List<string> titles = new List<string>();
            IEnumerable<int> x = null;

            titles.Clear();
            int count = 0;

            var result = paymentStsQuery.GroupBy(s => new { s.customerId }).Select(s => new
            {
                customerId = s.Key.customerId,
                customerName = s.FirstOrDefault().customerName+" "+ s.FirstOrDefault().customerLastName,
                count = s.Count()
            });
            titles.AddRange(result.Select(jj => jj.customerName));

            x = result.Select(m => m.count);

            count = titles.Count();

            SeriesCollection piechartData = new SeriesCollection();

            int xCount = 6;
            if (count < 6) xCount = count;

            for (int i = 0; i < xCount; i++)
            {
                List<decimal> final = new List<decimal>();
                final.Add(x.ToList().Skip(i).FirstOrDefault());
                piechartData.Add(
                 new PieSeries
                 {
                     Values = final.AsChartValues(),
                     Title = titles.Skip(i).FirstOrDefault(),
                     DataLabels = true,
                 }
             );
            }
            if (count > 6)
            {
                List<decimal> final = new List<decimal>();
                final.Add(x.ToList().Skip(6).FirstOrDefault());
                piechartData.Add(
                new PieSeries
                {
                    Values = final.AsChartValues(),
                    Title = MainWindow.resourcemanager.GetString("trOthers"),
                    DataLabels = true,
                }
            );
            }

            chart1.Series = piechartData;
        }
        private void fillRowChart()
        {
            int endYear = DateTime.Now.Year;
            int startYear = endYear - 1;
            int startMonth = DateTime.Now.Month;
            int endMonth = startMonth;
            if (dp_startDate.SelectedDate != null && dp_endDate.SelectedDate != null)
            {
                startYear  = dp_startDate.SelectedDate.Value.Year;
                endYear    = dp_endDate.SelectedDate.Value.Year;
                startMonth = dp_startDate.SelectedDate.Value.Month;
                endMonth   = dp_endDate.SelectedDate.Value.Month;
            }
            MyAxis.Labels = new List<string>();
            List<string> names = new List<string>();
            List<int> ids = new List<int>();
            List<PaymentsSts> resultList = new List<PaymentsSts>();

            SeriesCollection rowChartData = new SeriesCollection();
            var temp = paymentStsQuery.GroupBy(s => new { s.agentId }).Select(s => new
            {
                Date = s.FirstOrDefault().updateDatePo,///////////?????????????????????????
                Name = s.FirstOrDefault().agentName +" "+ s.FirstOrDefault().agentLastName,
                Id = s.FirstOrDefault().agentId
            });
            names.AddRange(temp.Select(nn => nn.Name.ToString()));
            ids.AddRange(temp.Select(nn => nn.Id.Value));

            int xCount = 6;
            if (temp.Count() < 6) xCount = temp.Count();
            for (int i = 0; i < xCount; i++)
            {
                #region
                SeriesCollection columnChartData = new SeriesCollection();
                List<decimal> paySum = new List<decimal>();

                if (endYear - startYear <= 1)
                {
                    for (int year = startYear; year <= endYear; year++)
                    {
                        for (int month = startMonth; month <= 12; month++)
                        {
                            var firstOfThisMonth = new DateTime(year, month, 1);
                            var firstOfNextMonth = firstOfThisMonth.AddMonths(1);
                            var drawSum = paymentStsQuery.ToList().Where(c => c.updateDatePo > firstOfThisMonth && c.updateDatePo <= firstOfNextMonth && c.agentId == ids[i]).Select(c => c.totalnet).Sum();

                            paySum.Add(drawSum);

                            MyAxis.Labels.Add(CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(month) + "/" + year);

                            if (year == endYear && month == endMonth)
                            {
                                break;
                            }
                            if (month == 12)
                            {
                                startMonth = 1;
                                break;
                            }
                        }
                    }
                }
                else
                {
                    for (int year = startYear; year <= endYear; year++)
                    {
                        var firstOfThisYear = new DateTime(year, 1, 1);
                        var firstOfNextMYear = firstOfThisYear.AddYears(1);
                        var drawSum = paymentStsQuery.ToList().Where(c => c.updateDatePo > firstOfThisYear && c.updateDatePo <= firstOfNextMYear).Select(c => c.totalnet).Sum();

                        paySum.Add(drawSum);
                        MyAxis.Labels.Add(year.ToString());
                    }
                }
                rowChartData.Add(
                new LineSeries
                {
                    Values = paySum.AsChartValues(),
                    //Title = MainWindow.resourcemanager.GetString("trPayments")
                    Title = names[i]

                });
                #endregion
            }
            if (temp.Count() > 6)
            {
                
                #region
                SeriesCollection columnChartData = new SeriesCollection();
                List<decimal> paySum = new List<decimal>();
                decimal drawSum = 0;
                if (endYear - startYear <= 1)
                    {
                        for (int year = startYear; year <= endYear; year++)
                        {
                            for (int month = startMonth; month <= 12; month++)
                            {
                                for (int i = 6; i < temp.Count(); i++)
                                {
                                    var firstOfThisMonth = new DateTime(year, month, 1);
                                    var firstOfNextMonth = firstOfThisMonth.AddMonths(1);
                                    drawSum = paymentStsQuery.ToList().Where(c => c.updateDatePo > firstOfThisMonth && c.updateDatePo <= firstOfNextMonth && c.agentId == ids[i]).Select(c => c.totalnet).Sum();
                                }
                                paySum.Add(drawSum);
                                MyAxis.Labels.Add(CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(month) + "/" + year);

                                if (year == endYear && month == endMonth)
                                {
                                    break;
                                }
                                if (month == 12)
                                {
                                    startMonth = 1;
                                    break;
                                }
                            }
                        }
                    }
                    else
                    {
                        for (int year = startYear; year <= endYear; year++)
                        {
                            for (int i = 6; i < temp.Count(); i++)
                            {
                                var firstOfThisYear = new DateTime(year, 1, 1);
                                var firstOfNextMYear = firstOfThisYear.AddYears(1);
                                drawSum = paymentStsQuery.ToList().Where(c => c.updateDatePo > firstOfThisYear && c.updateDatePo <= firstOfNextMYear).Select(c => c.totalnet).Sum();
                            }
                            paySum.Add(drawSum);
                            MyAxis.Labels.Add(year.ToString());
                        }
                    }


                rowChartData.Add(
                new LineSeries
                {
                    Values = paySum.AsChartValues(),
                    Title = MainWindow.resourcemanager.GetString("trOthers")
                }
                );
                    #endregion

            }
            DataContext = this;
            rowChart.Series = rowChartData;
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
        {///pdf
            try
            {
                HelpClass.StartAwait(grid_main);

                #region
                BuildReport();

                saveFileDialog.Filter = "PDF|*.pdf;";

                if (saveFileDialog.ShowDialog() == true)
                {
                    string filepath = saveFileDialog.FileName;
                    //LocalReportExtensions.ExportToPDF(rep, filepath);
                }
                #endregion

                HelpClass.EndAwait(grid_main);
            }
            catch (Exception ex)
            {
                HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }


        }

        private void Btn_print_Click(object sender, RoutedEventArgs e)
        {//print
            try
            {
                HelpClass.StartAwait(grid_main);

                #region

                BuildReport();
                //LocalReportExtensions.PrintToPrinterbyNameAndCopy(rep, MainWindow.rep_printer_name, short.Parse(MainWindow.rep_print_count));

                #endregion

                HelpClass.EndAwait(grid_main);
            }
            catch (Exception ex)
            {
                HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }

        }

        private void Btn_exportToExcel_Click(object sender, RoutedEventArgs e)
        {//excel
            try
            {
                HelpClass.StartAwait(grid_main);

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

                HelpClass.EndAwait(grid_main);
            }
            catch (Exception ex)
            {
                HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        private void Btn_preview_Click(object sender, RoutedEventArgs e)
        {//preview
            try
            {
                HelpClass.StartAwait(grid_main);

                #region
                Window.GetWindow(this).Opacity = 0.2;
                string pdfpath = "";

                pdfpath = @"\Thumb\report\temp.pdf";
                //pdfpath = reportclass.PathUp(Directory.GetCurrentDirectory(), 2, pdfpath);

                BuildReport();

                //LocalReportExtensions.ExportToPDF(rep, pdfpath);
                //wd_previewPdf w = new wd_previewPdf();
                //w.pdfPath = pdfpath;
                //if (!string.IsNullOrEmpty(w.pdfPath))
                //{
                //w.ShowDialog();
                //w.wb_pdfWebViewer.Dispose();
                //}
                Window.GetWindow(this).Opacity = 1;
                #endregion

                HelpClass.EndAwait(grid_main);
            }
            catch (Exception ex)
            {
                HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }

        }
        #endregion

      
    }
}
