using System;
using System.Collections.Generic;

namespace DBSystem.Entities
{
    public partial class Cliente
    {
        public Cliente()
        {
            this.Pedidoes = new List<Pedido>();
        }

        public int id { get; set; }
        public string rucDni { get; set; }
        public string razonSocial { get; set; }
        public string direccion { get; set; }
        public virtual ICollection<Pedido> Pedidoes { get; set; }
    }
}
