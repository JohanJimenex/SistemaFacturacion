using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaFacturacion
{
    public partial class Login : System.Web.UI.Page
    {
        // Evento que se ejecuta al hacer clic en el botón de inicio de sesión
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Obtener los valores ingresados por el usuario en los campos de texto
            string username = txtUsername.Text.Trim(); // Nombre de usuario
            string password = txtPassword.Text.Trim(); // Contraseña

            // Obtener la cadena de conexión desde el archivo Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            // Crear una conexión a la base de datos utilizando la cadena de conexión
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                // Configurar el comando SQL para llamar al procedimiento almacenado "sp_CheclLogin"
                SqlCommand cmd = new SqlCommand("sp_CheclLogin", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                // Agregar los parámetros requeridos por el procedimiento almacenado
                cmd.Parameters.AddWithValue("@Usuario", username); // Parámetro para el nombre de usuario
                cmd.Parameters.AddWithValue("@Clave", password); // Parámetro para la contraseña

                try
                {
                    // Abrir la conexión a la base de datos
                    conn.Open();

                    // Ejecutar el comando y obtener los resultados
                    SqlDataReader reader = cmd.ExecuteReader();

                    // Verificar si el procedimiento almacenado devolvió filas (usuario válido)
                    if (reader.HasRows)
                    {
                        // Leer los datos del usuario
                        reader.Read();
                        string nombre = reader["Log_Nombre"].ToString(); // Nombre completo del usuario
                        string nickname = reader["Log_NickName"].ToString(); // Apodo del usuario

                        // Guardar los datos del usuario en la sesión
                        Session["Usuario"] = username;
                        Session["Nombre"] = nombre;
                        Session["Nick"] = nickname;

                        // Establecer la cookie de autenticación
                        // para poder validar con el metodoContext.User.Identity.IsAuthenticated en site.master
                        FormsAuthentication.SetAuthCookie(username, false);

                        // Redirigir al usuario a la página "About.aspx"
                        Response.Redirect("~/Default.aspx");

                        // Completar la solicitud actual para evitar procesamiento adicional
                        Context.ApplicationInstance.CompleteRequest();
                    }
                    else
                    {
                        // Mostrar un mensaje de error si las credenciales son incorrectas
                        lblMessage.Text = "Usuario o contraseña incorrectos.";
                    }
                }
                catch (Exception ex)
                {
                    // Manejar errores de conexión o ejecución y mostrar un mensaje genérico
                    lblMessage.Text = "Error al conectar con la base de datos.";
                }
            }
        }
    }
}
