using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProyectoPlantasNegocio
{
    internal interface IPersistente
    {
        bool Create();
        bool Read(int Id);
        bool Update(int Id);
        bool Delete(int Id);
    }
}
