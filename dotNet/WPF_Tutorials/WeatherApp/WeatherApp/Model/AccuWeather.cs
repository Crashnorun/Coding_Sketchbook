using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WeatherApp.Model
{
    public class Headline
    {
        public DateTime EffectiveDate { get; set; }
        public int EffectiveEpochDate { get; set; }
        public int Severity { get; set; }
        public string Text { get; set; }
        public string Category { get; set; }
        public DateTime EndDate { get; set; }
        public int EndEpochDate { get; set; }
        public string MobileLink { get; set; }
        public string Link { get; set; }
    }

    public class TemperatureValue : INotifyPropertyChanged
    {

        private int val;
        public int Value {
            get { return val; }
            set {
                val = value;
                OnPropertyChanged("Value");
            }
        }

        private string unit;
        public string Unit {
            get { return unit; }
            set {
                unit = value;
                OnPropertyChanged("Unit");
            }
        }

        public int unitType;
        public int UnitType {
            get { return unitType; }
            set {
                unitType = value;
                OnPropertyChanged("UnitType");
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;

        private void OnPropertyChanged (string PropertyName)
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(PropertyName));
        }
    }

    public class Minimum : TemperatureValue { }

    public class Maximum : TemperatureValue { }

    public class Temperature
    {
        public Minimum Minimum { get; set; }
        public Maximum Maximum { get; set; }
    }

    public class Forecast : INotifyPropertyChanged
    {
        public int Icon { get; set; }

        private string iconPhrase;
        public string IconPhrase {
            get { return iconPhrase; }

            set {
                iconPhrase = value;
                OnPropertyChanged("IconPhrase");
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;

        private void OnPropertyChanged(string PropertyName)
        {
            if(PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(PropertyName));
        }

        // public bool HasPrecipitation { get; set; }
        // public string PrecipitationType { get; set; }
        // public string PrecipitationIntensity { get; set; }
    }

    public class Day : Forecast { }

    public class Night : Forecast { }

    public class DailyForecast
    {
        public DateTime Date { get; set; }
        //  public int EpochDate { get; set; }
        public Temperature Temperature { get; set; }
        public Day Day { get; set; }
        public Night Night { get; set; }
        // public IList<string> Sources { get; set; }
        // public string MobileLink { get; set; }
        // public string Link { get; set; }
    }

    public class WeatherAPIResponce
    {
        //  public Headline Headline { get; set; }
        public IList<DailyForecast> DailyForecasts { get; set; }
    }


}
