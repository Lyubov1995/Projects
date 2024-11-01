﻿using System;
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
using System.Windows.Shapes;

namespace SkiEquipmentRental
{
    /// <summary>
    /// Логика взаимодействия для Account.xaml
    /// </summary>
    public partial class Account : Window
    {
        private static Employee _Employee;

        public Account(Employee Employee)
        {
            InitializeComponent();
            _Employee = Employee;
            DataContext = _Employee;
        }
        private void Back_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
