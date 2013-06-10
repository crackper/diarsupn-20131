using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Practices.Unity;
using DBSystem.BusinessLogic;

namespace DBSystem.Web
{
    public partial class frmProductos : BasePage
    {
        [Dependency]
        public ProductoBL ProductoBL { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void odsProducto_ObjectCreating(object sender, ObjectDataSourceEventArgs e)
        {
            e.ObjectInstance = ProductoBL;
        }
    }
}