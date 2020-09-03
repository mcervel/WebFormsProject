using Projekt.Controls;
using Projekt.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;

namespace Projekt
{
    public class MyPage : System.Web.UI.Page
    {
        public int EmailCounter {
            get {
                if (Session["EmailCounter"] == null)
                    Session["EmailCounter"] = 0;
                return (int)Session["EmailCounter"];
            }
            set { Session["EmailCounter"] = value; }
        }

        public List<EmailUserControl> KolekcijaEmailova {
            get {
                if (Session["KolekcijaEmailova"] == null)
                    Session["KolekcijaEmailova"] = new List<EmailUserControl>();
                return (List<EmailUserControl>)Session["KolekcijaEmailova"];
            }
        }

        protected override void OnPreInit(EventArgs e)
        {
            if (Request.Cookies["mojaTema"] != null)
            {
                var tema = Request.Cookies["mojaTema"].Value;
                if (tema != "0") this.Theme = tema;
            }
            base.OnPreInit(e);
        }

        public int OsobaID {
            get {
                if (Session["OsobaID"] == null)
                    Session["OsobaID"] = 0;
                return (int)Session["OsobaID"];
            }
            set { Session["OsobaID"] = value; }
        }

        protected override void InitializeCulture()
        {
            if (Request.Cookies["mojJezik"] != null)
            {
                var kultura = Request.Cookies["mojJezik"].Value;
                if (kultura != "0")
                {
                    //globalizacija
                    Thread.CurrentThread.CurrentCulture = new CultureInfo(kultura);

                    //lokalizacija
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(kultura);
                }
            }

            base.InitializeCulture();
        }


        public MyPage()
        {
        }
    }
}