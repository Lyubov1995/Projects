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
using System.Windows.Shapes;
using static SkiEquipmentRental.AppDatas;
namespace SkiEquipmentRental
{
    /// <summary>
    /// Логика взаимодействия для Seller.xaml
    /// </summary>
    public partial class Seller : Window
    {
        private static Employee _Employee;
        private List<Orders> _Orders = new List<Orders>();

        public Seller(Employee Employee)
        {
            InitializeComponent();
            _Employee = Employee;
            UpLoad();
        }
        public void UpLoad()
        {
            _Orders = GetContext().Orders.Where(x => x.EmployeeId == _Employee.Id).ToList();
            Spisok.ItemsSource = _Orders;
        }
        private void Exit_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            Hide();
        }
        private void Account_Click(object sender, RoutedEventArgs e)
        {
            Account account = new Account(_Employee);
            account.Show();
        }

        private void ToForm_Click(object sender, RoutedEventArgs e)
        {
            NewOrder NewOrder = new NewOrder(_Employee);
            NewOrder.ShowDialog();
            UpLoad();
        }

        private void Looking_Click(object sender, RoutedEventArgs e)
        {
            if (Spisok.SelectedItem is Orders order)
            {
                if (order.StatusId == 3)
                {
                    MessageBox.Show("Заявка закрыта, ее просмотр невозможен");
                }
                else
                {
                    LookOrder LookOrder = new LookOrder(order, _Employee);
                    LookOrder.ShowDialog();
                    UpLoad();
                }
            }
        }
    }
}
