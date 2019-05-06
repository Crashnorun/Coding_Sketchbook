using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Image_Meta_Data_02
{
    public class cls_ImageProperty
    {
        public int Id;
        public string PropertyValue;
        public string PropertyName;
        public int DataLength;
        public byte[] DataBuffer
        {
            set { CalculateValue(value); }
        }

        private string CalculateValue(byte[] propertyValue)
        {

            return null;
        }
    }

    /// <summary>
    /// <Reference> https://docs.microsoft.com/en-us/dotnet/framework/winforms/advanced/how-to-read-image-metadata</Reference>
    /// </summary>
    public enum ExifPropertyDataTypes : short
    {
        ByteArray = 1,
        String = 2,
        UShortArray = 3,
        ULongArray = 4,
        ULongFractionArray = 5,
        UByteArray = 6,
        LongArray = 7,
        Unused = 8,
        SLongArray = 9,
        LongFractionArray = 10,
    }
}
