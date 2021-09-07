﻿using AdministratorApp.Classes;
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

namespace AdministratorApp.View.applications
{
    /// <summary>
    /// Interaction logic for us_applications.xaml
    /// </summary>
    public partial class uc_applications : UserControl
    {
        public uc_applications()
        {
            try
            {
                InitializeComponent();
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }
        private static uc_applications _instance;
        public static uc_applications Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new uc_applications();
                return _instance;
            }
        }
        public static List<string> menuList;
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {
                if (sender != null)
                    HelpClass.StartAwait(grid_mainGrid);


                menuList = new List<string> { "programs", "versions", "packages" };





                if (sender != null)
                    HelpClass.EndAwait(grid_mainGrid);
            }
            catch (Exception ex)
            {
                if (sender != null)
                    HelpClass.EndAwait(grid_mainGrid);
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        void colorButtonRefreash(string str)
        {
            foreach (Button button in FindControls.FindVisualChildren<Button>(this))
            {
                if (button.Tag != null)
                {
                    foreach (var item in menuList)
                    {
                        if (item == button.Tag.ToString())
                        {
                            if (item == str)
                                button.Background = Application.Current.Resources["MainColor"] as SolidColorBrush;
                            else
                                button.Background = Application.Current.Resources["SecondColor"] as SolidColorBrush;

                        }
                    }
                }
            }
        }
        private void Btn_programs_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Button button = sender as Button;
            colorButtonRefreash(button.Tag.ToString());
            grid_main.Children.Clear();
            grid_main.Children.Add(uc_programs.Instance);
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        private void Btn_versions_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Button button = sender as Button;
                colorButtonRefreash(button.Tag.ToString());
                grid_main.Children.Clear();
                grid_main.Children.Add(uc_versions.Instance);
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }

        private void Btn_packages_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Button button = sender as Button;
                colorButtonRefreash(button.Tag.ToString());
                grid_main.Children.Clear();
                grid_main.Children.Add(uc_packages.Instance);
            }
            catch (Exception ex)
            {
                HelpClass.ExceptionMessage(ex, this);
            }
        }
    }
}
