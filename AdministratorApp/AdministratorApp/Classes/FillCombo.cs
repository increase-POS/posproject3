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
        static public async Task fillPackage(ComboBox combo)
        {
            packages = await package.GetAll();
            combo.ItemsSource = packages.Where(x => x.isActive == 1);
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


        /// <summary>
        /// User & Agent 
        /// </summary>
        static Users user = new Users();
        static IEnumerable<Users> users;
        static public async Task fillUser(ComboBox combo)
        {
            users = await user.GetAll();
            combo.ItemsSource = users.Where(x => x.isActive == 1 && x.type != "agent");
            combo.SelectedValuePath = "userId";
            combo.DisplayMemberPath = "name";
        }
        static public async Task fillAgent(ComboBox combo)
        {
            users = await user.GetAll();
            combo.ItemsSource = users.Where(x => x.isActive == 1 && x.type == "agent");
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
        /// <summary>
        /// fill user type
        /// </summary>
        #region fill user type
        static public void fillUserType(ComboBox combo)
        {
            var typelist = new[] {
                new { Text = MainWindow.resourcemanager.GetString("trAdmin")       , Value = "ad" },
                new { Text = MainWindow.resourcemanager.GetString("trEmployee")   , Value = "u" },
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

    }
}
