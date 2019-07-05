using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Forms;
using System.Drawing;
using System.Drawing.Imaging;
using System.Diagnostics;

namespace Image_Meta_Data_02
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public string FilePath;

        public MainWindow()
        {
            InitializeComponent();
            dataGrid.Visibility = Visibility.Hidden;
            btnRotate.Visibility = Visibility.Hidden;
        }

        // rotate image button
        private void BtnRotate_Click(object sender, RoutedEventArgs e)
        {
            // rotate image 90 degrees with every click
            RotateTransform xform = imgBox.LayoutTransform as RotateTransform;      // extract the current rotation 
            if (xform != null)
                imgBox.LayoutTransform = new RotateTransform(xform.Angle + 90, imgBox.ActualWidth / 2, imgBox.ActualHeight / 2);
            else
                imgBox.LayoutTransform = new RotateTransform(90, imgBox.ActualWidth / 2, imgBox.ActualHeight / 2);
        }

        // load image button
        private void BtnLoad_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog()
            {
                Multiselect = false,
                Title = "Image Meta Data",
                Filter = "Images (*.BMP; *.JPG; *.PNG; *.GIF; *.TIFF) |*.BMP; *.JPG; *.PNG; *.GIF; *.TIFF"
            };
            //ofd.Multiselect = false;
            //ofd.Title = "Image Meta Data";
            //ofd.Filter = "Images (*.BMP; *.JPG; *.PNG; *.GIF; *.TIFF) |*.BMP; *.JPG; *.PNG; *.GIF; *.TIFF";

            DialogResult dr = ofd.ShowDialog();
            if (dr == System.Windows.Forms.DialogResult.OK && ofd.FileName != null)
            {
                FilePath = ofd.FileName;                                                // get the file path
                BitmapImage bitMap = new BitmapImage(new Uri(FilePath));
                imgBox.Source = bitMap;                                                 // load image

                LoadMetaData();                                                         // get meta data
            }
        }

        private void LoadMetaData()
        {
            System.Drawing.Image img = System.Drawing.Image.FromFile(FilePath);                 // read image from file
            PropertyItem[] properties = img.PropertyItems;                                      // read image data
            List<cls_ImageProperty> ImgProperties = new List<cls_ImageProperty>();
            int count = 1;

            foreach (PropertyItem item in properties)
            {
                cls_ImageProperty imgProp = new cls_ImageProperty();
                imgProp.Id = item.Id;                                                           // property id
                imgProp.DataType = (ExifPropertyDataTypes)item.Type;                            // property data type
                imgProp.DataBuffer = item.Value;                                                // property value
                imgProp.DataLength = item.Len;
                imgProp.RowNumber = count;
                imgProp.CalculateValue();                                                       // convert value to usuable info
                count++;

                Debug.Print(imgProp.Id.ToString());
                ImgProperties.Add(imgProp);
            }

            dataGrid.ItemsSource = ImgProperties;                                               // display image data in data grid view
            dataGrid.Visibility = Visibility.Visible;
            btnRotate.Visibility = Visibility.Visible;
        }

        private void DataGrid_Scroll(object sender, System.Windows.Controls.Primitives.ScrollEventArgs e)
        {

        }
      
    }
}


#region ---- REFERENCES ----
/*
 * https://docs.microsoft.com/en-us/dotnet/framework/winforms/controls/how-to-open-files-using-the-openfiledialog-component
 * https://docs.microsoft.com/en-us/dotnet/api/system.windows.controls.image?view=netframework-4.8
 * https://www.c-sharpcorner.com/UploadFile/mahesh/using-xaml-image-in-wpf/
 * https://stackoverflow.com/questions/16900291/c-sharp-image-propertyitems-metadate-how-do-you-know-which-number-is-which-pro
 * https://docs.microsoft.com/en-us/dotnet/api/system.drawing.imaging.propertyitem.id?redirectedfrom=MSDN&view=netframework-4.8#System_Drawing_Imaging_PropertyItem_Id
 * https://github.com/anton-iermolenko/Photo-library-toolkit/blob/master/PhotoLibaryToolkit/Framework/ImageConstants.cs
 */
#endregion
