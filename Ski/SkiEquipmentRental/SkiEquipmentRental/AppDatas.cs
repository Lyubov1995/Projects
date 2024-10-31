using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SkiEquipmentRental
{
    class AppDatas
    {
        private static SkyEntities _context;

        public static SkyEntities GetContext()
        {
            if (_context == null)
                _context = new SkyEntities();
            return _context;
        }
    }
}
