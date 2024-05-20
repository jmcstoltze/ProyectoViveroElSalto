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
using System.Windows.Shapes;

namespace ProyectoPlantasGUI
{
    /// <summary>
    /// Lógica de interacción para Ventana_Principal.xaml
    /// </summary>
    public partial class Ventana_Principal : Window
    {
        public Ventana_Principal(string username)
        {
            InitializeComponent();
            WindowStartupLocation = WindowStartupLocation.CenterOwner; // Posición en base a la Main Window
            CargarGrilla();

            lblBienvenida.Content = "¡Bienvenido " + username + "!";
        }

        private void optAgregarNuevaPlanta_Click(object sender, RoutedEventArgs e)
        {
            Views.AgregarPlanta agregarPlanta = new Views.AgregarPlanta();
            agregarPlanta.Owner = this; // La instancia hereda de la ventana principal
            agregarPlanta.ShowDialog();
        }

        private void optListarPlantas_Click(object sender, RoutedEventArgs e)
        {
            Views.ListarPlantas listarPlantas = new Views.ListarPlantas();
            listarPlantas.Owner = this; // La instancia hereda de la ventana principal
            listarPlantas.ShowDialog();
        }

        private void CargarGrilla()
        {
            ProyectoPlantasNegocio.PlantaCollection plantasCollection = new ProyectoPlantasNegocio.PlantaCollection();
            dgListadoPlantas.ItemsSource = plantasCollection.ReadAll();
        }

        private void Window_Activated(object sender, EventArgs e)
        {
            CargarGrilla();
        }
        private void dgListadoPlantas_AutoGeneratingColumn(object sender, DataGridAutoGeneratingColumnEventArgs e)
        {
            if (e.Column.Header.ToString() == "Error" || e.Column.Header.ToString() == "ErrorCollection")
            {
                e.Column.Visibility = Visibility.Collapsed;
            }
        }
    }
}
