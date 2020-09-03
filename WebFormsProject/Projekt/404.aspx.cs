using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Projekt
{
    public partial class _404 : System.Web.UI.Page
    {
        private const string ENNASLOV = "404 ERROR";
        private const string HRNASLOV = "404 GREŠKA";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TrenutniLogin"] != null)
            {
                Response.Redirect("DodavanjeOsoba.aspx");
            }
            else
            {
                if (Request.Cookies["mojJezik"] != null)
                {
                    var kultura = Request.Cookies["mojJezik"].Value;
                    if (kultura != "0")
                    {
                        if (kultura == "en")
                        {
                            this.Title = ENNASLOV;
                            (Page.Master as Projekt).Naslov = ENNASLOV;
                        }
                        else if (kultura == "hr")
                        {
                            this.Title = HRNASLOV;
                            (Page.Master as Projekt).Naslov = HRNASLOV;
                        }

                    }
                }
            }
        }

        protected void btnOdjava_Click(object sender, EventArgs e)
        {
            Session.Remove("TrenutniLogin");
            Response.Redirect("Login.aspx");
        }
    }
}