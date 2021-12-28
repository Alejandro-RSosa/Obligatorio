using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using EntidadesCompartidas;
using Persistencia;

namespace Logica
{
    public class LogicaSecciones
    {
        public static Seccion Buscar(string pCodSec)
        {
            return PersistenciaSeccion.Buscar(pCodSec);
        }

        public static void Agregar(Seccion pSeccion)
        {
            PersistenciaSeccion.Agregar(pSeccion);
        }

        public static void Modificar(Seccion pSeccion)
        {
            PersistenciaSeccion.Modificar(pSeccion);
        }

        public static void Eliminar(Seccion pSeccion)
        {
            PersistenciaSeccion.Eliminar(pSeccion);
        }

        public static List<Seccion> ListarSecciones()
        {
            return PersistenciaSeccion.ListarSecciones();
        }
    }
}
