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
    public partial class PrikazOsoba : MyPage
    {
        private const string HRNASLOV = "Prikaz Osoba";
        private const string ENNASLOV = "Person list";
        private Referada referada = new Referada();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TrenutniLogin"] == null)
            {
                Response.Redirect("Login.aspx");
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

                if (!IsPostBack)
                {
                    RepeaterDataBind();
                    GridViewDataBind();
                }

            }
        }

        private void GridViewDataBind()
        {
            try
            {
                gvOsobe.DataSource = referada.DobaviOsobe().OrderBy(o => o.Ime);
                gvOsobe.DataBind();

                Osoba osoba = (Osoba)Session["TrenutniLogin"];

                if (osoba.Status == 0)
                {
                    for (int i = 0; i < gvOsobe.Rows.Count; i++)
                    {
                        gvOsobe.Rows[i].Cells[5].Controls[0].Visible = false;
                    }

                    foreach (RepeaterItem item in repeaterOsobe.Items)
                    {
                        LinkButton button = item.FindControl("btnUredi") as LinkButton;
                        button.Visible = false;
                    }
                }
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
            }
        }

        private void RepeaterDataBind()
        {
            try
            {
                repeaterOsobe.DataSource = referada.DobaviOsobe().OrderBy(o => o.Ime);
                repeaterOsobe.DataBind();

                Osoba osoba = (Osoba)Session["TrenutniLogin"];

                if (osoba.Status == 0)
                {
                    for (int i = 0; i < gvOsobe.Rows.Count; i++)
                    {
                        gvOsobe.Rows[i].Cells[5].Controls[0].Visible = false;
                    }

                    foreach (RepeaterItem item in repeaterOsobe.Items)
                    {
                        LinkButton button = item.FindControl("btnUredi") as LinkButton;
                        button.Visible = false;
                    }
                }
                lblInfo.Text = "";
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
            }
        }

        protected void gvOsobe_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvOsobe.EditIndex = e.NewEditIndex;
            GridViewDataBind();
        }

        protected void gvOsobe_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvOsobe.EditIndex = -1;
            GridViewDataBind();
        }

        protected void gvOsobe_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow updateRow = gvOsobe.Rows[e.RowIndex];

            TextBox tbIme = (TextBox)updateRow.Cells[0].Controls[1];
            TextBox tbPrezime = (TextBox)updateRow.Cells[1].Controls[1];
            TextBox tbEmail = (TextBox)updateRow.Cells[2].Controls[1];
            TextBox tbEmail2 = (TextBox)updateRow.Cells[2].Controls[7];
            TextBox tbEmail3 = (TextBox)updateRow.Cells[2].Controls[11];
            TextBox tbTelefon = (TextBox)updateRow.Cells[3].Controls[1];
            DropDownList ddlStatus = (DropDownList)updateRow.Cells[4].Controls[1];

            Osoba osoba = new Osoba();
            osoba.Ime = tbIme.Text;
            osoba.Prezime = tbPrezime.Text;
            osoba.Telefon = tbTelefon.Text;
            osoba.Email = tbEmail.Text;
            osoba.Email2 = tbEmail2.Text;
            osoba.Email3 = tbEmail3.Text;
            osoba.Status = int.Parse(ddlStatus.SelectedValue);
            osoba.IDOsoba = (int)gvOsobe.DataKeys[e.RowIndex].Value;

            try
            {
                referada.AzurirajOsobu(osoba);
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
            }

            Osoba trenutniLogin = (Osoba)Session["TrenutniLogin"];
            if (osoba.IDOsoba == trenutniLogin.IDOsoba)
            {
                Session.Remove("TrenutniLogin");
                Session["TrenutniLogin"] = osoba;
            }

            gvOsobe.EditIndex = -1;
            GridViewDataBind();
        }

        protected void btnOdjava_Click(object sender, EventArgs e)
        {
            Session.Remove("TrenutniLogin");
            Response.Redirect("Login.aspx");
        }

        protected void btnUredi_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int osobaID = int.Parse(btn.CommandArgument);

            OsobaID = osobaID;

            Response.Redirect("UrediOsobu.aspx");
        }

    }
}