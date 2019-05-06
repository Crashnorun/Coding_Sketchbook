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
        public string PropertyValue
        {
            get { return CalculateValue(); }
            set { }
        }
        public string PropertyName;
        public Type PropertyType;
        public ExifPropertyDataTypes DataType;
        public int DataLength;
        public byte[] DataBuffer;

        private string CalculateValue()
        {

            string result = "";
            int num_items, item_size;

            switch (DataType)
            {
                case ExifPropertyDataTypes.ByteArray:
                case ExifPropertyDataTypes.UByteArray:
                    PropertyValue = BitConverter.ToString(DataBuffer);
                    break;

                case ExifPropertyDataTypes.String:
                    PropertyValue = Encoding.UTF8.GetString(DataBuffer, 0, DataLength - 1);
                    break;

                case ExifPropertyDataTypes.UShortArray:
                    result = "";
                    item_size = 2;
                    num_items = DataLength / item_size;
                    for (int i = 0; i < num_items; i++)
                    {
                        ushort value = BitConverter.ToUInt16(DataBuffer, i * item_size);
                        result += ", " + value.ToString();
                    }
                    if (result.Length > 0) result = result.Substring(2);
                    PropertyValue = "[" + result + "]";
                    break;

                case ExifPropertyDataTypes.ULongArray:
                    result = "";
                    item_size = 4;
                    num_items = DataLength / item_size;
                    for (int i = 0; i < num_items; i++)
                    {
                        uint value = BitConverter.ToUInt32(DataBuffer, i * item_size);
                        result += ", " + value.ToString();
                    }
                    if (result.Length > 0) result = result.Substring(2);
                    PropertyValue = "[" + result + "]";
                    break;

                case ExifPropertyDataTypes.ULongFractionArray:
                    result = "";
                    item_size = 8;
                    num_items = DataLength / item_size;
                    for (int i = 0; i < num_items; i++)
                    {
                        uint numerator = BitConverter.ToUInt32(DataBuffer, i * item_size);
                        uint denominator = BitConverter.ToUInt32(DataBuffer, i * item_size + item_size / 2);
                        result += ", " + numerator.ToString() + "/" + denominator.ToString();
                    }
                    if (result.Length > 0) result = result.Substring(2);
                    PropertyValue = "[" + result + "]";
                    break;

                case ExifPropertyDataTypes.LongArray:
                    result = "";
                    item_size = 4;
                    num_items = DataLength / item_size;
                    for (int i = 0; i < num_items; i++)
                    {
                        int value = BitConverter.ToInt32(DataBuffer, i * item_size);
                        result += ", " + value.ToString();
                    }
                    if (result.Length > 0) result = result.Substring(2);
                    PropertyValue = "[" + result + "]";
                    break;

                case ExifPropertyDataTypes.LongFractionArray:
                    result = "";
                    item_size = 8;
                    num_items = DataLength / item_size;
                    for (int i = 0; i < num_items; i++)
                    {
                        int numerator = BitConverter.ToInt32(DataBuffer, i * item_size);
                        int denominator = BitConverter.ToInt32(DataBuffer, i * item_size + item_size / 2);
                        result += ", " + numerator.ToString() + "/" + denominator.ToString();
                    }
                    if (result.Length > 0) result = result.Substring(2);
                    PropertyValue = "[" + result + "]";
                    break;
            }




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
