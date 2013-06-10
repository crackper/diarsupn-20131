using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DBSystem.Web
{
    public class BasePage: System.Web.UI.Page
    {
        protected override void OnInit(EventArgs e)
        {
            HttpContext.Current.Application.BuildWebUIElement(this);
        }
    }
}