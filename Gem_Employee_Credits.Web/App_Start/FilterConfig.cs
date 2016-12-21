using System.Web;
using System.Web.Mvc;

namespace Gem_Employee_Credits.Web
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}