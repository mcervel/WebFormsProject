using Projekt.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Projekt
{
    public partial class Projekt : System.Web.UI.MasterPage
    {
        public string Naslov { get; set; } = "Login";
        public string ErrorMessage { get; set; } = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

    }
}