using AdministratorApp.ApiClasses;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;

namespace AdministratorApp.converters
{
    class packagePeriodConverter: IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            CountryPackageDate s = value as CountryPackageDate;

            string period = "";

            if (!s.islimitDate)
                period = MainWindow.resourcemanager.GetString("trUnLimited"); 
            else
            {
                switch (s.monthCount)
                {
                    case 1: period  = MainWindow.resourcemanager.GetString("trOneMonth");    break;
                    case 3: period  = MainWindow.resourcemanager.GetString("trThreeMonth");  break;
                    case 6: period  = MainWindow.resourcemanager.GetString("trSixMonth");    break;
                    case 12: period = MainWindow.resourcemanager.GetString("trTwelveMonth"); break;
                }
            }
          
            return period;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }

    }
}
