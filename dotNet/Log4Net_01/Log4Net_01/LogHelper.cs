using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace Log4Net_01
{
    public class LogHelper
    {

        public static log4net.ILog GetLogger([CallerFilePath]string filename = "")
        {
            // this will return the full file path where the class file was compiled
            return log4net.LogManager.GetLogger(filename);
        }

    }
}
