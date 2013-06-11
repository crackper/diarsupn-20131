using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBSystem.Entities;

namespace DBSystem.Repository
{
    public class FormaPagoRepository:MasterRepository,IFormaPagoRepository
    {
        public List<FormaPago> GetFromFormaPago()
        {
            var query = from fp in Context.FormaPagoes
                        select fp;

            return query.ToList();
        }
    }
}
