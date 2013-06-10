using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBSystem.Repository
{
    public abstract class MasterRepository
    {
        public MasterRepository()
        {
            if (_context == null)
            {
                _context = new DBSystemContext();
            }
        }
       
       private DBSystemContext _context;
       protected DBSystemContext Context 
       {
           get { return _context; }    
       }
    }
}
