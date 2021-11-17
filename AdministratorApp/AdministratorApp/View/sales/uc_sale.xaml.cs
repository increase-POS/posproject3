using AdministratorApp.ApiClasses;
using AdministratorApp.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Resources;
using System.Text;
using System.Text.RegularExpressions;
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
    /// Interaction logic for uc_sale.xaml
    /// </summary>
    public partial class uc_sale : UserControl
    {
        public uc_sale()
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
        private static uc_sale _instance;
        public static uc_sale Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new uc_sale();
                return _instance;
            }
        }
        Packages package = new Packages();
        IEnumerable<Packages> packages;
        byte tgl_packageState;
        string searchText = "";
        public static List<string> requiredControlList;
        PackageUser packuser = new PackageUser();
        PackageUser packuserModel = new PackageUser();
        private async void UserControl_Loaded(object sender, RoutedEventArgs e)
        {//load
            try
            {
                HelpClass.StartAwait(grid_main);
                requiredControlList = new List<string> { "package", "count"};

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
                await FillCombo.fillPackage(cb_package);
                await FillCombo.fillAgent(cb_agent);
                await FillCombo.fillCustomer(cb_customer);

                translate();
                await RefreshPackagesList();
                Clear();

                HelpClass.EndAwait(grid_main);
            }
            catch (Exception ex)
            {

                HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        private void translate()
        {
            //txt_active.Text = MainWindow.resourcemanager.GetString("trActive");
            //MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_search, MainWindow.resourcemanager.GetString("trSearchHint"));
            //txt_packageHeader.Text = MainWindow.resourcemanager.GetString("trPackages");
            //txt_baseInformation.Text = MainWindow.resourcemanager.GetString("trBaseInformation");
            //MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_code, MainWindow.resourcemanager.GetString("trCodeHint"));
            //MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_name, MainWindow.resourcemanager.GetString("trNameHint"));
            //txt_isActive.Text = MainWindow.resourcemanager.GetString("trActive");
            //txt_details.Text = MainWindow.resourcemanager.GetString("trDetails");

            //MaterialDesignThemes.Wpf.HintAssist.SetHint(cb_discountType, MainWindow.resourcemanager.GetString("trTypeDiscountHint"));
            //MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_discountValue, MainWindow.resourcemanager.GetString("trDiscountValueHint"));
            //MaterialDesignThemes.Wpf.HintAssist.SetHint(dp_startDate, MainWindow.resourcemanager.GetString("trStartDateHint"));
            //MaterialDesignThemes.Wpf.HintAssist.SetHint(dp_endDate, MainWindow.resourcemanager.GetString("trEndDateHint"));
            //TextBox tbStart = (TextBox)tp_startTime.Template.FindName("PART_TextBox", tp_startTime);
            //MaterialDesignThemes.Wpf.HintAssist.SetHint(tbStart, MainWindow.resourcemanager.GetString("trStartTimeHint"));
            //TextBox tbEnd = (TextBox)tp_endTime.Template.FindName("PART_TextBox", tp_endTime);
            //MaterialDesignThemes.Wpf.HintAssist.SetHint(tbEnd, MainWindow.resourcemanager.GetString("trEndTimeHint"));
            //MaterialDesignThemes.Wpf.HintAssist.SetHint(tb_note, MainWindow.resourcemanager.GetString("trNoteHint"));

            //txt_addButton.Text = MainWindow.resourcemanager.GetString("trAdd");
            //txt_updateButton.Text = MainWindow.resourcemanager.GetString("trUpdate");
            //txt_deleteButton.Text = MainWindow.resourcemanager.GetString("trDelete");
            //tt_add_Button.Content = MainWindow.resourcemanager.GetString("trAdd");
            //tt_update_Button.Content = MainWindow.resourcemanager.GetString("trUpdate");
            //tt_delete_Button.Content = MainWindow.resourcemanager.GetString("trDelete");

            //dg_package.Columns[0].Header = MainWindow.resourcemanager.GetString("trCode");
            //dg_package.Columns[1].Header = MainWindow.resourcemanager.GetString("trName");
            //dg_package.Columns[2].Header = MainWindow.resourcemanager.GetString("trValue");
            //dg_package.Columns[3].Header = MainWindow.resourcemanager.GetString("trStartDate");
            //dg_package.Columns[4].Header = MainWindow.resourcemanager.GetString("trEndDate");

            //tt_startTime.Content = MainWindow.resourcemanager.GetString("trStartTime");
            //tt_endTime.Content = MainWindow.resourcemanager.GetString("trEndTime");

            //tt_clear.Content = MainWindow.resourcemanager.GetString("trClear");
            //tt_refresh.Content = MainWindow.resourcemanager.GetString("trRefresh");
            //tt_report.Content = MainWindow.resourcemanager.GetString("trPdf");
            //tt_print.Content = MainWindow.resourcemanager.GetString("trPrint");
            //tt_excel.Content = MainWindow.resourcemanager.GetString("trExcel");
            //tt_pieChart.Content = MainWindow.resourcemanager.GetString("trPieChart");
            //tt_count.Content = MainWindow.resourcemanager.GetString("trCount");
            //btn_items.Content = MainWindow.resourcemanager.GetString("trItems");

        }
        #region Add - Update - Delete - activate  
        private async void Btn_add_Click(object sender, RoutedEventArgs e)
        {//add
            try
            {
                /*
                HelpClass.StartAwait(grid_main);
                package = new Packages();
                if (validate())
                {
                    package.packageCode = "pk-0000009";
                    package.packageName = tb_packageName.Text;
                    package.details = tb_details.Text;
                    package.programId = (int)cb_program.SelectedValue;
                    package.verId = (int)cb_version.SelectedValue;
                    package.price = decimal.Parse(tb_price.Text);
                    package.branchCount = int.Parse(tb_branchCount.Text);
                    package.posCount = int.Parse(tb_posCount.Text);
                    package.userCount = int.Parse(tb_userCount.Text);
                    package.vendorCount = int.Parse(tb_vendorCount.Text);
                    package.customerCount = int.Parse(tb_customerCount.Text);
                    package.itemCount = int.Parse(tb_itemCount.Text);
                    package.salesInvCount = int.Parse(tb_salesInvCount.Text);
                    package.storeCount = int.Parse(tb_storeCount.Text);
                    package.islimitDate = (bool)tgl_islimitDate.IsChecked;
                    if (dp_endDate.SelectedDate != null)
                        package.endDate = dp_endDate.SelectedDate.Value;
                    else package.endDate = null;
                    package.notes = tb_notes.Text;
                    package.isActive = 1;
                    package.createUserId = MainWindow.userLogin.userId;
                    package.updateUserId = MainWindow.userLogin.userId;

                    int s = int.Parse(await package.Save(package));
                    if (s <= 0)
                        Toaster.ShowWarning(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopError"), animation: ToasterAnimation.FadeIn);
                    else
                    {
                        Toaster.ShowSuccess(Window.GetWindow(this), message: MainWindow.resourcemanager.GetString("trPopAdd"), animation: ToasterAnimation.FadeIn);
                        Clear();
                        await RefreshPackagesList();
                        await Search();
                    }
                }

                HelpClass.EndAwait(grid_main);
                */
            }
            catch (Exception ex)
            {

                HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        #endregion
        #region events
        private void Cb_package_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                HelpClass.StartAwait(grid_main);
                //selection

                if (cb_package.SelectedIndex != -1)
                {
                    package = cb_package.SelectedItem as Packages;
                    this.DataContext = package;
                    if (package != null)
                    {



                    }
                }

                HelpClass.EndAwait(grid_main);
            }
            catch (Exception ex)
            {

                HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        private void Btn_clear_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                HelpClass.StartAwait(grid_main);
                Clear();
                HelpClass.EndAwait(grid_main);
            }
            catch (Exception ex)
            {

                HelpClass.EndAwait(grid_main);
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        #endregion
        #region Refresh & Search
        async Task<IEnumerable<Packages>> RefreshPackagesList()
        {
            packages = await package.GetAll();
            return packages;
        }
        #endregion
        #region validate - clearValidate - textChange - lostFocus - . . . . 
        void Clear()
        {
            this.DataContext = new Packages();
            clearValidate();
        }
        private void Number_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            try
            {
                //only  digits
                TextBox textBox = sender as TextBox;
                HelpClass.InputJustNumber(ref textBox);
                Regex regex = new Regex("[^0-9]+");
                e.Handled = regex.IsMatch(e.Text);
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        private void Code_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            try
            {
                //only english and digits
                Regex regex = new Regex("^[a-zA-Z0-9. -_?]*$");
                if (!regex.IsMatch(e.Text))
                    e.Handled = true;
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }

        }
        private void Spaces_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            try
            {
                e.Handled = e.Key == Key.Space;
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        private void ValidateEmpty_TextChange(object sender, TextChangedEventArgs e)
        {
            try
            {
                validate();
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        private void validateEmpty_LostFocus(object sender, RoutedEventArgs e)
        {
            try
            {
                validate();
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        bool validate()
        {
            bool isValid = true;
            try
            {
                foreach (var control in requiredControlList)
                {
                    TextBox textBox = FindControls.FindVisualChildren<TextBox>(this).Where(x => x.Name == "tb_" + control)
                        .FirstOrDefault();
                    Path path = FindControls.FindVisualChildren<Path>(this).Where(x => x.Name == "p_error_" + control)
                        .FirstOrDefault();
                    Border border = FindControls.FindVisualChildren<Border>(this).Where(x => x.Name == "brd_" + control)
                         .FirstOrDefault();
                    if (textBox != null && path != null)
                        if (!HelpClass.validateEmpty(textBox.Text, path))
                            isValid = false;
                }
                foreach (var control in requiredControlList)
                {
                    ComboBox comboBox = FindControls.FindVisualChildren<ComboBox>(this).Where(x => x.Name == "cb_" + control)
                        .FirstOrDefault();
                    Path path = FindControls.FindVisualChildren<Path>(this).Where(x => x.Name == "p_error_" + control)
                        .FirstOrDefault();
                    Border border = FindControls.FindVisualChildren<Border>(this).Where(x => x.Name == "brd_" + control)
                         .FirstOrDefault();
                    if (comboBox != null && path != null)
                        if (!HelpClass.validateEmpty(comboBox.Text, path))
                            isValid = false;
                }
            }
            catch { }
            return isValid;
        }
        void clearValidate()
        {
            try
            {
                foreach (var control in requiredControlList)
                {
                    Path path = FindControls.FindVisualChildren<Path>(this).Where(x => x.Name == "p_error_" + control)
                        .FirstOrDefault();
                    if (path != null)
                        HelpClass.clearValidate(path);
                }
            }
            catch { }
        }

        #endregion

        private async void Btn_add_Click_1(object sender, RoutedEventArgs e)
        {
            int msg =0;
        
          packuser.packageId=int.Parse(cb_package.SelectedValue.ToString());
            packuser.userId = int.Parse(cb_agent.SelectedValue.ToString());
            if(cb_customer.SelectedValue != null)
            packuser.customerId = int.Parse(cb_customer.SelectedValue.ToString());
            packuser.createUserId = MainWindow.userID;
            packuser.packageNumber = "pos12";
            packuser.isActive = 1;
            /*
            pkuitem.createUserId = 1;
            pkuitem.packageId = 1;
            pkuitem.notes = "notee";
            pkuitem.customerServerCode = "cc";
            pkuitem.packageSaleCode = "ca";
            //  pkuitem.packageNumber="p1" ;
            pkuitem.userId = 1;
            pkuitem.customerId =4;
            pkuitem.isActive = 1;
            pkuitem.isBooked = 1;
          pkuitem.expireDate =DateTime.Now;
            pkuitem.packageNumber = "p11";
            msg = pkumodel.save(pkuitem);
             * */


            //pkuitem.customerId = 4;
            //  pkuitem.isActive = 1;
            // pkuitem.isBooked = 1;
            // pkuitem.expireDate = DateTime.Now;

            msg = await packuserModel.MultiSave(packuser,int.Parse(tb_count.Text));

            MessageBox.Show(msg.ToString());

        }
    }
}
