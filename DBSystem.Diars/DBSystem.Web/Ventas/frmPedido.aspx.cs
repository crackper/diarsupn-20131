using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Practices.Unity;
using DBSystem.BusinessLogic;
using DBSystem.Entities;

namespace DBSystem.Web.Ventas
{
    public partial class frmPedido : BasePage
    {
        private const string PEDIDO = "pedido";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                var pedido = new Pedido()
                {
                    fecha = DateTime.Now,
                    Cliente = new Cliente(),
                    total = 0
                };

                Cache.Insert(PEDIDO, pedido);
            }
        }

        [Dependency]
        public IClienteBL ClienteBL { get; set; }

        protected void btnBuscarCliente_Click(object sender, EventArgs e)
        {
            var cliente = ClienteBL.GetFromClienteByRucDni(txtRucDNI.Text);

            if (cliente!=null)
            {
                txtRazonSocial.Text = cliente.razonSocial;
                txtDireccion.Text = cliente.direccion;

                //recupero el pedido en cache
                var pedido = Cache.Get(PEDIDO) as Pedido;

                //actualizo el pedido
                pedido.Cliente = cliente;
                pedido.clienteId = cliente.id;

                //sobre escribo el pedido en el cache
                Cache.Insert(PEDIDO, pedido);
            }

        }

        [Dependency]
        public IProductoBL ProductoBL { get; set; }
        protected void odsProductos_ObjectCreating(object sender, ObjectDataSourceEventArgs e)
        {
            e.ObjectInstance = ProductoBL;
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            var idProducto = Int32.Parse(gvProductos.DataKeys[0].Value.ToString());

            var producto = ProductoBL.GetFromProductoById(idProducto);

            //recupero el pedido en cache
            var pedido = Cache.Get(PEDIDO) as Pedido;

            //actualizo el pedido
            var detalle = new DetallePedido() 
            {
                productoId = producto.Id,
                precio = producto.Precio,
                Producto = producto,
                cantidad = 1
            };

            pedido.DetallePedidoes.Add(detalle);

            //sobre escribo el cache
            Cache.Insert(PEDIDO, pedido);

            gvDetallePedido.DataSource = pedido.DetallePedidoes;
            gvDetallePedido.DataBind();

           

            
        }

        protected void gvProductos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName =="AddDetalle")
            {
                var idProducto = Int32.Parse(e.CommandArgument.ToString());

                var producto = ProductoBL.GetFromProductoById(idProducto);

                //recupero el pedido en cache
                var pedido = Cache.Get(PEDIDO) as Pedido;

                //actualizo el pedido
                var detalle = new DetallePedido()
                {
                    productoId = producto.Id,
                    precio = producto.Precio,
                    Producto = producto,
                    cantidad = 1
                };

                pedido.DetallePedidoes.Add(detalle);

                //sobre escribo el cache
                Cache.Insert(PEDIDO, pedido);

                gvDetallePedido.DataSource = pedido.DetallePedidoes;
                gvDetallePedido.DataBind();
            }
        }
    }
}