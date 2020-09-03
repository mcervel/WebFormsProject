using Projekt.BL;
using Projekt.Controls;
using Projekt.DAL;
using Projekt.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Projekt
{
    public partial class DodavanjeOsoba : MyPage
    {

        private Referada referada = new Referada();
        private const string HRNASLOV = "Dodavanje Osoba";
        private const string ENNASLOV = "Add new person";

        protected override void OnInit(EventArgs e)
        {
            if (IsPostBack)
            {
                PrikaziSveEmailove();
            }

            base.OnInit(e);
        }

        private void PrikaziSveEmailove()
        {
            for (int i = 0; i < EmailCounter; i++)
            {
                if (i > 1)
                {
                    break;
                }
                else
                {
                    if (KolekcijaEmailova.Count > 0)
                    {
                        AddAnotherEmail(i);
                    }
                    else
                    {
                        AddAnotherEmail(i);
                    }

                }

            }
        }

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

                    tbIme.Focus();
                    if (!IsPostBack)
                    {
                        Session.Remove("EmailCounter");
                        Session.Remove("KolekcijaEmailova");
                        EmailCounter = 1;
                    }
                }

            }
        }

        protected void btnDodaj_Click(object sender, EventArgs e)
        {
            string ime = tbIme.Text;
            string prezime = tbPrezime.Text;
            string email = tbEmail.Text;
            string email2;
            string email3;

            if (KolekcijaEmailova.Count > 0)
            {
                email2 = KolekcijaEmailova[0].TbEmailValue;
            }
            else
            {
                email2 = String.Empty;
            }

            if (KolekcijaEmailova.Count > 1)
            {
                email3 = KolekcijaEmailova[1].TbEmailValue;
            }
            else
            {
                email3 = String.Empty;
            }

            string telefon = tbTelefon.Text;
            string grad = ddlGrad.SelectedValue;
            int status = int.Parse(ddlStatus.SelectedValue);
            string lozinka = tbLozinka.Text;

            Osoba o = new Osoba
            {
                Ime = ime,
                Prezime = prezime,
                Email = email,
                Email2 = email2,
                Email3 = email3,
                Telefon = telefon,
                Grad = grad,
                Status = status,
                Lozinka = lozinka
            };

            try
            {
                referada.DodajOsobu(o);
                Session.Remove("EmailCounter");
                Session.Remove("KolekcijaEmailova");
                EmailCounter = 1;
            }
            catch (Exception ex)
            {
                (Page.Master as Projekt).ErrorMessage = "Dogodila se greška! Opis greške: " + ex.Message;

            }

            ResetForm();
            hiddenFieldToastr.Value = "true";
        }

        private void ResetForm()
        {
            tbIme.Text = String.Empty;
            tbPrezime.Text = String.Empty;
            tbEmail.Text = String.Empty;
            tbTelefon.Text = String.Empty;
            ddlGrad.SelectedValue = "0";
            otherEmailsDiv.Controls.Clear();
            lbAddEmail.Visible = true;
            lbAddEmail.Enabled = true;
        }

        protected void lbAddEmail_Click(object sender, EventArgs e)
        {
            EmailCounter += 1;

            EmailUserControl ctrl = (EmailUserControl)LoadControl("~/Controls/EmailUserControl.ascx");

            ctrl.ID = EmailCounter.ToString();
            otherEmailsDiv.Controls.Add(new LiteralControl("<br/>"));
            otherEmailsDiv.Controls.Add(ctrl);
            KolekcijaEmailova.Add(ctrl);
        }

        private void AddAnotherEmail(int id)
        {
            foreach (EmailUserControl ctrl in KolekcijaEmailova)
            {
                otherEmailsDiv.Controls.Add(ctrl);
            }

            if (EmailCounter == 2)
            {
                lbAddEmail.Visible = false;
                lbAddEmail.Enabled = false;
            }
        }

        protected void btnOdjava_Click(object sender, EventArgs e)
        {
            Session.Remove("TrenutniLogin");
            Response.Redirect("Login.aspx");
        }
    }
}