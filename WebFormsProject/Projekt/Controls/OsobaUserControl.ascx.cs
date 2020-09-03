using Projekt.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Projekt.Controls
{
    public partial class OsobaUserControl : System.Web.UI.UserControl
    {
        public delegate void OnUpdateClickEventHandler(Osoba osoba, int mail);
        public event OnUpdateClickEventHandler OnUpdateClick;

        public delegate void OnUpdateEmailClickEventHandler(Osoba osoba, int whicEmail);
        public event OnUpdateEmailClickEventHandler OnUpdateEmailClick;

        public delegate void OnDeleteClickEventHandler(int idOsoba);
        public event OnDeleteClickEventHandler OnDeleteClick;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void NapuniDDLStatus()
        {
            ddlStatus.Items.Add(new ListItem
            {
                Text = "Korisnik",
                Value = 0.ToString()
            });

            ddlStatus.Items.Add(new ListItem
            {
                Text = "Administrator",
                Value = 1.ToString()
            });
        }

        private void NapuniDDLGrad()
        {
            ddlGrad.Items.Add(new ListItem
            {
                Text = "Zagreb",
                Value = "Zagreb"
            });

            ddlGrad.Items.Add(new ListItem
            {
                Text = "Varazdin",
                Value = "Varazdin"
            });

            ddlGrad.Items.Add(new ListItem
            {
                Text = "Split",
                Value = "Split"
            });

            ddlGrad.Items.Add(new ListItem
            {
                Text = "Rijeka",
                Value = "Rijeka"
            });

            ddlGrad.Items.Add(new ListItem
            {
                Text = "Pula",
                Value = "Pula"
            });

            ddlEmail.Items.Add(new ListItem
            {
                Text = "Osijek",
                Value = "Osijek"
            });

            ddlEmail.Items.Add(new ListItem
            {
                Text = "Dubrovnik",
                Value = "Dubrovnik"
            });
        }



        public void NapuniOsobu(Osoba osoba)
        {
            this.ID = osoba.IDOsoba.ToString();

            NapuniDDLGrad();
            NapuniDDLStatus();
            IDOsoba.Value = osoba.IDOsoba.ToString();

            tbIme.Text = osoba.Ime;
            tbIme.ID = "tbIme" + this.ID;
            tbIme.ValidationGroup = "validationGroup" + this.ID;
            validatorIme.ControlToValidate = "tbIme" + this.ID;
            validatorIme.ValidationGroup = "validationGroup" + this.ID;

            tbPrezime.Text = osoba.Prezime;
            tbPrezime.ID = "tbPrezime" + this.ID;
            tbPrezime.ValidationGroup = "validationGroup" + this.ID;
            validatorPrezime.ControlToValidate = "tbPrezime" + this.ID;
            validatorPrezime.ValidationGroup = "validationGroup" + this.ID;

            tbEmail.Text = osoba.Email;
            tbEmail.ID = "tbEmail" + this.ID;
            tbEmail.ValidationGroup = "validationGroup" + this.ID;
            regularValidatorEmail.ControlToValidate = "tbEmail" + this.ID;
            regularValidatorEmail.ValidationGroup = "validationGroup" + this.ID;
            requiredValidatorEmail.ControlToValidate = "tbEmail" + this.ID;
            requiredValidatorEmail.ValidationGroup = "validationGroup" + this.ID;

            btnEdit.ValidationGroup = "validationGroup" + this.ID;
            validationSummary.ValidationGroup = "validationGroup" + this.ID;

            tbTelefon.Text = osoba.Telefon;
            tbLozinka.Text = osoba.Lozinka;
            ddlStatus.SelectedValue = osoba.Status.ToString();
            ddlGrad.SelectedValue = osoba.Grad;
            NapuniDDLEmail(osoba);
        }

        private void NapuniDDLEmail(Osoba osoba)
        {
            ddlEmail.Items.Clear();

            if (osoba.Email != String.Empty)
            {
                ddlEmail.Items.Add(new ListItem
                {
                    Text = osoba.Email,
                    Value = 0.ToString()
                });
            }

            if (osoba.Email2 != String.Empty)
            {
                ddlEmail.Items.Add(new ListItem
                {
                    Text = osoba.Email2,
                    Value = 1.ToString()
                });
            }

            if (osoba.Email3 != String.Empty)
            {
                ddlEmail.Items.Add(new ListItem
                {
                    Text = osoba.Email3,
                    Value = 2.ToString()
                });
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Osoba osoba;
            int mail = 0;

            if (ddlEmail.SelectedValue == "0")
            {
                osoba = new Osoba
                {
                    IDOsoba = int.Parse(IDOsoba.Value),
                    Ime = tbIme.Text,
                    Prezime = tbPrezime.Text,
                    Email = tbEmail.Text,
                    Telefon = tbTelefon.Text,
                    Lozinka = tbLozinka.Text,
                    Status = int.Parse(ddlStatus.SelectedValue),
                    Grad = ddlGrad.SelectedValue
                };
                mail = 1;
            }
            else if (ddlEmail.SelectedValue == "1")
            {
                osoba = new Osoba
                {
                    IDOsoba = int.Parse(IDOsoba.Value),
                    Ime = tbIme.Text,
                    Prezime = tbPrezime.Text,
                    Email2 = tbEmail.Text,
                    Telefon = tbTelefon.Text,
                    Lozinka = tbLozinka.Text,
                    Status = int.Parse(ddlStatus.SelectedValue),
                    Grad = ddlGrad.SelectedValue
                };
                mail = 2;
            }
            else
            {
                osoba = new Osoba
                {
                    IDOsoba = int.Parse(IDOsoba.Value),
                    Ime = tbIme.Text,
                    Prezime = tbPrezime.Text,
                    Email3 = tbEmail.Text,
                    Telefon = tbTelefon.Text,
                    Lozinka = tbLozinka.Text,
                    Status = int.Parse(ddlStatus.SelectedValue),
                    Grad = ddlGrad.SelectedValue
                };
                mail = 3;
            }

            OnUpdateClick.Invoke(osoba, mail);

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

            OnDeleteClick.Invoke(int.Parse(IDOsoba.Value));

        }

        protected void btnEmailEdit_Click(object sender, EventArgs e)
        {
            int whichEmail;
            Osoba osoba;


            if (ddlEmail.SelectedValue == "0")
            {
                osoba = new Osoba
                {
                    IDOsoba = int.Parse(IDOsoba.Value),
                    Email = tbEmail.Text
                };
                whichEmail = 1;
            }
            else if (ddlEmail.SelectedValue == "1")
            {
                osoba = new Osoba
                {
                    IDOsoba = int.Parse(IDOsoba.Value),
                    Email2 = tbEmail.Text
                };
                whichEmail = 2;
            }
            else
            {
                osoba = new Osoba
                {
                    IDOsoba = int.Parse(IDOsoba.Value),
                    Email3 = tbEmail.Text
                };
                whichEmail = 3;
            }

            OnUpdateEmailClick.Invoke(osoba, whichEmail);
        }
    }
}