using Projekt.BL;
using Projekt.Controls;
using Projekt.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Projekt
{
    public partial class UrediOsobu : MyPage
    {
        private const string HRNASLOV = "Uredi osobu";
        private const string ENNASLOV = "Edit person";
        private Referada referada = new Referada();
        OsobaUserControl osobaUserControl;
        private Osoba osoba;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TrenutniLogin"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                if (OsobaID == 0)
                {
                    Response.Redirect("PrikazOsoba.aspx");
                }
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

        protected override void OnInit(EventArgs e)
        {
            PrikaziOsobu();
            base.OnInit(e);
        }

        private void PrikaziOsobu()
        {
            osoba = referada.DobaviOsobuZaId(OsobaID);

            osobaUserControl = (OsobaUserControl)Page.LoadControl("Controls/OsobaUserControl.ascx");
            osobaUserControl.NapuniOsobu(osoba);
            osobaUserControl.OnDeleteClick += OsobaUserControl_OnDeleteClick;
            osobaUserControl.OnUpdateClick += OsobaUserControl_OnUpdateClick;
            osobaUserControl.OnUpdateEmailClick += OsobaUserControl_OnUpdateEmailClick;
            divOsoba.Controls.Add(osobaUserControl);

            Osoba trenutnaOsoba = (Osoba)Session["TrenutniLogin"];

            if (trenutnaOsoba.Status == 0)
            {
                Response.Redirect("PrikazOsoba.aspx");
            }
        }

        private void OsobaUserControl_OnUpdateEmailClick(Osoba osoba, int whicEmail)
        {
            try
            {
                if (whicEmail == 1)
                {
                    if (referada.AzurirajEmail1Osobe(osoba) > 0)
                    {
                        divOsoba.Controls.Clear();
                        PrikaziOsobu();
                    }
                }
                else if (whicEmail == 2)
                {
                    if (referada.AzurirajEmail2Osobe(osoba) > 0)
                    {
                        divOsoba.Controls.Clear();
                        PrikaziOsobu();
                    }

                }
                else if (whicEmail == 3)
                {
                    if (referada.AzurirajEmail3Osobe(osoba) > 0)
                    {
                        divOsoba.Controls.Clear();
                        PrikaziOsobu();
                    }
                }
            }
            catch (Exception e)
            {
                (Page.Master as Projekt).ErrorMessage = e.Message;
            }
        }

        private void OsobaUserControl_OnUpdateClick(Osoba osoba, int mail)
        {
            try
            {
                if (mail == 1)
                {
                    if (referada.AzurirajOsobuMail1(osoba) > 0)
                    {
                        divOsoba.Controls.Clear();

                        ProvjeriDaLiJeAzuriranjeNaTrenutnojOsobi(osoba);
                        PrikaziOsobu();
                    }
                }
                else if (mail == 2)
                {
                    if (referada.AzurirajOsobuMail2(osoba) > 0)
                    {
                        divOsoba.Controls.Clear();

                        ProvjeriDaLiJeAzuriranjeNaTrenutnojOsobi(osoba);
                        PrikaziOsobu();
                    }

                }
                else
                {
                    if (referada.AzurirajOsobuMail3(osoba) > 0)
                    {
                        divOsoba.Controls.Clear();

                        ProvjeriDaLiJeAzuriranjeNaTrenutnojOsobi(osoba);
                        PrikaziOsobu();
                    }
                }

            }
            catch (Exception e)
            {
                (Page.Master as Projekt).ErrorMessage = e.Message;
            }
        }

        private void ProvjeriDaLiJeAzuriranjeNaTrenutnojOsobi(Osoba osoba)
        {
            Osoba trenutniLogin = (Osoba)Session["TrenutniLogin"];
            if (osoba.IDOsoba == trenutniLogin.IDOsoba)
            {
                Session.Remove("TrenutniLogin");
                Session["TrenutniLogin"] = osoba;
            }
        }

        private void OsobaUserControl_OnDeleteClick(int idOsoba)
        {
            try
            {
                Osoba osoba = (Osoba)Session["TrenutniLogin"];
                if (osoba.IDOsoba != idOsoba)
                {
                    referada.ObrisiOsobu(OsobaID);
                    divOsoba.Controls.Clear();
                    OsobaID = 0;
                    Response.Redirect("PrikazOsoba.aspx");
                }
                else
                {
                    divOsoba.Controls.Clear();
                    PrikaziOsobu();
                }
            }
            catch (Exception e)
            {
                (Page.Master as Projekt).ErrorMessage = e.Message;
            }
        }

        protected void btnOdjava_Click(object sender, EventArgs e)
        {
            Session.Remove("TrenutniLogin");
            Response.Redirect("Login.aspx");
        }


    }
}