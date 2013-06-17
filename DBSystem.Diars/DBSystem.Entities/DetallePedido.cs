using System;
using System.Collections.Generic;

namespace DBSystem.Entities
{
    public partial class DetallePedido
    {
        public int item { get; set; }
        public int pedidoId { get; set; }
        public int productoId { get; set; }
        public decimal cantidad { get; set; }
        public decimal precio { get; set; }
        
        public decimal monto 
        {
            get { return precio * cantidad; }

        }

        public virtual Pedido Pedido { get; set; }
        public virtual Producto Producto { get; set; }
    }
}
