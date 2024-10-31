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
using static SkiEquipmentRental.AppDatas;

namespace SkiEquipmentRental
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private static Employee _Employee = new Employee(); //строчка для обращения к таблице Сотрудники
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Enter_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                _Employee = GetContext().Employee.Where(x => x.Login == Login.Text && x.Password == Password.Password).FirstOrDefault();
                if (_Employee == null)
                {
                    MessageBox.Show("Такого пользователя нет!", "Ошибка при авторизации",
                        MessageBoxButton.OK, MessageBoxImage.Error);
                }
                else
                {
                    MessageBox.Show("Вы вошли как: " + _Employee.Role.Name, "Уведомление",
                        MessageBoxButton.OK, MessageBoxImage.Information);
                    switch (_Employee.RoleId)
                    {
                        case 1:
                            _Employee = GetContext().Employee.Where(x => x.Id == _Employee.Id).FirstOrDefault();
                            var adminWindow = new Administrator(_Employee);
                            adminWindow.Owner = this;
                            adminWindow.Show();
                            Hide();
                            break;
                        case 2:
                            _Employee = GetContext().Employee.Where(x => x.Id == _Employee.Id).FirstOrDefault();
                            var SeniorSalesman = new SeniorSalesman(_Employee);
                            SeniorSalesman.Owner = this;
                            SeniorSalesman.Show();
                            Hide();
                            break;
                        case 3:
                            _Employee = GetContext().Employee.Where(x => x.Id == _Employee.Id).FirstOrDefault();
                            var Seller = new Seller(_Employee);
                            Seller.Owner = this;
                            Seller.Show();
                            Hide();
                            break;
                        default:
                            MessageBox.Show("Данные не обнаружены!", "Уведомление",
                       MessageBoxButton.OK, MessageBoxImage.Warning);
                            break;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка: " + ex.Message.ToString(), "Критическая работа приложения",
                       MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

    }
}
