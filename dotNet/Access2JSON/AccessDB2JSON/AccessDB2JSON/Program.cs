using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Office.Interop.Access;
using System.Data.OleDb;

/// <summary>
/// <references>
/// https://docs.microsoft.com/en-us/previous-versions/office/troubleshoot/office-developer/automate-access-using-visual-c
/// https://www.c-sharpcorner.com/article/read-microsoft-access-database-in-C-Sharp/
/// https://stackoverflow.com/questions/17086726/c-sharp-query-with-space-in-sqlt-table
/// </references>
/// </summary>



namespace AccessDB2JSON
{
    class Program
    {
        static void Main(string[] args)
        {
            string FilePath = @"C:\Users\cportelli\Documents\Professional\TT Projects\Glass Library\Glass Database.accdb";
            //string ConnectionStrng = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" | DataDirectory |\Glass Database.accdb"";
            string ConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + FilePath;

            AccessDB(FilePath, ConnectionString);

            Console.ReadKey();
        }


        static void AccessDB(string FilePath, string ConnectionString)
        {
            //Access.Application oAccess = null;
            //oAccess = new Access.ApplictionClass();
            //oAccess.OpenCurrentDatabase(FilePath, true);

            string str = "select * from [Glass Samples]";

            OleDbConnection conn = new OleDbConnection(ConnectionString);

            OleDbCommand cmd = new OleDbCommand(str, conn);
            conn.Open();

            using (OleDbDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    Console.WriteLine("Company: " + reader["Company"] + " Name: " + reader["Name"] + " Label: " + reader["Label"]);
                }
            }
        }

    }
}
