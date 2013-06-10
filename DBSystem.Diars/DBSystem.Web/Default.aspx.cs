using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBSystem.BusinessLogic;
using DBSystem.Entities;
using Microsoft.Practices.Unity;
using Microsoft.Practices.Unity.Configuration;

namespace DBSystem.Web
{
    public partial class _Default : System.Web.UI.Page
    {
        //IProductoBL productoBL;

        [Dependency]
        public IProductoBL productoBL { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            //productoBL = new ProductoBL();

            using (var container = new UnityContainer()) 
            {
                container.LoadConfiguration();
                container.BuildUp(this.GetType(), this);
            }

            gvProductos.DataSource = productoBL.GetAllFromProducto();
            gvProductos.DataBind();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            gvProductos.DataSource = 
                productoBL.GetFromProductoByCriterio(txtCriterio.Text);
            gvProductos.DataBind();
        }
    }
}
