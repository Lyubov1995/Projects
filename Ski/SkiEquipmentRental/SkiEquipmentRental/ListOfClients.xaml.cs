using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
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
    /// Логика взаимодействия для ListOfClients.xaml
    /// </summary>
    public partial class ListOfClients : Window
    {
        private List<Clients> _Clients = new List<Clients>();
        public void UpLoad()
        {
            _Clients = GetContext().Clients.ToList();
            Spisok.ItemsSource = _Clients;
        }
        public ListOfClients()
        {
            InitializeComponent();
            UpLoad();
        }
        private void AddClient_Click(object sender, RoutedEventArgs e)
        {
            NewClient newClient = new NewClient();
            newClient.ShowDialog();
            UpLoad();
        }
        private void Back_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

    }
}
