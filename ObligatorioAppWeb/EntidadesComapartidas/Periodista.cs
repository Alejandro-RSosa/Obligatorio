using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
    public class Periodista
    {
        // Atributos
        int codigo;
        string nombre;
        string apellido;
        string email;

        // Propiedades
        public int Codigo
        {
            get { return codigo; }
            set
            {
                if (value < 0)
                    throw new Exception("El codigo no puede ser negativo");
                codigo = value;
            }
        }

        public string Nombre
        {
            get { return nombre; }
            set
            {
                if (value.Trim() == "")
                    throw new Exception("Debe escribir un nombre");
                else if (value.Trim().Length > 30)
                    throw new Exception("El nombre no puede exceder los 30 caracteres");
                nombre = value.Trim();
            }
        }

        public string Apellido
        {
            get { return apellido; }
            set
            {
                if (value.Trim() == "")
                    throw new Exception("Debe escribir un apellido");
                else if (value.Trim().Length > 30)
                    throw new Exception("El nombre no puede exceder los 30 caracteres");
                apellido = value.Trim();
            }
        }

        public string Email
        {
            get { return email; }
            set
            {
                if (value.Trim() == "")
                    throw new Exception("El correo no puede estar vacio");
                else if (value.Trim().Length > 30)
                    throw new Exception("El email no puede exceder los 30 caracteres");
                email = value.Trim();
            }
        }

        // Constructor completo
        public Periodista(int pCodigo, string pNombre, string pApellido, string pEmail)
        {
            Codigo = pCodigo;
            Nombre = pNombre;
            Apellido = pApellido;
            Email = pEmail;
        }

        // Operacion
        public override string ToString()
        {
            return ("Codigo: " + codigo + "\tNombre: " + nombre + "\tApellido: " + apellido + "\tEmail: " + email);
        }
    }
}
