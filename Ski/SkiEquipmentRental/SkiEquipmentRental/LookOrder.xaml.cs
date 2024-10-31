using iTextSharp.text;
using iTextSharp.text.pdf;
using Org.BouncyCastle.Asn1.X509;
using System;
using System.Collections.Generic;
using System.IO;
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
using System.Xml.Linq;
using static SkiEquipmentRental.AppDatas;
namespace SkiEquipmentRental
{
    /// <summary>
    /// Логика взаимодействия для LookOrder.xaml
    /// </summary>
    public partial class LookOrder : Window
    {
        private List<HisroryOrders> _history = new List<HisroryOrders>();
        private static Equipment _Equipment = new Equipment();
        private static Orders _Order;
        private static Employee _Employee;

        public LookOrder(Orders order, Employee employee)
        {
            InitializeComponent();
            _Order = GetContext().Orders.Where(x => x.id == order.id).FirstOrDefault();
            _Employee = GetContext().Employee.Where(x => x.Id == employee.Id).FirstOrDefault();
            UpLoad();
        }
        public void UpLoad()
        {
            _history = GetContext().HisroryOrders.Where(x => x.OrderId == _Order.id).ToList();
            Spisok.ItemsSource = _history;
            Summ.Text = ((_history.Sum(p => p.Summ) * _Order.HowHours) + _Order.Shtraf).ToString();

            if (_Order.StatusId != 1)
            {
                Continue.Visibility = Visibility.Hidden;
                Over.Visibility = Visibility.Hidden;
            }
            if (_Employee.RoleId == 2 && _Order.StatusId != 1)
            {
                ZakrOrder.Visibility = Visibility.Visible;
                LookCheck.Visibility = Visibility.Visible;
            }
            if (_Employee.RoleId == 3 && _Order.StatusId != 1)
            {
                LookCheck.Visibility = Visibility.Visible;
            }
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void Delete_Click(object sender, RoutedEventArgs e)
        {
            var ForRemoving = Spisok.SelectedItems.Cast<HisroryOrders>().ToList();
            if (Spisok.SelectedItem is HisroryOrders HisroryOrders)
            {
                if (MessageBox.Show($"Вы точно хотите удалить товар?", "Внимание",
                    MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
                {
                    try
                    {
                        GetContext().HisroryOrders.RemoveRange(ForRemoving);
                        _Equipment = GetContext().Equipment.Where(x => x.Id == HisroryOrders.EquipmentId).FirstOrDefault();
                        _Equipment.Count += HisroryOrders.Count;
                        GetContext().SaveChanges();
                        UpLoad();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message.ToString());
                    }
                }
            }
        }

        private void LookCheck_Click(object sender, RoutedEventArgs e)
        {
            if (File.Exists(@" " + _Order.id + ".pdf"))
            {
                System.Diagnostics.Process.Start(@" " + _Order.id + ".pdf");
            }
            else
            {
                MessageBox.Show("Чек заявки не существует");
            }
        }

        private void Continue_Click(object sender, RoutedEventArgs e)
        {
            ForOrder ForOrder = new ForOrder(_Order, _Employee);
            ForOrder.ShowDialog();
            Hide();
        }

        private void Over_Click(object sender, RoutedEventArgs e)
        {
            Document doc = new Document();
            string ttf = System.IO.Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.Fonts), "ARIAL.TTF");
            var baseFont = BaseFont.CreateFont(ttf, BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
            Font font = new Font(baseFont, Font.DEFAULTSIZE, Font.NORMAL);
            Font font1 = new Font(baseFont, 16, Font.BOLD);
            Font font3 = new Font(baseFont, 16);
            Font font2 = new Font(baseFont, Font.DEFAULTSIZE, Font.BOLDITALIC);
            using (var writer = PdfWriter.GetInstance(doc, new FileStream(" " + _Order.id + ".pdf", FileMode.Create)))
            {
                doc.Open();
                doc.AddTitle("Чек");
                doc.NewPage();
                doc.Add(new iTextSharp.text.Paragraph("Чек", font1));
                doc.Add(new iTextSharp.text.Paragraph("Cписок товаров", font1));
                List<HisroryOrders> rez = GetContext().HisroryOrders.Where(p => p.OrderId == _Order.id).ToList();
                if (rez.Count != 0)
                {
                    foreach (var p in rez)
                    {
                        string payment = string.Format(" " + p.Equipment.Name + " " + p.Count + " шт " + p.Summ + " рублей");
                        doc.Add(new iTextSharp.text.Paragraph(payment, font));
                    }
                    string sr0 = string.Format("На сколько часов прокат: " + _Order.HowHours);
                    doc.Add(new iTextSharp.text.Paragraph(sr0, font));
                    string sr1 = string.Format("Сотрудник, оформивший заказ: " + _Order.Employee.FIO);
                    doc.Add(new iTextSharp.text.Paragraph(sr1, font));
                    string sr2 = string.Format("Дата формирования заказа: " + _Order.Date);
                    doc.Add(new iTextSharp.text.Paragraph(sr2, font));
                }
                decimal sum = (decimal)_history.Sum(p => p.Summ) * _Order.HowHours;
                doc.Add(new iTextSharp.text.Paragraph($"Итого {sum} рублей", font1));
                doc.Close();
            }
            MessageBox.Show("Документ записан");
            _Order.StatusId = 2;
            _Order.Sum = Convert.ToInt32(Summ.Text);
            GetContext().SaveChanges();
            Close();
        }

        private void ZakrOrder_Click(object sender, RoutedEventArgs e)
        {
            Document doc = new Document();
            string ttf = System.IO.Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.Fonts), "ARIAL.TTF");
            var baseFont = BaseFont.CreateFont(ttf, BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
            Font font = new Font(baseFont, Font.DEFAULTSIZE, Font.NORMAL);
            Font font1 = new Font(baseFont, 16, Font.BOLD);
            Font font3 = new Font(baseFont, 16);
            Font font2 = new Font(baseFont, Font.DEFAULTSIZE, Font.BOLDITALIC);
            using (var writer = PdfWriter.GetInstance(doc, new FileStream(" " + _Order.id + "Over.pdf", FileMode.Create)))
            {
                doc.Open();
                doc.AddTitle("Чек");
                doc.NewPage();
                doc.Add(new iTextSharp.text.Paragraph("Чек", font1));
                doc.Add(new iTextSharp.text.Paragraph("Cписок товаров", font1));
                List<HisroryOrders> rez = GetContext().HisroryOrders.Where(p => p.OrderId == _Order.id).ToList();
                if (rez.Count != 0)
                {
                    foreach (var p in rez)
                    {
                        string payment = string.Format(" " + p.Equipment.Name + " " + p.Count + " шт " + p.Summ + " рублей");
                        doc.Add(new iTextSharp.text.Paragraph(payment, font));
                        _Equipment.Count += p.Count;
                        GetContext().SaveChanges();
                    }
                    string sr0 = string.Format("На сколько часов прокат: " + _Order.HowHours);
                    doc.Add(new iTextSharp.text.Paragraph(sr0, font));
                    string sr1 = string.Format("Сотрудник, оформивший заказ: " + _Order.Employee.FIO);
                    doc.Add(new iTextSharp.text.Paragraph(sr1, font));
                    string sr3 = string.Format("Сотрудник,закрывший заказ: " + _Employee.FIO);
                    doc.Add(new iTextSharp.text.Paragraph(sr3, font));
                    string sr2 = string.Format("Дата формирования заказа: " + _Order.Date);
                    doc.Add(new iTextSharp.text.Paragraph(sr2, font));
                    string sr4 = string.Format("Дата закрытия заказа: " + DateTime.Now);
                    doc.Add(new iTextSharp.text.Paragraph(sr4, font));
                    string sr5 = string.Format("Штраф: " + _Order.Shtraf + " руб");
                    doc.Add(new iTextSharp.text.Paragraph(sr5, font));
                }
                decimal sum = (decimal)(_history.Sum(p => p.Summ) * _Order.HowHours) + (decimal)_Order.Shtraf;
                doc.Close();
            }
            _Order.StatusId = 3;
            _Order.Sum = Convert.ToInt32(Summ.Text);
            _Order.DateClose = DateTime.Now;
            if (_Order.Shtraf == null)
            {
                _Order.Shtraf = 0;
            }
            GetContext().SaveChanges();
            MessageBox.Show("Документ записан");
            Close();
        }
    }
}
