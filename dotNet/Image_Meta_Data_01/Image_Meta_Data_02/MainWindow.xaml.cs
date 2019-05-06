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

namespace Image_Meta_Data_02
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        #region References
        /*
         * https://docs.microsoft.com/en-us/dotnet/framework/winforms/controls/how-to-open-files-using-the-openfiledialog-component
         * https://docs.microsoft.com/en-us/dotnet/api/system.windows.controls.image?view=netframework-4.8
         * https://www.c-sharpcorner.com/UploadFile/mahesh/using-xaml-image-in-wpf/
         */
        #endregion

        public string FilePath;

        public MainWindow()
        {
            InitializeComponent();
        }


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
                FilePath = ofd.FileName;
                BitmapImage bitMap = new BitmapImage(new Uri(FilePath));
                imgBox.Source = bitMap;                                                 // load image
            }
        }

        private void ImgBox_Loaded(object sender, RoutedEventArgs e)
        {
            System.Drawing.Image img = System.Drawing.Image.FromFile(FilePath);
            PropertyItem[] properties = img.PropertyItems;              // read image data
            List<cls_ImageProperty> ImgProperties = new List<cls_ImageProperty>();

            foreach(PropertyItem item in properties)
            {
                cls_ImageProperty imgProp = new cls_ImageProperty();
                imgProp.Id = item.Id;
                imgProp.DataLength = item.Len;
                imgProp.DataBuffer = item.Value;


            }

            // display image data in data grid view
        }
    }
}
