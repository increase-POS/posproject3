using AdministratorApp.ApiClasses;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace AdministratorApp.Classes
{
    public class FillCombo
    {
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
        /// area code methods
        /// </summary>
        /// <returns></returns>
        /// 
          #region Countries
        //phone 
        public static IEnumerable<CountryCode> countrynum;
        public static IEnumerable<City> citynum;
        public static IEnumerable<City> citynumofcountry;
        public static CountryCode countrycodes = new CountryCode();
        public static City cityCodes = new City();

        static public async Task<IEnumerable<CountryCode>> RefreshCountry()
        {
            countrynum = await countrycodes.GetAllCountries();
            return countrynum;
        }

        static public async Task<IEnumerable<City>> RefreshCity()
        {
            citynum = await cityCodes.Get();
            return citynum;
        }
        #endregion

        static public async Task fillCountries(ComboBox combo)
        {
            if (countrynum is null)
                await RefreshCountry();

            combo.ItemsSource = countrynum.ToList();
            combo.SelectedValuePath = "countryId";
            combo.DisplayMemberPath = "code";
        }
        
       
    }
}
