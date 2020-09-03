# WebFormsProject
A college assignment where I had to build a Web Forms application that executes CRUD operations on user data stored in a database.

The application was built using Microsoft Visual Studio 2019 The database was built using Microsoft SQL Server Management Studio 18.

The goal of the application was to use knowledge learnt from the Web Development course and implement it in a Web Forms application.
The application allows for two types of users: administrator and user.
The user only has access rights to view data stored in the database, while the administrator can perform CRUD operations on stored data.
All changes made to the data have to be validated.
The application uses a variety of elements learnt during this course.
The elements used are as follows:
- ViewState, Session and Cookie mechanisms.
- Validation Controls
- User Controls (with delegates)
- Master Pages
- Globalization and Localization
- Themes
- DataSets for accessing data from an MS SQL Server database
- Repeater and GridView server controls

This repository contains two folders.

The Database folder contains two .sql files containing queries required for the application to work properly. 
The Database.sql file contains queries used to initilize the database used in the application. 
The Procedures.sql file contains queries used to create stored procedures required for the application to work properly.

The WebFormsProject folder contains code for the application.

Planned features and improvements:
- Add a text document repository as a second way of storing data.
