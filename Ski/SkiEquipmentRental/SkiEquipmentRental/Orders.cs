//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SkiEquipmentRental
{
    using System;
    using System.Collections.Generic;
    using static SkiEquipmentRental.AppDatas;
    public partial class Orders
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Orders()
        {
            this.HisroryOrders = new HashSet<HisroryOrders>();
        }
    
        public int id { get; set; }
        public System.DateTime Date { get; set; }
        public int ClientId { get; set; }
        public int StatusId { get; set; }
        public int HowHours { get; set; }
        public Nullable<System.DateTime> DateClose { get; set; }
        public Nullable<int> EmployeeId { get; set; }
        public Nullable<int> Sum { get; set; }
        private int _Shtraf;
        public Nullable<int> Shtraf
        {
            get
            {
                if (DateTime.Now.Hour - Date.Hour > HowHours && StatusId != 3)
                {
                    _Shtraf = 1000;

                }
                if ((DateTime.Today - Date).Days >= 1 && StatusId != 3)
                {
                    _Shtraf = 1000;
                    StatusId = 4;

                }
                return _Shtraf;
                GetContext().SaveChanges();
            }
            set
            {

            }
        }

        public virtual Clients Clients { get; set; }
        public virtual Employee Employee { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HisroryOrders> HisroryOrders { get; set; }
        public virtual Status Status { get; set; }
    }
}
