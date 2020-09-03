using Projekt.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Projekt.Controls
{
    public partial class EmailUserControl : System.Web.UI.UserControl
    {
        public string TbEmailValue {
            get {
                return tbEmail.Text;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            tbEmail.ID = "tbEmail" + this.ID;
            validatorEmail.ControlToValidate = "tbEmail" + this.ID;
        }

    }
}