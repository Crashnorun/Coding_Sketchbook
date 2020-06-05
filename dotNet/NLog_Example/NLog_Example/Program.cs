using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NLog_Example
{
    class Program
    {

        public static NLog.Logger logger = NLog.LogManager.GetCurrentClassLogger();

        static void Main(string[] args)
        {
            logger.Debug("Debugging");
            logger.Error("Erroring");
            logger.Debug(new Exception("hello exception"), "Dbuging exception");

            string URL = "https://docs.google.com/spreadsheets/d/1bB4BzHTexDvW53PDTlX9nFqHLznicL7YqXP8ACFqJIs/edit#gid=0";
            Uri uriResult;
            bool result = Uri.TryCreate(URL, UriKind.Absolute, out uriResult) &&
                (uriResult.Scheme == Uri.UriSchemeHttp || uriResult.Scheme == Uri.UriSchemeHttps);

            if (!result) Console.WriteLine("URL input is not valid");

            // parse url for sheet ID
            string[] vals = new Uri(URL).Segments;

            string SheetID = string.Empty;

            foreach(string str in vals)
            {
                if (str.Length > SheetID.Length) SheetID = str;
            }
            SheetID = SheetID.Remove(SheetID.Length - 1, 1);
            

        }
    }
}
