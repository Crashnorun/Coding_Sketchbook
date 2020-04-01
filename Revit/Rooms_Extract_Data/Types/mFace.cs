using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace mTypes
{
   public class mFace
    {
        public List<mLine> Lines { get; set; }
        public List<mCurve> Curves { get; set; }

        public mFace() {
            Lines = new List<mLine>();
            Curves = new List<mCurve>();
        }
    }
}
