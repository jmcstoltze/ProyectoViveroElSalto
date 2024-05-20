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
using System.Windows.Shapes;

namespace ProyectoPlantasGUI.Views
{
    /// <summary>
    /// Lógica de interacción para ListarPlantas.xaml
    /// </summary>
    public partial class ListarPlantas : Window
    {

        ProyectoPlantasNegocio.Planta planta;
        public ListarPlantas()
        {
            InitializeComponent();
            WindowStartupLocation = WindowStartupLocation.CenterOwner; // Posición en base a la ventana principal
            planta = new ProyectoPlantasNegocio.Planta();
            this.DataContext = planta; // Vincula la interfaz con las propiedades de la instancia
            CargarGrilla();
        }

        private void btnActualizar_Click(object sender, RoutedEventArgs e)
        {
            var filaSeleccionada = (ProyectoPlantasNegocio.Planta)dgListadoPlantas.SelectedItem;
            int Id = filaSeleccionada.Id;
            ActualizarPlanta actualizarPlanta = new ActualizarPlanta(Id);
            actualizarPlanta.Owner = this; // La instancia hereda de la ventana principal
            actualizarPlanta.ShowDialog();
        }

        private void btnEliminar_Click(Object sender, RoutedEventArgs e)
        {
            EliminarRegistro();
        }

        private void CargarGrilla()
        {
            ProyectoPlantasNegocio.PlantaCollection plantaCollection = new ProyectoPlantasNegocio.PlantaCollection();
            dgListadoPlantas.ItemsSource = plantaCollection.ReadAll();
        }

        private void EliminarRegistro()
        {
            var filaSeleccionada = (ProyectoPlantasNegocio.Planta)dgListadoPlantas.SelectedItem;
            int Id = filaSeleccionada.Id;

            string header = string.Format("Eliminar registro {0}", Id);
            string message = string.Format("¿Deseas eliminar el registro {0}?", Id);

            MessageBoxButton buttons = MessageBoxButton.YesNo;
            MessageBoxResult result = MessageBox.Show(header, message, buttons);

            if (result == MessageBoxResult.Yes)
            {
                // Se muestra caja de mensaje si el resultado del request delete es true o false 
                var response = filaSeleccionada.Delete(Id) ?
                MessageBox.Show("Registro eliminado") :
                MessageBox.Show("No se pudo eliminar el registro");

            }
        }


        private void Window_Activated(object sender, EventArgs e)
        {
            CargarGrilla();
        }
    }
}
