using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
    public class Internacional : Noticia
    {
        //Atributo
        string paisOrigen;

        //Propiedad
        public string PaisOrigen
        {
            get { return paisOrigen; }
            set
            {
                if (value.Trim() == "")
                {
                    throw new Exception("Debe ingresar un pais de origen");
                }
                paisOrigen = value.Trim().ToUpper();
            }
        }

        //Constructor
        public Internacional(int pId, DateTime pFechaHora, string pTitulo, string pResumen, string pContenido, Periodista pPeriodista, string pPaisOrigen)
            : base(pId, pFechaHora, pTitulo, pResumen, pContenido, pPeriodista)
        {
            PaisOrigen = pPaisOrigen;
        }

        //Operaciones
        public override string ToString()
        {
            return base.ToString() + "\nPAIS DE ORIGEN: " + paisOrigen +
                "\n----------------------------------------------------------------------------------------------------";
        }
    }
}
