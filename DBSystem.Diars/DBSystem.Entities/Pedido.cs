using System;
using System.Collections.Generic;

namespace DBSystem.Entities
{
    public partial class Pedido
    {
        public Pedido()
        {
            this.DetallePedidoes = new List<DetallePedido>();
        }

        public int id { get; set; }
        public int clienteId { get; set; }
        public System.DateTime fecha { get; set; }
        public decimal total { get; set; }
        public int formaPagoId { get; set; }
        public virtual Cliente Cliente { get; set; }
        public virtual List<DetallePedido> DetallePedidoes { get; set; }
        public virtual FormaPago FormaPago { get; set; }
    }
}
