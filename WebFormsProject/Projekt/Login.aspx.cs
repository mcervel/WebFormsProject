using Projekt.BL;
using Projekt.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Projekt
{
    public partial class Login : MyPage
    {
        private Referada referada = new Referada();
        private const string ENNASLOV = "Login";
        private const string HRNASLOV = "Prijava";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TrenutniLogin"] != null)
            {
                Response.Redirect("DodavanjeOsoba.aspx");
            }
            else
            {
                txtEmail.Focus();

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
                        else if(kultura == "hr")
                        {
                            this.Title = HRNASLOV;
                            (Page.Master as Projekt).Naslov = HRNASLOV;
                        }
                        
                    }
                }

            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string lozinka = txtLozinka.Text;


            Osoba osoba = new Osoba();
            osoba.Email = email;
            osoba.Lozinka = lozinka;


            if (referada.ValidirajOsobu(osoba))
            {
                Osoba trenutnaOsoba = new Osoba();
                trenutnaOsoba = referada.DobaviOsobu(email);

                if (cbRememberMe.Checked)
                {
                    HttpCookie kuki = new HttpCookie("osoba");
                    kuki.Expires = DateTime.Now.AddDays(1);
                    kuki["email"] = email;
                    kuki["lozinka"] = Server.UrlEncode(lozinka);
                    Response.Cookies.Add(kuki);

                    DodajOsobuUSession(trenutnaOsoba);
                    Response.Redirect("PrikazOsoba.aspx");
                }
                else
                {
                    DodajOsobuUSession(trenutnaOsoba);
                    Response.Redirect("PrikazOsoba.aspx");
                }
            }
            else
            {
                ResetirajPolja();

                CustomValidator cv = new CustomValidator();
                if (Request.Cookies["mojJezik"] != null)
                {
                    var kultura = Request.Cookies["mojJezik"].Value;
                    if (kultura != "0")
                    {
                        if (kultura == "en")
                        {
                            cv.ErrorMessage = "Password is incorrect or the account does not exist!";
                        }
                        else if (kultura == "hr")
                        {
                            cv.ErrorMessage = "Lozinka nije ispravna ili osoba ne postoji!";
                        }

                    }
                }

                cv.IsValid = false;
                Validators.Add(cv);
            }

        }

        private void ResetirajPolja()
        {
            txtEmail.Text = String.Empty;
        }

        private void DodajOsobuUSession(Osoba trenutnaOsoba)
        {
            Session.Add("TrenutniLogin", trenutnaOsoba);
        }
    }
}