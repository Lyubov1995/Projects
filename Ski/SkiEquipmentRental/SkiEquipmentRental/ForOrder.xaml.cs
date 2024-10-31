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
    /// Логика взаимодействия для ForOrder.xaml
    /// </summary>
    public partial class ForOrder : Window
    {
        private static Orders _order = new Orders();
        private static Employee _Employee = new Employee();

        public ForOrder(Orders order, Employee employee)
        {
            InitializeComponent();
            _order = GetContext().Orders.Where(x => x.id == order.id).FirstOrDefault();
            _Employee = GetContext().Employee.Where(x => x.Id == employee.Id).FirstOrDefault();
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void Clothes_Click(object sender, RoutedEventArgs e)
        {
            Clothes clothes = new Clothes(_order.id, _Employee);
            clothes.Show();
            Hide();
        }

        private void Inventory_Click(object sender, RoutedEventArgs e)
        {
            OrderingInventory orderingInventory = new OrderingInventory(_order.id, _Employee);
            orderingInventory.Show();
            Hide();
        }

        private void Protection_Click(object sender, RoutedEventArgs e)
        {
            Protection protection = new Protection(_order.id, _Employee);
            protection.Show();
            Hide();
        }
    }
}
