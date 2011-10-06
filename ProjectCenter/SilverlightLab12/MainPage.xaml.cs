using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;


namespace SilverlightLab12
{
    public partial class MainPage : UserControl
    {
        public MainPage()
        {
            InitializeComponent();
            image1.Visibility = System.Windows.Visibility.Collapsed;
            image2.Visibility = System.Windows.Visibility.Collapsed;
        }

        private void button1_Click(object sender, RoutedEventArgs e)
        {

            image1.Visibility = System.Windows.Visibility.Visible;
            image2.Visibility = System.Windows.Visibility.Collapsed;
            image1.Width = MaxWidth;
            image1.Height = MaxHeight;
            button2.Visibility = System.Windows.Visibility.Collapsed;
            button1.HorizontalAlignment = System.Windows.HorizontalAlignment.Center;



        }

        private void button2_Click(object sender, RoutedEventArgs e)
        {
            image2.Visibility = System.Windows.Visibility.Visible;
            image1.Visibility = System.Windows.Visibility.Collapsed;
            image2.Width = MaxWidth;
            image2.Height = MaxHeight;
            //image2.HorizontalAlignment = System.Windows.HorizontalAlignment.Center;
            button1.Visibility = System.Windows.Visibility.Collapsed;
            button2.Visibility = System.Windows.Visibility.Collapsed;


        }



    }
}
