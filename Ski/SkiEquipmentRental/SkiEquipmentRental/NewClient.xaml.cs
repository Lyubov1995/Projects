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
    /// Логика взаимодействия для NewClient.xaml
    /// </summary>
    public partial class NewClient : Window
    {
        private static Clients _Client = new Clients();

        public NewClient()
        {
            InitializeComponent();
            DataContext = _Client;
            Passport.PreviewTextInput += new TextCompositionEventHandler(TextBox_PreviewTextInput);
        }
        void TextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!Regex.Match(e.Text, @"[0-9]").Success)
            {
                e.Handled = true;
            }
        }
        private void Save_Click(object sender, RoutedEventArgs e)
        {
            if (_Client.Id == 0)
            {
               GetContext().Clients.Add(_Client);
            }
            try
            {
                GetContext().SaveChanges();
                var rez = MessageBox.Show("Данные загружены", " ", MessageBoxButton.OK);
                if (rez == MessageBoxResult.OK)
                {
                    Close();
                }
            }
            catch (Exception ex)
            {
                if (_Client.FIO == null)
                {
                    MessageBox.Show("Укажите ФИО");
                }
                if (_Client.Phone == null)
                {
                    MessageBox.Show("Укажите телефон");
                }
                if (_Client.Adress == null)
                {
                    MessageBox.Show("Укажите адрес");
                }
                if (_Client.Birthday == null)
                {
                    MessageBox.Show("Укажите день рождения");
                }
                if (_Client.Passport == 0)
                {
                    MessageBox.Show("Укажите паспорт");
                }
                if (Passport.Text.Length < 10 || Passport.Text.Length > 10)
                {
                    MessageBox.Show("Паспорт должен содержать 10 символов");
                }
                if (FIO.Text.Length < 15)
                {
                    MessageBox.Show("Введите ФИО полностью");
                }
                if (phone.Text.Length < 11 || _Client.Phone.Length > 12)
                {
                    MessageBox.Show("Телефон должен содержать 11-12 символов");
                }
            }
        }
        private void Exit_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
