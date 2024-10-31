using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
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
using static SkiEquipmentRental.AppDatas;

namespace SkiEquipmentRental
{
    /// <summary>
    /// Логика взаимодействия для Administrator.xaml
    /// </summary>
    public partial class Administrator : Window
    {
        private static Employee _Employee;
        private List<Orders> _Orders = new List<Orders>();
        public Administrator(Employee Employee)
        {
            InitializeComponent();
            _Employee = Employee;
            UpLoad();
        }
        public void UpLoad()
        {
            _Orders = GetContext().Orders.ToList();
            Spisok.ItemsSource = _Orders;
        }

        private void Exit_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            Hide();
        }

        private void Customers_Click(object sender, RoutedEventArgs e)
        {
            ListOfClients listOfClients = new ListOfClients();
            listOfClients.Show();
        }

        private void Account_Click(object sender, RoutedEventArgs e)
        {
            Account account = new Account(_Employee);
            account.Show();
        }
    }

}

