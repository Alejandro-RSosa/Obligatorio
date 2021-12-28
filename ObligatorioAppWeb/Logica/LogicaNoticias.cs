using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Persistencia;
using EntidadesCompartidas;

namespace Logica
{
    public class LogicaNoticias
    {
        public static int Agregar(Noticia pNoticia)
        {
            
            if (pNoticia is Nacional)
                return PersistenciaNacional.Agregar((Nacional)pNoticia);
            else
                return PersistenciaInternacional.Agregar((Internacional)pNoticia);            
        }

        public static List<Noticia> ListarNoticias()
        {
            List<Noticia> allNoticias = PersistenciaNacional.ListarNoticiasNacional();
            allNoticias.AddRange(PersistenciaInternacional.ListarNoticiasInternacional());

            return OrdenarLista(allNoticias);
        }

        public static List<Noticia> ListarNoticias(Seccion pSeccion)
        {
            return PersistenciaNacional.ListarNoticiasNacional(pSeccion);
        }

        public static List<Noticia> OrdenarLista(List<Noticia> pList)
        {
            for (int i = 0; i < (pList.Count - 1); i++)
            {
                for (int j = i + 1; j < pList.Count; j++)
                {
                    if (pList[i].Id > pList[j].Id)
                    {
                        Noticia variableauxiliar = pList[i];
                        pList[i] = pList[j];
                        pList[j] = variableauxiliar;
                    }
                }
            }
            return pList;
        }
    }
}
