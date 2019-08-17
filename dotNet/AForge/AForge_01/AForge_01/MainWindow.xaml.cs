﻿using System;
using System.Collections.Generic;
using System.Drawing;
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
using System.Windows.Threading;
using AForge.Imaging.Filters;

/*
 * Tutorial site: http://milindapro.blogspot.com/2016/12/simple-aforgenet-tutorial-getting-start.html
 */

namespace AForge_01
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public string filePath = @"C:\Users\Charlie\Pictures\IMG_6517_A.jpg";                      // image path

        public MainWindow()
        {
            InitializeComponent();
            ImgBox1.Source = new BitmapImage(new Uri(filePath, UriKind.Relative));              // original image

        }

        private void btnProcess_Click(object sender, RoutedEventArgs e)
        {

            string tempPath = System.IO.Path.GetTempPath();                                     // get temp path

            string tempFile = System.IO.Path.Combine(tempPath, "tempImg.jpg");                  // get full temp path
            // System.IO.File.Delete(tempFile);                                                    // delete the old file

            Grayscale filter = new Grayscale(0.2, 0.2, 0.2);                                    // create grey filter
            Bitmap img = (Bitmap)System.Drawing.Image.FromFile(filePath);                       // get image 
            Bitmap grayImage = filter.Apply(img);                                               // apply filter
            grayImage.Save(tempFile);                                                           // save new image

            ImgBox1.Source = new BitmapImage(new Uri(filePath));                                // original image
            ImgBox2.Source = new BitmapImage(new Uri(tempFile));                                // new image
            OriginalName.Text = System.IO.Path.GetFileName(filePath);
            TempName.Text = System.IO.Path.GetFileName(tempFile);
        }

    }

}
