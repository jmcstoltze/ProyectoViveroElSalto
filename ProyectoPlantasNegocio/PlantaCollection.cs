using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProyectoPlantasNegocio
{
    public class PlantaCollection
    {
        public List<Planta> ReadAll()
        {
            var plantas = CommonBC.PlantaModelo.VwGetPlantas;
            return ObtenerPlantas(plantas.ToList());
        }

        private List<Planta> ObtenerPlantas(List<ProyectoPlantasDALC.VwGetPlantas> plantasDALC)
        {
            List<Planta> plantaList = new List<Planta>();
            foreach (ProyectoPlantasDALC.VwGetPlantas planta in plantasDALC)
            {

                Planta p = new Planta();
                p.Id = planta.Id;
                p.NombreComun = AES_Helper.DecryptString(planta.NombreComun);
                p.NombreCientifico = AES_Helper.DecryptString(planta.NombreCientifico);
                p.TipoPlanta = planta.TipoPlanta;
                p.Descripcion = AES_Helper.DecryptString(planta.Descripcion);
                p.TiempoRiego = planta.TiempoRiego;
                p.CantidadAgua = planta.CantidadAgua;
                p.Epoca = planta.Epoca;                
                p.EsVenenosa = Convert.ToBoolean(planta.EsVenenosa);
                p.EsAutoctona = Convert.ToBoolean(planta.EsAutoctona);

                plantaList.Add(p);
            }
            return plantaList;
        }
    }
}
