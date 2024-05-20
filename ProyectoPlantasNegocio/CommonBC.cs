using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProyectoPlantasNegocio
{
    public class CommonBC
    {
        private static ProyectoPlantasDALC.ElSaltoEntities _plantaModelo;

        public static ProyectoPlantasDALC.ElSaltoEntities PlantaModelo
        {
            get
            {
                if (_plantaModelo == null)
                {
                    _plantaModelo = new ProyectoPlantasDALC.ElSaltoEntities();
                }
                return _plantaModelo;
            }

        }
    }
}
