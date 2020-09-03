CREATE DATABASE RWAProjekt
use RWAProjekt

CREATE TABLE Osoba
(
IDOsoba int CONSTRAINT PK_Osoba PRIMARY KEY IDENTITY,
Ime nvarchar (50) NOT NULL,
Prezime nvarchar (50) NOT NULL,
Email nvarchar (50) NOT NULL,
Email2 nvarchar (50) NULL,
Email3 nvarchar (50) NULL,
Telefon nvarchar (50) NULL,
Grad nvarchar (50) NOT NULL,
StatusOsobe int NOT NULL,
Lozinka nvarchar(50) NOT NULL
)
