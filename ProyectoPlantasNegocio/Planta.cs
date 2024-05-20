using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProyectoPlantasNegocio
{
    // Se define la clase Planta que hereda de ObservableObject, IPersistente Y IDataInfo
    public class Planta : ObservableObject, IPersistente, IDataErrorInfo
    {

        // Diccionario que almacenará los mensajes de error
        public Dictionary<string, string> ErrorCollection { get; private set; } = new Dictionary<string, string>();

        public int Id { get; set; }

        // Variables privadas
        private string _NombreComun;
        private string _NombreCientifico;
        private string _TipoPlanta;
        private string _Descripcion;

        private int _TiempoRiego;
        private int _CantidadAgua;

        private string _Epoca;

        private bool _EsVenenosa;
        private bool _EsAutoctona;

        // Manejo de las propiedades observables
        public string NombreComun
        {

            get { return _NombreComun; }
            set
            {
                OnPropertyChanged(ref _NombreComun, value);
            }
        }
        public string NombreCientifico
        {

            get { return _NombreCientifico; }
            set
            {
                OnPropertyChanged(ref _NombreCientifico, value);
            }
        }
        public string TipoPlanta
        {

            get { return _TipoPlanta; }
            set
            {
                OnPropertyChanged(ref _TipoPlanta, value);
            }
        }
        public string Descripcion
        {

            get { return _Descripcion; }
            set
            {
                OnPropertyChanged(ref _Descripcion, value);
            }
        }
        public int TiempoRiego
        {

            get { return _TiempoRiego; }
            set
            {
                OnPropertyChanged(ref _TiempoRiego, value);
            }
        }
        public int CantidadAgua
        {

            get { return _CantidadAgua; }
            set
            {
                OnPropertyChanged(ref _CantidadAgua, value);
            }
        }
        public string Epoca
        {

            get { return _Epoca; }
            set
            {
                OnPropertyChanged(ref _Epoca, value);
            }
        }       
        public bool EsVenenosa
        {

            get { return _EsVenenosa; }
            set
            {
                OnPropertyChanged(ref _EsVenenosa, value);
            }
        }
        public bool EsAutoctona
        {

            get { return _EsAutoctona; }
            set
            {
                OnPropertyChanged(ref _EsAutoctona, value);
            }
        }
        public string Error { get { return null; } }
        public string this[string name]
        {
            get
            {
                string res = null; // String del error que cambiará según el campo

                switch (name)
                {
                    case "NombreComun":

                        int lenComun = NombreComun?.Length ?? 0;

                        if (string.IsNullOrEmpty(NombreComun))
                            res = "Este campo es obligatorio";

                        if (lenComun < 3)
                            res = "Mínimo 3 caracteres";

                        if (lenComun > 100)
                            res = "Máximo 100 caracteres";
                        break;

                    case "NombreCientifico":

                        int lenCientifico = NombreCientifico?.Length ?? 0;

                        if (string.IsNullOrEmpty(NombreCientifico))
                            res = "Este campo es obligatorio";

                        if (lenCientifico < 10)
                            res = "Mínimo 10 caracteres";

                        if (lenCientifico > 150)
                            res = "Máximo 150 caracteres";
                        break;

                    case "TiempoRiego":
                        int cantTiempo = Convert.ToInt32(TiempoRiego);

                        if (cantTiempo < 1)
                            res = "La cantidad de agua es obligatoria";
                        break;

                    case "CantidadAgua":
                        int cantAgua = Convert.ToInt32(CantidadAgua);

                        if (cantAgua < 1)
                            res = "La cantidad de agua es obligatoria";
                        break;

                    case "TipoPlanta":
                        if (string.IsNullOrEmpty(TipoPlanta) || TipoPlanta == "Seleccionar")
                            res = "Debe seleccionar un tipo de planta válido";
                        break;

                    case "Epoca":
                        if (string.IsNullOrEmpty(Epoca) || Epoca == "Seleccionar")
                            res = "Debe seleccionar una época del año válida";
                        break;
                }
                 
                if (res != null)
                    ErrorCollection[name] = res; // Utilizar el nombre de la propiedad como clave en lugar del valor del error

                OnPropertyChanged("ErrorCollection"); // Asegurarse de que se notifiquen los cambios en la colección de errores

                return res;
            }
        }

        // Método para crear registro de un equipo
        public bool Create()
        {
            try
            {
                // Manejo de la descripción y valor por defecto
                string descripcion = string.IsNullOrWhiteSpace(this.Descripcion) ? "Sin información" : this.Descripcion;
                string descripcionEncriptada = AES_Helper.EncryptString(descripcion);

                CommonBC.PlantaModelo.spPlantaSave(

                    AES_Helper.EncryptString(this.NombreComun),
                    AES_Helper.EncryptString(this.NombreCientifico),
                    this.TipoPlanta,
                    // AES_Helper.EncryptString(this.Descripcion),
                    descripcionEncriptada,
                    this.TiempoRiego,
                    this.CantidadAgua,
                    this.Epoca,
                    this.EsVenenosa,
                    this.EsAutoctona                    
                    );

                CommonBC.PlantaModelo.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        // Método para leer registro de un equipo
        public bool Read(int Id)
        {
            try
            {
                ProyectoPlantasDALC.VwGetPlantas planta = CommonBC.PlantaModelo.VwGetPlantas.First(p => p.Id == Id);

                this.Id = planta.Id;
                this.NombreComun = AES_Helper.DecryptString(planta.NombreComun);
                this.NombreCientifico = AES_Helper.DecryptString(planta.NombreCientifico);
                this.TipoPlanta = planta.TipoPlanta;
                this.Descripcion = AES_Helper.DecryptString(planta.Descripcion);
                this.TiempoRiego = planta.TiempoRiego;
                this.CantidadAgua = planta.CantidadAgua;
                this.Epoca = planta.Epoca;
                this.EsVenenosa = Convert.ToBoolean(planta.EsVenenosa);
                this.EsAutoctona = Convert.ToBoolean(planta.EsAutoctona);

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        // Método para actualizar registro de un equipo
        public bool Update(int Id)
        {
            try
            {
                this.NombreComun = AES_Helper.EncryptString(this.NombreComun);
                this.NombreCientifico = AES_Helper.EncryptString(this.NombreCientifico);
                // this.TipoPlanta = this.TipoPlanta;
                this.Descripcion = AES_Helper.EncryptString(this.Descripcion);
                
                // this.TiempoRiego = this.TiempoRiego;
                // this.CantidadAgua = this.CantidadAgua;
                // this.Epoca = this.Epoca;
                // this.EsVenenosa = this.EsVenenosa;
                // this.EsAutoctona = this.EsVenenosa;

                CommonBC.PlantaModelo.spPlantaUpdateById(
                    Id,
                    this.NombreComun,
                    this.NombreCientifico,
                    this.TipoPlanta,
                    this.Descripcion,
                    this.TiempoRiego,
                    this.CantidadAgua,
                    this.Epoca,
                    this.EsVenenosa,
                    this.EsAutoctona
                );

                CommonBC.PlantaModelo.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        // Método para eliminar registro de equipo
        public bool Delete(int EquipoId)
        {
            try
            {
                CommonBC.PlantaModelo.spPlantaDeleteById(Id);
                CommonBC.PlantaModelo.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}
