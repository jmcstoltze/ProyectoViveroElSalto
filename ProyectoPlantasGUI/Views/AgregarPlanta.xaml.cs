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
    /// Lógica de interacción para AgregarPlanta.xaml
    /// </summary>
    public partial class AgregarPlanta : Window
    {

        ProyectoPlantasNegocio.Planta planta;
        public AgregarPlanta()
        {
            InitializeComponent();
            WindowStartupLocation = WindowStartupLocation.CenterOwner; // Posición en base a la ventana principal
            planta = new ProyectoPlantasNegocio.Planta();
            this.DataContext = planta; // Vincula la interfaz con las propiedades de la instancia

        }

        private void btnAgregarPlanta_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                ProyectoPlantasNegocio.Planta planta = new ProyectoPlantasNegocio.Planta();
                planta.NombreComun = txtNombreComun.Text;
                planta.NombreCientifico = txtNombreCientifico.Text;

                planta.TipoPlanta = cmbTipoPlanta.Text;

                planta.Descripcion = txtDescripcion.Text;

                planta.TiempoRiego = Convert.ToInt32(txtTiempoRiego.Text);
                planta.CantidadAgua = Convert.ToInt32(txtCantidadAgua.Text);

                planta.Epoca = cmbEpoca.Text;
                
                planta.EsVenenosa = (chkEsVenenosa.IsChecked.Value) ? true : false;
                planta.EsAutoctona = (chkEsAutoctona.IsChecked.Value) ? true : false;

                bool response = planta.Create();

                if (response)
                {
                    MessageBox.Show("Registro agregado con éxito");
                    AgregarRegistro();
                }
                else
                {
                    MessageBox.Show("No se pudo agregar equipo");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void AgregarRegistro()
        {
            string title = "Agregar Nuevo Registro";
            string message = "¿Desea agregar otro registro?";

            MessageBoxButton buttons = MessageBoxButton.YesNo;
            MessageBoxResult result = MessageBox.Show(title, message, buttons);

            if (result == MessageBoxResult.Yes)
            {
                LimpiarCampos();
            }
            else
            {
                this.Close();
            }
        }

        private void LimpiarCampos()
        {
            // Se limpian los campos del formulario

            txtNombreComun.Text = string.Empty;
            txtNombreCientifico.Text = string.Empty;

            cmbTipoPlanta.SelectedIndex = 0;

            txtDescripcion.Text = string.Empty;

            txtTiempoRiego.Text = string.Empty;
            txtCantidadAgua.Text = string.Empty;

            cmbEpoca.SelectedIndex = 0;
            
            chkEsVenenosa.IsChecked = false;
            chkEsAutoctona.IsChecked = false;
        }

        private void CheckTextInput(object sender, TextCompositionEventArgs e)
        {
            // Valida que se hayan ingresado solo número en el formulario
            Classes.CommonValidations.CheckTextInput(sender, e);
        }
    }

}
