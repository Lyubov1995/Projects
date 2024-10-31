using Org.BouncyCastle.Asn1.X509;
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
    /// Логика взаимодействия для Clothes.xaml
    /// </summary>
    public partial class Clothes : Window
    {
        private List<Equipment> _Equipment = new List<Equipment>();
        private static HisroryOrders _orderHistory = new HisroryOrders();
        private static Orders _order = new Orders();
        private static Equipment _eqCount = new Equipment();
        private static Employee _employee = new Employee();

        public Clothes(int id, Employee Employee)
        {
            InitializeComponent();
            _order.id = id;
            _employee = GetContext().Employee.Where(x => x.Id == Employee.Id).FirstOrDefault();
            UpLoad();
            Count.PreviewTextInput += new TextCompositionEventHandler(TextBox_PreviewTextInput);
        }
        void TextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!Regex.Match(e.Text, @"[0-9]").Success)
            {
                e.Handled = true;
            }
        }
        public void UpLoad()
        {
            _Equipment = GetContext().Equipment.Where(x => x.TypeId == 1 && x.Count !=0).ToList();
            Spisok.ItemsSource = _Equipment;
            DataContext = _Equipment;
        }

        private void Exit_Click(object sender, RoutedEventArgs e)
        {
            ForOrder ForOrder = new ForOrder(_order, _employee);
            ForOrder.ShowDialog();
            Hide();
        }
        private void Order_Click(object sender, RoutedEventArgs e)
        {
            LookOrder LookOrder = new LookOrder(_order, _employee);
            LookOrder.ShowDialog();
            Hide();
            UpLoad();
        }
        private void Add_Click(object sender, RoutedEventArgs e)
        {
            if (Spisok.SelectedItem is Equipment equipment)
            {
                if (_orderHistory.Id == 0)
                {
                    GetContext().HisroryOrders.Add(_orderHistory);
                }
                if (_orderHistory.Id != 0)
                {
                    GetContext().HisroryOrders.Add(_orderHistory);
                }
                try
                {
                    _orderHistory.OrderId = _order.id;
                    _orderHistory.EquipmentId = equipment.Id;
                    _orderHistory.Count = Convert.ToInt32(Count.Text);
                    _eqCount = GetContext().Equipment.Where(x => x.Id == equipment.Id).FirstOrDefault();
                    if (_eqCount.Count < Convert.ToInt32(Count.Text))
                    {
                        MessageBox.Show("Нельзя заказать больше, чем есть в наличии");
                    }
                    if (Convert.ToInt32(Count.Text) == 0)
                    {
                        MessageBox.Show("Количество должно быть больше 0");
                    }
                    if (Count.Text != null && Convert.ToInt32(Count.Text) > 0 && _eqCount.Count > Convert.ToInt32(Count.Text))
                    {
                        _eqCount.Count -= Convert.ToInt32(Count.Text);
                        GetContext().SaveChanges();
                        _orderHistory.Summ = Convert.ToInt32(Count.Text) * Convert.ToInt32(_orderHistory.Equipment.PriceForHour);
                        GetContext().SaveChanges();
                        var rez = MessageBox.Show("Товар добавлен в заказ", "Информация о заказе", MessageBoxButton.OK);
                        UpLoad();
                    }
                }
                catch (Exception ex)
                {

                }
            }
        }
    }
}
