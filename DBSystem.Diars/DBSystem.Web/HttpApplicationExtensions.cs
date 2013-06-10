using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using Microsoft.Practices.Unity;

namespace DBSystem.Web
{
    public static class HttpApplicationStateExtensions
    {
        private const string GlobalContainerKey = "WebUnityContainer";

        public static IUnityContainer GetContainer(this HttpApplicationState appState)
        {
            appState.Lock();
            try
            {
                var myContainer = appState[GlobalContainerKey] as IUnityContainer;
                if (myContainer == null)
                {
                    myContainer = new UnityContainer();

                    appState[GlobalContainerKey] = myContainer;
                }
                return myContainer;
            }
            finally
            {
                appState.UnLock();
            }
        }

        public static void BuildWebUIElement(this HttpApplicationState appState, object view)
        {
            IUnityContainer container = appState.GetContainer();

            if (view != null && (view is System.Web.UI.Page || view is System.Web.UI.UserControl || view is System.Web.UI.MasterPage))
            {
                var properties = view.GetType().GetProperties();

                foreach (var item in properties)
                {
                    var dep = Attribute.GetCustomAttribute(item, typeof(Microsoft.Practices.Unity.DependencyAttribute)) as Microsoft.Practices.Unity.DependencyAttribute;
                    if (dep != null)
                    {
                        var value = container.Resolve(item.PropertyType);
                        item.SetValue(view, value, null);
                    }
                }
            }
        }
    }
}
