using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
    public abstract class Noticia
    {
        //Atributos
        int id;
        DateTime fechaHora;
        string titulo;
        string resumen;
        string contenido;
        Periodista periodista;

        //Propiedades
        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        public DateTime FechaHora
        {
            get { return fechaHora; }
            set
            {
                if (value > DateTime.Now)
                {
                    throw new Exception("La fecha y hora no puede superar a la actual");
                }
                fechaHora = value;
            }
        }
        public string Titulo
        {
            get { return titulo; }
            set
            {
                if (value.Trim() == "")
                {
                    throw new Exception("Debe ingresar un Titulo");
                }
                else if (value.Trim().Length >= 30)
                    throw new Exception("El titulo no puede exceder los 30 caracteres");
                titulo = value.Trim();
            }
        }
        public string Resumen
        {
            get { return resumen; }
            set
            {
                if (value.Trim() == "")
                {
                    throw new Exception("Debe ingresar un Resumen");
                }
                else if (value.Trim().Length >= 100)
                    throw new Exception("El resumen no puede exceder los 100 caracteres");
                resumen = value.Trim();
            }
        }
        public string Contenido
        {
            get { return contenido; }
            set
            {
                if (value.Trim() == "")
                {
                    throw new Exception("Debe ingresar un contenido");
                }
                contenido = value.Trim();
            }
        }
        public Periodista Periodista
        {
            get { return periodista; }
            set
            {
                if (value == null)
                {
                    throw new Exception("Debe de haber un periodista asociado");
                }
                periodista = value;
            }
        }
        
        public string NombrePeri
        {
            get { return periodista.Nombre; }
        }

        //Constructor
        public Noticia(int pId, DateTime pFechaHora, string pTitulo, string pResumen, string pContenido, Periodista pPeriodista)
        {
            Id = pId;
            FechaHora = pFechaHora;
            Titulo = pTitulo;
            Resumen = pResumen;
            Contenido = pContenido;
            Periodista = pPeriodista;
        }

        //Operaciones
        public override string ToString()
        {
            return ("ID: " + id + "\nFECHA: " + fechaHora.ToShortDateString() + " HORA: " + fechaHora.ToShortTimeString() + "\n\nTITULO: " + titulo + "\nRESUMEN: " + resumen + "\n\nCONTENIDO: " + contenido + "\n\nPERIODISTA - " + periodista);
        }
    }
}
