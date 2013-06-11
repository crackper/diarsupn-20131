using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBSystem.Entities;

namespace DBSystem.BusinessLogic
{
    public interface IFormaPagoBL
    {
        List<FormaPago> GetFromFormaPago();
    }
}
