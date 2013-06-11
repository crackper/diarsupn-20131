using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.Unity;
using DBSystem.Entities;
using DBSystem.Repository;

namespace DBSystem.BusinessLogic
{
    public class FormaPagoBL:IFormaPagoBL
    {
        [Dependency]
        public IFormaPagoRepository FormaPagoRepository { get; set; }

        public List<FormaPago> GetFromFormaPago()
        {
            return FormaPagoRepository.GetFromFormaPago();
        }
    }
}
