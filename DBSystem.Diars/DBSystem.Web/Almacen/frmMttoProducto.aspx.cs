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
    public partial class frmMttoProducto : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var acc = Request.QueryString["acc"];
            var idProducto = Request.QueryString["idProducto"];

            if (acc !=null)
            {
                if (acc=="update")
                {
                    fvProducto.ChangeMode(FormViewMode.Edit);
                }
                else if (acc=="delete" && idProducto!=null)
                {
                    var id = int.Parse(idProducto);

                    ProductoBL.RemoveProducto(id);
                }
            }
        }

        [Dependency]
        public IProductoBL ProductoBL { get; set; }

        protected void odsProducto_ObjectCreating(object sender, ObjectDataSourceEventArgs e)
        {
            e.ObjectInstance = ProductoBL;
        }
    }
}