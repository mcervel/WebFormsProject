using Microsoft.ApplicationBlocks.Data;
using Projekt.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;

namespace Projekt.DAL
{
    public class Repository : IRepo
    {
        private static string cs = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        public Repository()
        {
        }

        public int DodajOsobu(Osoba o)
        {
            return SqlHelper.ExecuteNonQuery(cs, "DodajOsobu", o.Ime, o.Prezime, o.Email, o.Email2, o.Email3, o.Telefon, o.Grad, o.Status, o.Lozinka);
        }
        
        public List<Osoba> DobaviOsobe()
        {
            List<Osoba> osobe = new List<Osoba>();
            DataSet ds = SqlHelper.ExecuteDataset(cs, "DobaviOsobe");

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                osobe.Add(new Osoba
                {
                    IDOsoba = (int)row["IDOsoba"],
                    Ime = row["Ime"].ToString(),
                    Prezime = row["Prezime"].ToString(),
                    Email = row["Email"].ToString(),
                    Email2 = row["Email2"].ToString(),
                    Email3 = row["Email3"].ToString(),
                    Telefon = row["Telefon"].ToString(),
                    Grad = row["Grad"].ToString(),
                    Status = (int)row["StatusOsobe"],
                    Lozinka = row["Lozinka"].ToString()
                });
            }
            return osobe;
        }

        public int ObrisiOsobu (int idOsoba) => SqlHelper.ExecuteNonQuery(cs, nameof(ObrisiOsobu), idOsoba);

        public int AzurirajOsobuMail1(Osoba osoba) => SqlHelper.ExecuteNonQuery(cs, nameof(AzurirajOsobuMail1), osoba.IDOsoba, osoba.Ime, osoba.Prezime, osoba.Email, osoba.Telefon, osoba.Grad, osoba.Status, osoba.Lozinka);

        public int AzurirajOsobuMail2(Osoba osoba) => SqlHelper.ExecuteNonQuery(cs, nameof(AzurirajOsobuMail2), osoba.IDOsoba, osoba.Ime, osoba.Prezime, osoba.Email2, osoba.Telefon, osoba.Grad, osoba.Status, osoba.Lozinka);

        public int AzurirajOsobuMail3(Osoba osoba) => SqlHelper.ExecuteNonQuery(cs, nameof(AzurirajOsobuMail3), osoba.IDOsoba, osoba.Ime, osoba.Prezime, osoba.Email3, osoba.Telefon, osoba.Grad, osoba.Status, osoba.Lozinka);

        public bool ValidirajOsobu(Osoba o)
        {
            bool status = false;

            DataSet ds = SqlHelper.ExecuteDataset(cs, "ValidirajOsobu", o.Email, o.Lozinka);

            if (ds.Tables[0].Rows.Count > 0)
            {
                status = true;
            }
            return status;
        }

        public Osoba DobaviOsobu(string email)
        {
            Osoba osoba = new Osoba();
            DataSet ds = SqlHelper.ExecuteDataset(cs, "DobaviOsobu", email);


            foreach (DataRow row in ds.Tables[0].Rows)
            {
                osoba = new Osoba
                {
                    IDOsoba = (int)row["IDOsoba"],
                    Ime = row["Ime"].ToString(),
                    Prezime = row["Prezime"].ToString(),
                    Email = row["Email"].ToString(),
                    Email2 = row["Email2"].ToString(),
                    Email3 = row["Email3"].ToString(),
                    Telefon = row["Telefon"].ToString(),
                    Grad = row["Grad"].ToString(),
                    Status = (int)row["StatusOsobe"],
                    Lozinka = row["Lozinka"].ToString()
                };
            }
            return osoba;
        }

        public Osoba DobaviOsobuZaId(int idOsoba)
        {
            Osoba osoba = new Osoba();
            DataSet ds = SqlHelper.ExecuteDataset(cs, "DobaviOsobuZaId", idOsoba);


            foreach (DataRow row in ds.Tables[0].Rows)
            {
                osoba = new Osoba
                {
                    IDOsoba = idOsoba,
                    Ime = row["Ime"].ToString(),
                    Prezime = row["Prezime"].ToString(),
                    Email = row["Email"].ToString(),
                    Email2 = row["Email2"].ToString(),
                    Email3 = row["Email3"].ToString(),
                    Telefon = row["Telefon"].ToString(),
                    Grad = row["Grad"].ToString(),
                    Status = (int)row["StatusOsobe"],
                    Lozinka = row["Lozinka"].ToString()
                };
            }
            return osoba;
        }

        public int AzurirajEmail1Osobe(Osoba osoba) => SqlHelper.ExecuteNonQuery(cs, nameof(AzurirajEmail1Osobe), osoba.IDOsoba, osoba.Email);

        public int AzurirajEmail2Osobe(Osoba osoba) => SqlHelper.ExecuteNonQuery(cs, nameof(AzurirajEmail2Osobe), osoba.IDOsoba, osoba.Email2);

        public int AzurirajEmail3Osobe(Osoba osoba) => SqlHelper.ExecuteNonQuery(cs, nameof(AzurirajEmail3Osobe), osoba.IDOsoba, osoba.Email3);

        public int AzurirajOsobu(Osoba osoba) => SqlHelper.ExecuteNonQuery(cs, nameof(AzurirajOsobu), osoba.IDOsoba, osoba.Ime, osoba.Prezime, osoba.Email, osoba.Email2, osoba.Email3, osoba.Telefon, osoba.Status);
    }
}