using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Gem.Dll;
using Gem.BO;
using System.Drawing;
using System.IO;
using System.Drawing.Imaging;

namespace Gem.Bll
{
    public class EmployeeBll
    {
        EmployeeDll employeeDll = new EmployeeDll();
        //public Image LoadImage()
        //{
        //    byte[] bytes = Convert.FromBase64String("R0lGODlhAQABAIAAAAAAAAAAACH5BAAAAAAALAAAAAABAAEAAAICTAEAOw==");

        //    Image image;
        //    using (MemoryStream ms = new MemoryStream(bytes))
        //    {
        //        image = Image.FromStream(ms);
        //    }

        //    return image;
        //}

        private string GetImagePath(string base64String, string extn)
        {
            // Convert Base64 String to byte[]
            byte[] imageBytes = Convert.FromBase64String(base64String);
            MemoryStream ms = new MemoryStream(imageBytes, 0, imageBytes.Length);

            // Convert byte[] to Image
            ms.Write(imageBytes, 0, imageBytes.Length);
            System.Drawing.Image image = System.Drawing.Image.FromStream(ms, true);
            string newFile = Guid.NewGuid().ToString() + extn;
            // string filePath = Path.Combine(Server.MapPath("~/Assets/") + Request.QueryString["id"] + "/", newFile);
            string filepath = "";
            image.Save(filepath, ImageFormat.Jpeg);
            return filepath;
        }

        public bool RegisterEmployee(EmployeeRegister empRegister)
        {
            var base64String = empRegister.ProfileImage;
            var extn = "jpg";
            empRegister.ProfileImage = GetImagePath(base64String, extn);
            return employeeDll.RegisterEmployee(empRegister);
        }

        public Int64 LoginEmployee(EmployeeLogin empLogin)
        {
            return employeeDll.LoginEmployee(empLogin);
        }
    }
}
