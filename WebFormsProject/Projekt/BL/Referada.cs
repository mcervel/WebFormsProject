using Projekt.DAL;
using Projekt.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Projekt.BL
{
    public class Referada
    {
        private IRepo repo;

        public List<Osoba> DobaviOsobe()
        {
            repo = RepoFactory.GetRepo();
            return repo.DobaviOsobe();
        }

        public int ObrisiOsobu(int IDOsoba)
        {
            repo = RepoFactory.GetRepo();
            return repo.ObrisiOsobu(IDOsoba);
        }

        public int AzurirajOsobuMail1(Osoba osoba)
        {
            repo = RepoFactory.GetRepo();
            return repo.AzurirajOsobuMail1(osoba);
        }

        public int AzurirajOsobuMail2(Osoba osoba)
        {
            repo = RepoFactory.GetRepo();
            return repo.AzurirajOsobuMail2(osoba);
        }

        public int AzurirajOsobuMail3(Osoba osoba)
        {
            repo = RepoFactory.GetRepo();
            return repo.AzurirajOsobuMail3(osoba);
        }
        public int DodajOsobu(Osoba o)
        {
            repo = RepoFactory.GetRepo();
            return repo.DodajOsobu(o);
        }

        public bool ValidirajOsobu(Osoba o)
        {
            repo = RepoFactory.GetRepo();
            return repo.ValidirajOsobu(o);
        }

        public Osoba DobaviOsobu(string email)
        {
            repo = RepoFactory.GetRepo();
            return repo.DobaviOsobu(email);
        }

        public Osoba DobaviOsobuZaId(int idOsoba)
        {
            repo = RepoFactory.GetRepo();
            return repo.DobaviOsobuZaId(idOsoba);
        }

        public int AzurirajEmail1Osobe(Osoba osoba)
        {
            repo = RepoFactory.GetRepo();
            return repo.AzurirajEmail1Osobe(osoba);
        }

        public int AzurirajEmail2Osobe(Osoba osoba)
        {
            repo = RepoFactory.GetRepo();
            return repo.AzurirajEmail2Osobe(osoba);
        }

        public int AzurirajEmail3Osobe(Osoba osoba)
        {
            repo = RepoFactory.GetRepo();
            return repo.AzurirajEmail3Osobe(osoba);
        }

        public int AzurirajOsobu(Osoba osoba)
        {
            repo = RepoFactory.GetRepo();
            return repo.AzurirajOsobu(osoba);
        }

    }
}