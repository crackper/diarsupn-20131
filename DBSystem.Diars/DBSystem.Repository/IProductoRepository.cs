using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBSystem.Entities;

namespace DBSystem.Repository
{
    public interface IProductoRepository
    {
        List<Producto> GetAllFromProducto();
        List<Producto> GetFromProductoByCriterio(string criterio);
        Producto GetFromProductoById(Int32 id);
        void AddProducto(Producto producto);
        void UpdateProducto(Producto producto);
        void RemoveProducto(Int32 id);
    }
}
