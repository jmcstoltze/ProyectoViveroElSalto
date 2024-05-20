using ProyectoPlantasGUI.Classes;
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
    /// Lógica de interacción para ActualizarPlanta.xaml
    /// </summary>
    public partial class ActualizarPlanta : Window
    {

        ProyectoPlantasNegocio.Planta planta;
        public ActualizarPlanta(int Id)
        {
            InitializeComponent();            
            WindowStartupLocation = WindowStartupLocation.CenterOwner; // Posición en base a la ventana principal
            planta = new ProyectoPlantasNegocio.Planta();
            this.DataContext = planta; // Vincula la interfaz con las propiedades de la instancia
            CargarFormulario(Id);

        }

        private void btnActualizarPlanta_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                ProyectoPlantasNegocio.Planta planta = new ProyectoPlantasNegocio.Planta();
                planta.Id = Convert.ToInt32(txtId.Text);
                planta.NombreComun = txtNombreComun.Text;
                planta.NombreCientifico = txtNombreCientifico.Text;

                planta.TipoPlanta = cmbTipoPlanta.Text;

                planta.Descripcion = txtDescripcion.Text;

                planta.TiempoRiego = Convert.ToInt32(txtTiempoRiego.Text);
                planta.CantidadAgua = Convert.ToInt32(txtCantidadAgua.Text);

                planta.Epoca = cmbEpoca.Text;

                planta.EsVenenosa = (chkEsVenenosa.IsChecked.Value) ? true : false;
                planta.EsAutoctona = (chkEsAutoctona.IsChecked.Value) ? true : false;

                int Id = planta.Id;
                bool response = planta.Update(Id);

                if (response)
                {
                    MessageBox.Show("Registro actualizado exitosamente");
                    Close();
                }
                else
                {
                    MessageBox.Show("El registro no pudo ser actualizado");
                    Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void CheckTextInput(object sender, TextCompositionEventArgs e)
        {
            CommonValidations.CheckTextInput(sender, e);
        }

        private void CargarFormulario(int Id)
        {
            ProyectoPlantasNegocio.Planta planta = new ProyectoPlantasNegocio.Planta();
            bool response = planta.Read(Id);

            if (response)
            {
                txtId.Text = planta.Id.ToString();
                txtNombreComun.Text = planta.NombreComun;
                txtNombreCientifico.Text = planta.NombreCientifico;
                // cmbTipoPlanta.SelectedItem = planta.TipoPlanta;
                txtDescripcion.Text = planta.Descripcion;
                txtTiempoRiego.Text = planta.TiempoRiego.ToString();
                txtCantidadAgua.Text = planta.CantidadAgua.ToString();

                // Seleccionar el valor correcto del ComboBox para TipoPlanta
                cmbTipoPlanta.SelectedItem = cmbTipoPlanta.Items.Cast<ComboBoxItem>().FirstOrDefault(item => item.Content.ToString() == planta.TipoPlanta);

                // Seleccionar el valor correcto del ComboBox para Epoca
                cmbEpoca.SelectedItem = cmbEpoca.Items.Cast<ComboBoxItem>().FirstOrDefault(item => item.Content.ToString() == planta.Epoca);

                // cmbEpoca.SelectedItem = planta.Epoca;                
                chkEsVenenosa.IsChecked = (planta.EsVenenosa) ? true : false;
                chkEsAutoctona.IsChecked = (planta.EsAutoctona) ? true : false;                
            }
            else
            {
                MessageBox.Show("No se pudo encontrar el registro en el listado");
            }
        }
    }
}
