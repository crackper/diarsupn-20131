using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBSystem.BusinessLogic;
using DBSystem.Entities;
using Microsoft.Practices.Unity;

namespace DBSystem.Web.Ventas
{
    public partial class frmListClientes : BasePage
    {
        [Dependency]
        public ClienteBL ClienteBL { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void odsClientes_ObjectCreating(object sender, ObjectDataSourceEventArgs e)
        {
            e.ObjectInstance = ClienteBL;
        }
    }
}