using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using EntidadesCompartidas;
using Persistencia;


namespace Logica
{
    public class LogicaPeriodista
    {
        public static void Agregar(Periodista pPeriodista)
        {
            PersistenciaPeriodista.Agregar(pPeriodista);
        }

        public static Periodista Buscar(int pCodPeri)
        {
            return PersistenciaPeriodista.Buscar(pCodPeri);
        }

        public static void Modificar(Periodista pPeriodista)
        {
            PersistenciaPeriodista.Modificar(pPeriodista);
        }

        public static void Eliminar(Periodista pPeriodista)
        {
            PersistenciaPeriodista.Eliminar(pPeriodista);
        }
    }
}
