using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBSystem.Entities;
using DBSystem.Repository;
using Microsoft.Practices.Unity;

namespace DBSystem.BusinessLogic
{
    public class ProductoBL:IProductoBL
    {
        //IProductoRepository repository;
        [Dependency]
        public IProductoRepository repository { get; set; }

        public ProductoBL()
        {
            //repository = new ProductoRepository();
        }

        public List<Producto> GetAllFromProducto()
        {
            return repository.GetAllFromProducto();
        }

        public Producto GetFromProductoById(int id)
        {
            return repository.GetFromProductoById(id);
        }


        public List<Producto> GetFromProductoByCriterio(string criterio)
        {
            return repository.GetFromProductoByCriterio(criterio);
        }


        public void AddProducto(Producto producto)
        {
            repository.AddProducto(producto);
        }

        public void UpdateProducto(Producto producto)
        {
            repository.UpdateProducto(producto);
        }

        public void RemoveProducto(int id)
        {
            repository.RemoveProducto(id);
        }
    }
}
