using Projekt.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Projekt.DAL
{
    public interface IRepo
    {
        int DodajOsobu(Osoba osoba);
        List<Osoba> DobaviOsobe();
        int ObrisiOsobu(int IDOsoba);
        int AzurirajOsobuMail1(Osoba osoba);
        int AzurirajOsobuMail2(Osoba osoba);

        int AzurirajOsobuMail3(Osoba osoba);
        bool ValidirajOsobu(Osoba o);
        Osoba DobaviOsobu(string email);
        Osoba DobaviOsobuZaId(int idOsoba);

        int AzurirajEmail1Osobe(Osoba osoba);
        int AzurirajEmail2Osobe(Osoba osoba);

        int AzurirajEmail3Osobe(Osoba osoba);

        int AzurirajOsobu(Osoba osoba);

    }
}