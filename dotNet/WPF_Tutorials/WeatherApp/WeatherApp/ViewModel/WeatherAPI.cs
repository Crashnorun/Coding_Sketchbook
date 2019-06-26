using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using WeatherApp.Model;

namespace WeatherApp.ViewModel
{
   public class WeatherAPI
    {
        public const string API_KEY = "F5sxbCUCAtgSEEgMlNWAcbs5loJAgNea";
        public const string CITY = "349727";
        public const string BASE_URL = "http://dataservice.accuweather.com/forecasts/v1/daily/5day/{1}?apikey={0}";

        public async Task<WeatherAPIResponce> GetWeatherInformationAsync(string CityID)
        {
            WeatherAPIResponce result = new WeatherAPIResponce();

            string url = string.Format(BASE_URL, API_KEY, CityID);

            using(HttpClient client = new HttpClient())
            {
                var responce = await client.GetAsync(url);
                string json = await responce.Content.ReadAsStringAsync();
                result = JsonConvert.DeserializeObject<WeatherAPIResponce>(json);
            }

            return result;
        }
    }
}
