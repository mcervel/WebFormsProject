use RWAProjekt

INSERT INTO Osoba (Ime, Prezime, Email, Email2, Email3, Telefon, Grad, StatusOsobe, Lozinka) VALUES ('Admin', 'Admin', 'admin@mail.hr', 'admin2@mail.hr', 'admin3@mail.hr', '123456789', 'Zagreb', 1, '123')
INSERT INTO Osoba (Ime, Prezime, Email, Email2, Email3, Telefon, Grad, StatusOsobe, Lozinka) VALUES ('Tomo', 'Tomic', 'tomo@mail.hr', 'tomo2@mail.hr', 'tomo3@mail.hr', '0133215435', 'Zagreb', 0, '123')
INSERT INTO Osoba (Ime, Prezime, Email, Email2, Email3, Telefon, Grad, StatusOsobe, Lozinka) VALUES ('Pero', 'Peric', 'pero@mail.hr', 'pero2@mail.hr', 'pero3@mail.hr', '01423415435', 'Varazdin', 0, '123')
INSERT INTO Osoba (Ime, Prezime, Email, Email2, Email3, Telefon, Grad, StatusOsobe, Lozinka) VALUES ('Mato', 'Matic', 'mato@mail.hr', 'mato2@mail.hr', 'mato3@mail.hr', '0543215435', 'Rijeka', 0, '123')
INSERT INTO Osoba (Ime, Prezime, Email, Email2, Email3, Telefon, Grad, StatusOsobe, Lozinka) VALUES ('Ivo', 'Ivic', 'ivo@mail.hr', 'ivo2@mail.hr', 'ivo3@mail.hr', '0133875435', 'Split', 1, '123')
INSERT INTO Osoba (Ime, Prezime, Email, Email2, Email3, Telefon, Grad, StatusOsobe, Lozinka) VALUES ('Jure', 'Juric', 'jure@mail.hr', 'jure2@mail.hr', 'jure3@mail.hr', '0133321435', 'Dubrovnik', 1, '123')
INSERT INTO Osoba (Ime, Prezime, Email, Email2, Email3, Telefon, Grad, StatusOsobe, Lozinka) VALUES ('Admin2', 'Admin2', 'admin@mail.com', 'admin2@mail.com', 'admin3@mail.com', '0833211075', 'Dubrovnik', 1, '123')

CREATE PROC ValidirajOsobu
@Email nvarchar (50),
@Lozinka nvarchar(50)
as
begin
select * from Osoba
where (Email = @Email and Lozinka = @Lozinka) or (Email2 = @Email and Lozinka = @Lozinka) or (Email3 = @Email and Lozinka = @Lozinka)
end

CREATE PROC DobaviOsobu
@Email nvarchar(50)
as
begin
select * from Osoba
where Email = @Email or Email2 = @Email or Email3 = @Email
end

CREATE PROC DobaviOsobuZaId
@OsobaID int
as
begin
select * from Osoba
where Osoba.IDOsoba = @OsobaID
end

CREATE PROC DodajOsobu
	@Ime nvarchar(50),
	@Prezime nvarchar(50),
	@Email nvarchar (50),
	@Email2 nvarchar(50) null,
	@Email3 nvarchar(50) null,
    @Telefon nvarchar (50) null,
    @Grad nvarchar (50),
    @StatusOsobe int,
    @Lozinka nvarchar(50)
AS
BEGIN
	insert into Osoba (Ime, Prezime, Email, Email2, Email3, Telefon, Grad, StatusOsobe, Lozinka) values (@Ime, @Prezime, @Email, @Email2, @Email3, @Telefon, @Grad, @StatusOsobe, @Lozinka)
END

CREATE PROC DobaviOsobe
as
BEGIN
SELECT * FROM Osoba
END

CREATE PROC ObrisiOsobu
@IDOsoba int
as
BEGIN
delete from Osoba where Osoba.IDOsoba = @IDOsoba
END

CREATE PROC AzurirajOsobuMail1
@IDOsoba int,
@Ime nvarchar (50),
@Prezime nvarchar (50),
@Email nvarchar (50),
@Telefon nvarchar (50),
@Grad nvarchar (50),
@StatusOsobe int,
@Lozinka nvarchar(50)
as
begin
UPDATE Osoba set Ime = @Ime, Prezime = @Prezime, Email = @Email, 
Telefon = @Telefon, Grad = @Grad, StatusOsobe = @StatusOsobe, Lozinka = @Lozinka
WHERE IDOsoba = @IDOsoba
end


CREATE PROC AzurirajOsobuMail2
@IDOsoba int,
@Ime nvarchar (50),
@Prezime nvarchar (50),
@Email2 nvarchar (50),
@Telefon nvarchar (50),
@Grad nvarchar (50),
@StatusOsobe int,
@Lozinka nvarchar(50)
as
begin
UPDATE Osoba set Ime = @Ime, Prezime = @Prezime, Email2 = @Email2, 
Telefon = @Telefon, Grad = @Grad, StatusOsobe = @StatusOsobe, Lozinka = @Lozinka
WHERE IDOsoba = @IDOsoba
end


CREATE PROC AzurirajOsobuMail3
@IDOsoba int,
@Ime nvarchar (50),
@Prezime nvarchar (50),
@Email3 nvarchar (50),
@Telefon nvarchar (50),
@Grad nvarchar (50),
@StatusOsobe int,
@Lozinka nvarchar(50)
as
begin
UPDATE Osoba set Ime = @Ime, Prezime = @Prezime, Email3 = @Email3, 
Telefon = @Telefon, Grad = @Grad, StatusOsobe = @StatusOsobe, Lozinka = @Lozinka
WHERE IDOsoba = @IDOsoba
end


CREATE PROC AzurirajEmail1Osobe
@IDOsoba int,
@Email nvarchar (50)
as
begin
UPDATE Osoba set Email = @Email 
WHERE IDOsoba = @IDOsoba
end

CREATE PROC AzurirajEmail2Osobe
@IDOsoba int,
@Email2 nvarchar (50)
as
begin
UPDATE Osoba set Email2 = @Email2
WHERE IDOsoba = @IDOsoba
end

CREATE PROC AzurirajEmail3Osobe
@IDOsoba int,
@Email3 nvarchar (50)
as
begin
UPDATE Osoba set Email3 = @Email3 
WHERE IDOsoba = @IDOsoba
end

CREATE PROC AzurirajOsobu
@IDOsoba int,
@Ime nvarchar (50),
@Prezime nvarchar (50),
@Email nvarchar (50),
@Email2 nvarchar (50) null,
@Email3 nvarchar (50) null,
@Telefon nvarchar (50) null,
@StatusOsobe int
as
begin
UPDATE Osoba set Ime = @Ime, Prezime = @Prezime, Email = @Email, Email2 = @Email2, Email3 = @Email3, 
Telefon = @Telefon, StatusOsobe = @StatusOsobe
WHERE IDOsoba = @IDOsoba
end
