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

                var existe = pedido.DetallePedidoes
                            .Where(d => d.productoId.Equals(idProducto))
                            .SingleOrDefault();

                if (existe == null)
                {
                    //actualizo el pedido
                    var detalle = new DetallePedido()
                    {
                        productoId = producto.Id,
                        precio = producto.Precio,
                        Producto = producto,
                        cantidad = 1
                    };

                    pedido.DetallePedidoes.Add(detalle);
                }
                else
                {
                    existe.cantidad++;
                }

                lblTotal.Text = pedido.DetallePedidoes.Sum(d => d.monto).ToString();

                //sobre escribo el cache
                Cache.Insert(PEDIDO, pedido);

                gvDetallePedido.DataSource = pedido.DetallePedidoes;
                gvDetallePedido.DataBind();
            }
        }

        protected void gvDetallePedido_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "QuitarDetalle")
            {
                var idProducto = Int32.Parse(e.CommandArgument.ToString());

                //recupero el pedido en cache
                var pedido = Cache.Get(PEDIDO) as Pedido;

                //actualizo el pedido
                var existe = pedido.DetallePedidoes
                        .Where(d => d.productoId.Equals(idProducto))
                        .SingleOrDefault();

                if (existe !=null)
                {
                    pedido.DetallePedidoes.Remove(existe);
                }

                lblTotal.Text = pedido.DetallePedidoes.Sum(d => d.monto).ToString();

                //sobre escribo el cache
                Cache.Insert(PEDIDO, pedido);

                gvDetallePedido.DataSource = pedido.DetallePedidoes;
                gvDetallePedido.DataBind();

            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            //recupero el pedido en cache
            var pedido = Cache.Get(PEDIDO) as Pedido;

            foreach (GridViewRow row in gvDetallePedido.Rows)
            {
                var txtPrecio = row.FindControl("txtPrecio") as TextBox;
                var txtCantidad = row.FindControl("txtCantidad") as TextBox;

                pedido.DetallePedidoes[row.RowIndex].cantidad = Int32.Parse(txtCantidad.Text);
                pedido.DetallePedidoes[row.RowIndex].precio = decimal.Parse(txtPrecio.Text);

            }

            lblTotal.Text = pedido.DetallePedidoes.Sum(d => d.monto).ToString();

            //sobre escribo el cache
            Cache.Insert(PEDIDO, pedido);

            gvDetallePedido.DataSource = pedido.DetallePedidoes;
            gvDetallePedido.DataBind();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            //recupero el pedido en cache
            var pedido = Cache.Get(PEDIDO) as Pedido;

            //lo mando al bl...y el Repository hace su trabajo
            //pedidoBL.AddPedido(pedido);
        }
    }
}