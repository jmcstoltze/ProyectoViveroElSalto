using ProyectoPlantasDALC;
using ProyectoPlantasGUI.Views;
using ProyectoPlantasNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ProyectoPlantasGUI
{
    /// <summary>
    /// Lógica de interacción para MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            WindowStartupLocation = WindowStartupLocation.CenterScreen; // Posicionamiento al centro de la pantalla
        }

        private void btnIniciarSesion_Click(object sender, RoutedEventArgs e)
        {                                  
            try
            {
                string username = txtUsuario.Text;
                string password = txtPassword.Password;

                ElSaltoEntities elsalto = new ElSaltoEntities();
                var response = elsalto.spLogin(username);

                // Obtiene el nombre de usuario (también pudiera haberse realizado con un procedimiento en la entidad)
                // var user = elsalto.VwGetLogin.FirstOrDefault(u => u.Username == username); 

                SALT_Helper salt_helper = new SALT_Helper();

                // lblMensaje.Content = response.First();

                bool res = SALT_Helper.ValidateSaltyPassword(password, response.First());

                if (res)
                {
                    // lblMensaje.Content = "Sesión iniciada correctamente";

                    // Redirige a la Ventala Principal con el username como contexto
                    Ventana_Principal ventana_principal = new Ventana_Principal(username);                    
                    ventana_principal.Owner = this; // La instancia hereda de la main window
                    ventana_principal.ShowDialog();
                    this.Close();
                }
                else
                {
                    lblMensaje.Content = "La contraseña no coincide";
                }
            }
            catch(Exception ex)
            {
                lblMensaje.Content = ex.Message;
            }         
        }
    }
}
