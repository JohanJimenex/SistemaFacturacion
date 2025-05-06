using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaFacturacion
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Verifica si la página se está cargando por primera vez (no es un postback).
            if (!Page.IsPostBack)
            {
                // Comprueba si el usuario no está autenticado y si la página actual no es "Login.aspx".
                if (!Context.User.Identity.IsAuthenticated && !Request.Url.AbsolutePath.EndsWith("Login.aspx"))
                {
                    // Redirige al usuario a la página de inicio de sesión.
                    Response.Redirect("~/Login.aspx", false);
                }
            }
        }

        //Metodo para cerrar sesión
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Cierra la sesión
            Session.Clear();
            Session.Abandon();

            // Elimina autenticación Forms si la estás usando
            if (Request.Cookies[".ASPXAUTH"] != null)
            {
                var cookie = new HttpCookie(".ASPXAUTH");
                cookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(cookie);
            }

            // Redirige al login
            Response.Redirect("~/Login.aspx", false);
        }

    }
}
