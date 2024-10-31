using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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
    /// Логика взаимодействия для NewOrder.xaml
    /// </summary>
    public partial class NewOrder : Window
    {
        private static Orders _order = new Orders();
        private static Employee _employee = new Employee();

        public NewOrder(Employee employee)
        {
            InitializeComponent();
            Client.ItemsSource = GetContext().Clients.ToList();
            _employee = GetContext().Employee.Where(x => x.Id == employee.Id).FirstOrDefault();

            DataContext = _order;
            RentalTime.PreviewTextInput += new TextCompositionEventHandler(TextBox_PreviewTextInput);
        }
        void TextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!Regex.Match(e.Text, @"[0-9]").Success)
            {
                e.Handled = true;
            }
        }
        private void Create_Click(object sender, RoutedEventArgs e)
        {
            if (_order.id == 0)
            {
                GetContext().Orders.Add(_order);
                _order.Date = DateTime.Now;
                _order.StatusId = 1;
                _order.EmployeeId = _employee.Id;
            }
            try
            {
                if (_order.Clients == null)
                {
                    MessageBox.Show("Выберите клиента");
                }
                if (Convert.ToInt32(RentalTime.Text) == 0)
                {
                    MessageBox.Show("Укажите количество часов");
                }
                if (21 - _order.Date.Hour < Convert.ToInt32(RentalTime.Text))
                {
                    MessageBox.Show("Измените количество часов. Оно не должно быть больше часов работы проката");
                }
                if (Convert.ToInt32(RentalTime.Text) != 0 && 21 - _order.Date.Hour > Convert.ToInt32(RentalTime.Text))
                {
                    GetContext().SaveChanges();
                    var rez = MessageBox.Show("Новый заказ сформирован", "Информация о заказе", MessageBoxButton.OK);
                    if (rez == MessageBoxResult.OK)
                    {
                        ForOrder ForOrder = new ForOrder(_order, _employee);
                        ForOrder.ShowDialog();
                        Close();
                    }
                }

            }
            catch (Exception ex)
            {



            }
        }

        private void Cancellation_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}

