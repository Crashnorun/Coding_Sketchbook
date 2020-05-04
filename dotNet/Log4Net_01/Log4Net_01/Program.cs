using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

[assembly: log4net.Config.XmlConfigurator(Watch =true)]

namespace Log4Net_01
{
    class Program
    {
        // good pratice is to create a logger for each class and name the logger the same as the class. The class name can be hard coded or can use reflection
        // private static readonly log4net.ILog log = log4net.LogManager.GetLogger("Program.cs");
         private static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        // private static readonly log4net.ILog log = LogHelper.GetLogger();               // this will return the full file path where the class file was compiled


        static void Main(string[] args)
        {

            Console.WriteLine("Hello world");

            log.Debug("Developer: Tuttorial example");
            log.Info("Maintenance: water under the bridge");
            log.Warn("Maintenance: water is hot");

            var i = 0;

            try
            {
                var x = 10 / i;          
            }
            catch (DivideByZeroException ex)
            {
                log.Error("Developer: tried to divide by zero", ex);
            }

            log.Fatal("Maintenance: water is bad");

            Console.ReadLine();
        }
    }
}



/*
 * References: 
 * https://www.youtube.com/watch?v=2lAdQ_QwNww
 * https://www.codeproject.com/Articles/140911/log-net-Tutorial
 * Log4net documentation: https://logging.apache.org/log4net/
 * Config examples: https://logging.apache.org/log4net/release/config-examples.html
 * SQL Example: https://www.c-sharpcorner.com/article/configure-log4net-with-database-tutorial-for-beginners/
 * SQL example video: https://www.youtube.com/watch?v=sBgfLluBkX0
 * 
 * Steps:
 * 1. Add nuget package
 * 2. Modify config file
 * 3. Add assembly reference
 * 4. Add log property
 * 5. Use logger
 */
