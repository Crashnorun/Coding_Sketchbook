using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Autodesk.Revit.DB;

namespace Rooms_Extract_Data
{
    public class mPoint
    {
        public double x;
        public double y;
        public double z;

        public mPoint (double x, double y, double z)
        {
            this.x = x;
            this.y = y;
            this.z = z;
        }

        public mPoint(XYZ pt)
        {
            this.x = pt.X;
            this.y = pt.Y;
            this.z = pt.Z;
        }

        public override string ToString()
        {
            return string.Format("{0},{1},{2}", this.x, this.y, this.z);
        }
    }
}
