using Projekt.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Projekt
{
    public partial class Postavke : MyPage
    {
        private const string HRNASLOV = "Postavke";
        private const string ENNASLOV = "Setup";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TrenutniLogin"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Osoba trenutnaOsoba = (Osoba)Session["TrenutniLogin"];

                if (trenutnaOsoba.Status == 0)
                {
                    Response.Redirect("PrikazOsoba.aspx");
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
        }

        protected void ddlTema_SelectedIndexChanged(object sender, EventArgs e)
        {
            HttpCookie kuki = new HttpCookie("mojaTema");
            kuki.Value = ddlTema.SelectedValue;
            Response.Cookies.Add(kuki);

            
            Response.Redirect(Request.Url.AbsolutePath);
        }

        protected void ddlJezik_SelectedIndexChanged(object sender, EventArgs e)
        {
            HttpCookie kuki = new HttpCookie("mojJezik");
            kuki.Value = ddlJezik.SelectedValue;
            Response.Cookies.Add(kuki);
            Response.Redirect(Request.Url.AbsolutePath);
        }

        protected void ddlRepozitorij_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnOdjava_Click(object sender, EventArgs e)
        {
            Session.Remove("TrenutniLogin");
            Response.Redirect("Login.aspx");
        }
    }
}