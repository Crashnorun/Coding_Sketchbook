using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Reflection;


namespace NLog_Example
{
    public class MathFunctions
    {

        public static NLog.Logger logger = NLog.LogManager.GetCurrentClassLogger();

        /// <summary>
        /// Add two numbers together
        /// </summary>
        /// <param name="Num1">First number</param>
        /// <param name="Num2">Second number</param>
        /// <returns>Result value</returns>
        public static double Add(double Num1, double Num2)
        {
            Program.InvokeMethod(MethodBase.GetCurrentMethod(), Num1, Num2);

            if (Num1 == double.NaN)
            {
                logger.Error("Num1 is invalid");
                throw new ArgumentException("Num1 is not valid input");
            }
            if (Num2 == double.NaN)
            {
                logger.Error("Num2 is invalid");
                throw new ArgumentException("Num2 is not valid input");
            }

            double result = Num1 + Num2;

            return result;
        }


        /// <summary>
        /// Subtract Num1 from Num2
        /// </summary>
        /// <param name="Num1">First number</param>
        /// <param name="Num2">Second number</param>
        /// <returns>Result value</returns>
        public static double Subtract(double Num1, double Num2)
        {
            Program.InvokeMethod(MethodBase.GetCurrentMethod(), Num1, Num2);

            if (Num1 == double.NaN)
            {
                logger.Error("Num1 is invalid");
                throw new ArgumentException("Num1 is not valid input");
            }
            if (Num2 == double.NaN)
            {
                logger.Error("Num2 is invalid");
                throw new ArgumentException("Num2 is not valid input");
            }

            double result = Num1 - Num2;

            Program.InvokeMethod(MethodBase.GetCurrentMethod(), Num1, Num2);
            return result;
        }


        /// <summary>
        /// Divide two numbers
        /// </summary>
        /// <param name="Num1"></param>
        /// <param name="Num2"></param>
        /// <returns></returns>
        public static double Divide(double Num1, double Num2)
        {
            Program.InvokeMethod(MethodBase.GetCurrentMethod(), Num1, Num2);

            if (Num1 == double.NaN)
            {
                logger.Error("Num1 is invalid");
                throw new ArgumentException("Num1 is not valid input");
            }
            if (Num2 == double.NaN)
            {
                logger.Error("Num2 is invalid");
                throw new ArgumentException("Num2 is not valid input");
            }

            double x = 0;

            try { x = Num1 / Num2; }
            catch (DivideByZeroException ex) { logger.Error("Developer: tried to divide by zero", ex); }

            return x;
        }



        public static double Add(List<int> Nums)
        {
            Program.InvokeMethod(MethodBase.GetCurrentMethod(), Nums);
            int Value = 0;

            foreach (int n in Nums)
                Value += n;


            return Value;
        }

    }
}
