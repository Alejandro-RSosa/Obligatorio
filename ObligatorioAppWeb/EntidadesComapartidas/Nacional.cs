using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
    public class Nacional : Noticia
    {
        //Atributo
        Seccion seccion;

        //Propiedad
        public Seccion Seccion
        {
            get { return seccion; }
            set
            {
                if (value == null)
                {
                    throw new Exception("Debe tener una seccion valida asignada");
                }
                seccion = value;
            }
        }

        //Constructor
        public Nacional(int pId, DateTime pFechaHora, string pTitulo, string pResumen, string pContenido, Periodista pPeriodista, Seccion pSeccion)
            : base(pId, pFechaHora, pTitulo, pResumen, pContenido, pPeriodista)
        {
            Seccion = pSeccion;
        }

        //Operaciones
        public override string ToString()
        {
            return base.ToString() + "\nSECCION - " + seccion +
                "\n----------------------------------------------------------------------------------------------------";
        }

    }
}
