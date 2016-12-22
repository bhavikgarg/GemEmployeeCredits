using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Gem.Bll;
using Gem.BO;

namespace Gem_Employee_Credits.Web.Controllers
{
    public class AppController : Controller
    {
        //
        // GET: /App/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Register()
        {
            return View();
        }

        public ActionResult Dashboard()
        {
            return View();
        }

        [HttpPost]
        public JsonResult LoginEmployee(EmployeeLogin empLogin)
        {
            var message = "Error occurred while logging in";
            var error = true;
            Int64 empId = 0;
            try
            {
                if (ModelState.IsValid)
                {
                    empId = new EmployeeBll().LoginEmployee(empLogin);
                    if (empId != 0)
                    {
                        message = "Login successful";
                        error = false;
                    }
                }
                else
                {
                    message = "Please fill the mandatory field(s).";
                }
            }
            catch (Exception)
            {
                message = "Exception occurred while loggin in";
            }

            return Json(new { error = error, message = message, empId = empId }, JsonRequestBehavior.AllowGet);
        }
    }
}
