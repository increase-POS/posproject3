using AdministratorApp.ApiClasses;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;

namespace AdministratorApp.Classes
{
    public class FillCombo
    {
        /// <summary>
        /// Packages
        /// </summary>
        static Packages package = new Packages();
        static IEnumerable<Packages> packages;

        static PackageUser packageUser = new PackageUser();
        static IEnumerable<PackageUser> packageUsers;

        static IEnumerable<Packages> agentPackages;

        static CountryPackageDate cpd = new CountryPackageDate();
        static IEnumerable<CountryPackageDate> countryPackageDates;
        static public async Task fillPackageUser(ComboBox combo)
        {
            packageUsers = await packageUser.GetAll();
            combo.ItemsSource = packageUsers.Where(x => x.isActive == 1);
            combo.SelectedValuePath = "packageUserId";
            combo.DisplayMemberPath = "packageSaleCode";
        }

        static public async Task fillBookNum(ComboBox combo , int customerId)
        {
            packageUsers = await packageUser.GetByCustomerId(customerId);
            foreach (var i in packageUsers)
            {
                i.packageNumber = i.packageNumber + "     " + i.packageName;
            }
            combo.ItemsSource = packageUsers.Where(x => x.isActive == 1 );
            combo.SelectedValuePath = "packageUserId";
            combo.DisplayMemberPath = "packageNumber";
            combo.SelectedIndex = -1;
        }
        static public async Task fillBookNumAgent(ComboBox combo, int customerId , int agentId)
        {
            packageUsers = await packageUser.GetByCustomerId(customerId);
            packageUsers = packageUsers.Where(p => p.userId == agentId);
            foreach (var i in packageUsers)
            {
                i.packageNumber = i.packageNumber + "     " + i.packageName;
            }
            combo.ItemsSource = packageUsers.Where(x => x.isActive == 1);
            combo.SelectedValuePath = "packageUserId";
            combo.DisplayMemberPath = "packageNumber";
            combo.SelectedIndex = -1;
        }

        static public async Task fillPackage(ComboBox combo)
        {
            packages = await package.GetAll();
            combo.ItemsSource = packages.Where(x => x.isActive == 1);
            combo.SelectedValuePath = "packageId";
            combo.DisplayMemberPath = "packageName";
            combo.SelectedIndex = -1;
        }

        static public async Task fillPackageByCustomer(ComboBox combo , int customerId)
        {
            packages = await package.GetByCustomerCountry(customerId);
            combo.ItemsSource = packages.Where(x => x.isActive == 1 );
            combo.SelectedValuePath = "packageId";
            combo.DisplayMemberPath = "packageName";
            combo.SelectedIndex = -1;
        }
        
        static public async Task fillPeriod(ComboBox combo, int customerId, int packageId)
        {
            countryPackageDates = await cpd.GetByCustomerPackId(customerId , packageId);

            foreach (CountryPackageDate cpd in countryPackageDates)
            {
                string period = "";

                period = HelpClass.getPeriod(cpd);

                cpd.notes = period + "       " + cpd.price + " " + cpd.currency;
            }
            combo.ItemsSource = countryPackageDates.Where(x => x.isActive == 1);
            combo.SelectedValuePath = "Id";
            combo.DisplayMemberPath = "notes";
            combo.SelectedIndex = -1;
        }
        static public async Task fillAgentPackage(ComboBox combo , int agentId)
        {
            agentPackages = await package.GetPackagesByAgent(agentId);
            combo.ItemsSource = agentPackages.Where(p => p.isActive == 1);
            combo.SelectedValuePath = "packageId";
            combo.DisplayMemberPath = "packageName";
        }

        /// <summary>
        /// Programs
        /// </summary>
        static Programs program = new Programs();
        static IEnumerable<Programs> programs;
        static public async Task fillProgram(ComboBox combo)
        {
            programs = await program.GetAll();
            combo.ItemsSource = programs.Where(x =>  x.isActive == 1);
            combo.SelectedValuePath = "programId";
            combo.DisplayMemberPath = "name";
        }

        /// <summary>
        /// Version
        /// </summary>
        static Versions version = new Versions();
        static IEnumerable<Versions> versions;
        static public async Task fillVersion(ComboBox combo)
        {
            versions = await version.GetAll();
            combo.ItemsSource = versions.Where(x => x.isActive == 1);
            combo.SelectedValuePath = "verId";
            combo.DisplayMemberPath = "name";
        }
        static public async Task fillVersionByProgram(ComboBox combo, int programId)
        {
            versions = await version.GetAll();
            combo.ItemsSource = versions.Where(x => x.programId == programId &&  x.isActive == 1);
            combo.SelectedValuePath = "verId";
            combo.DisplayMemberPath = "name";
        }

        /// <summary>
        /// User & Agent 
        /// </summary>
        static Users user = new Users();
        static IEnumerable<Users> users;
      
        static public async Task fillAgent(ComboBox combo)
        {
            users = await user.GetAll();
            combo.ItemsSource = users.Where(x => x.isActive == 1 && x.type == "ag");
            combo.SelectedValuePath = "userId";
            combo.DisplayMemberPath = "name";
        }

        static public async Task fillAgentByCountry(ComboBox combo , int countryID)
        {
            users = await user.GetAll();
            combo.ItemsSource = users.Where(x => x.isActive == 1 && x.type == "ag" && x.countryId == countryID);
            combo.SelectedValuePath = "userId";
            combo.DisplayMemberPath = "name";
        }
        /// <summary>
        /// Customer
        /// </summary>
        static Customers customer = new Customers();
        static IEnumerable<Customers> customers;
        static public async Task fillCustomer(ComboBox combo)
        {
            customers = await customer.GetAll();
            combo.ItemsSource = customers.Where(x => x.isActive == 1);
            combo.SelectedValuePath = "custId";
            combo.DisplayMemberPath = "custname";
        }
        static public async Task fillCustomerByAgent(ComboBox combo , int agentID)
        {
            customers = await customer.GetCustomersByAgent(agentID);
            combo.ItemsSource = customers.Where(x => x.isActive == 1);
            combo.SelectedValuePath = "custId";
            combo.DisplayMemberPath = "custname";
        }

        #region Countries
        /// <summary>
        /// area code methods
        /// </summary>
        /// <returns></returns>
        /// 
        //phone 
        public static IEnumerable<Country> countrynum;
        public static IEnumerable<City> citynum;
        public static IEnumerable<City> citynumofcountry;
        public static Country countrycodes = new Country();
        public static City cityCodes = new City();

        static public async Task<IEnumerable<Country>> RefreshCountry()
        {
           countrynum = await countrycodes.GetAll();
            return countrynum;
        }
        static public async Task<IEnumerable<City>> RefreshCity()
        {
            citynum = await cityCodes.Get();
            return citynum;
        }
        static public async Task fillCountries(ComboBox combo)
        {
            if (countrynum is null)
                await RefreshCountry();

            combo.ItemsSource = countrynum.ToList();
            combo.SelectedValuePath = "countryId";
            combo.DisplayMemberPath = "code";
        }
        static public async Task fillCountriesNames(ComboBox combo)
        {
            if (countrynum is null)
                await RefreshCountry();

            combo.ItemsSource = countrynum.ToList();
            combo.SelectedValuePath = "countryId";
            combo.DisplayMemberPath = "name";
        }
        static public async Task fillCountriesLocal(ComboBox combo , int countryid,Border border)
        {
            if (citynum is null)
                await RefreshCity();
            FillCombo.citynumofcountry = FillCombo.citynum.Where(b => b.countryId == countryid).OrderBy(b => b.cityCode).ToList();
            combo.ItemsSource = FillCombo.citynumofcountry;
            combo.SelectedValuePath = "cityId";
            combo.DisplayMemberPath = "cityCode";
            if (FillCombo.citynumofcountry.Count() > 0)
                border.Visibility = Visibility.Visible;
            else
                border.Visibility = Visibility.Collapsed;
        }
        #endregion

        #region fill user type
        static public void fillUserType(ComboBox combo)
        {
            var typelist = new[] {
                new { Text = MainWindow.resourcemanager.GetString("trAdmin")       , Value = "ad" },
                new { Text = MainWindow.resourcemanager.GetString("trEmployee")    , Value = "us" },
                 };
            combo.DisplayMemberPath = "Text";
            combo.SelectedValuePath = "Value";
            combo.ItemsSource = typelist;

        }

        #endregion

        #region fill package month
        static public void fillPackageMonth(ComboBox combo)
        {
            var typelist = new[] {
                new { Text = MainWindow.resourcemanager.GetString("trOneMonth")    , Value = "1" },
                new { Text = MainWindow.resourcemanager.GetString("trThreeMonth")  , Value = "3" },
                new { Text = MainWindow.resourcemanager.GetString("trSixMonth")    , Value = "6" },
                new { Text = MainWindow.resourcemanager.GetString("trTwelveMonth") , Value = "12" },
                new { Text = MainWindow.resourcemanager.GetString("trUnLimited")   , Value = "0" },
                 };
            combo.DisplayMemberPath = "Text";
            combo.SelectedValuePath = "Value";
            combo.ItemsSource = typelist;

        }

        #endregion

        #region fill Agent Level
        static public void fillAgentLevel(ComboBox combo)
        {
            var typelist = new[] {
                new { Text = MainWindow.resourcemanager.GetString("trVip")       , Value = "Vip" },
                new { Text = MainWindow.resourcemanager.GetString("trNormal")   , Value = "Normal" },
                 };
            combo.DisplayMemberPath = "Text";
            combo.SelectedValuePath = "Value";
            combo.ItemsSource = typelist;

        }
        #endregion

        #region fill booked
        static public void fillBooked(ComboBox combo)
        {
            var typelist = new[] {
                new { Text = MainWindow.resourcemanager.GetString("trAll")      , Value = "all" },
                new { Text = MainWindow.resourcemanager.GetString("trBooked")   , Value = "true" },
                new { Text = MainWindow.resourcemanager.GetString("trUnBooked") , Value = "false" },
                 };
            combo.DisplayMemberPath = "Text";
            combo.SelectedValuePath = "Value";
            combo.ItemsSource = typelist;

        }

        #endregion

        #region fill server state
        static public void fillServerState(ComboBox combo)
        {
            var typelist = new[] {
                new { Text = MainWindow.resourcemanager.GetString("trOnline")    , Value = "True" },
                new { Text = MainWindow.resourcemanager.GetString("trOffline")   , Value = "False" }
                 };
            combo.DisplayMemberPath = "Text";
            combo.SelectedValuePath = "Value";
            combo.ItemsSource = typelist;

        }

        #endregion

        #region fill offline activation 
        static public void fillOfflineActivation(ComboBox combo)
        {
            var typelist = new[] {
                new { Text = MainWindow.resourcemanager.GetString("trExtend")    , Value = "rn" },
                new { Text = MainWindow.resourcemanager.GetString("trUpgrade")   , Value = "up" }
                 };
            combo.DisplayMemberPath = "Text";
            combo.SelectedValuePath = "Value";
            combo.ItemsSource = typelist;

        }

        #endregion

    }
}
