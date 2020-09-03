using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Projekt.Models
{
    public class Osoba
    {
        public int? IDOsoba { get; set; }
        public string Ime { get; set; }
        public string Prezime { get; set; }
        public string Email { get; set; }
        public string Email2 { get; set; }
        public string Email3 { get; set; }

        public string Telefon { get; set; }
        public string Grad { get; set; }
        public int Status { get; set; }
        public string Lozinka { get; set; }

        public Osoba()
        {

        }

        public Osoba(string ime, string prezime, string email, string email2, string email3, string telefon, string grad, int status)
        {

        }

        public override string ToString()
        {
            return string.Format($"IDOsoba: {IDOsoba} Ime: {Ime} Prezime: {Prezime} Email: {Email} Telefon: {Telefon} Grad: {Grad} Status: {Status} ");
        }
    }
}