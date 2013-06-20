using System;
using System.Collections.Generic;

namespace DBSystem.Entities
{
    public partial class Producto
    {
        public Producto()
        {
            this.DetallePedidoes = new List<DetallePedido>();
        }

        public int Id { get; set; }
        public int CategoriaId { get; set; }
        public string Codigo { get; set; }
        public string Descripcion { get; set; }
        public decimal Precio { get; set; }
        public decimal Stock { get; set; }
        public byte[] Foto { get; set; }
        public bool Descontinuado { get; set; }
        public virtual Categoria Categoria { get; set; }
        public virtual ICollection<DetallePedido> DetallePedidoes { get; set; }

        public override string ToString()
        {
            return Codigo + " - " + Descripcion;
        }
    }
}
