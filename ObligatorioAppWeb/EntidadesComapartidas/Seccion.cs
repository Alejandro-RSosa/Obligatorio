using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
    public class Seccion
    {
        //Atributos
        string codigo;
        string nombre;

        //Propiedades
        public string Codigo
        {
            get { return codigo; }
            set
            {
                if (value.Length != 3)
                {
                    throw new Exception("El codigo debe ser de 3 caracteres");
                }
                for (int i = 0; i < value.Length; i++)
                {
                    if (Char.IsNumber(value, i))
                        throw new Exception("El codigo se conforma solo de 3 letras");
                }                
                codigo = value.Trim().ToUpper();
            }
        }

        public string Nombre
        {
            get { return nombre; }
            set
            {
                if (value.Trim() == "")
                {
                    throw new Exception("Debe ingresar un nombre");
                }
                else if (value.Trim().Length > 20)
                    throw new Exception("El nombre no puede exceder los 20 caracteres");
                nombre = value.Trim().ToUpper();
            }
        }

        // Constructor
        public Seccion(string pCodigo, string pNombre)
        {
            Codigo = pCodigo;
            Nombre = pNombre;
        }

        //Operaciones
        public override string ToString()
        {
            return ("Codigo: " + codigo + "\tNombre: " + nombre);
        }

    }
}
