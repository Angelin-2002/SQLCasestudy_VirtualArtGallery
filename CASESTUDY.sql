--CASESTUDY 
--VIRTUAL ART GALLERY

--create a database
create database CASESTUDY

--use CASESTUDY database 
use CASESTUDY

--create a table Artist
create table Artist(
ArtistID int identity(1,1) primary key Not Null,
ArtistName varchar(20),
Biography text,
BirthDate date,
Nationality varchar(25),
Website varchar(100),
ContactInformation varchar(100))

--insert values into table artist
insert into Artist (ArtistName,Biography,BirthDate,Nationality,Website,ContactInformation)
values 
('Leonardo da Vinci','A study in creativity','1875-02-19','France','www.leodavinci.com','1547896320'),
('Jean','The Dazzling Epic of the Precursor of Art','1985-02-15','Brooklyn','www.jean.com','1475489623'),
('Pablo Picasso','Picasso war','1881-10-25','Spain','www.pabpicasso.com','1256987430')


--create a table Artwork
create table Artwork(
ArtworkID int identity(1,1) primary key Not Null,
Title varchar(30),
Description_art text,
CreationDate date,
MediumofArt varchar(25),
ImageURL varchar(100),
ArtistID int,
foreign key (ArtistID) references Artist(ArtistID))

--insert values to artwork table
insert into Artwork (Title,Description_art,CreationDate,MediumofArt,ImageURL,ArtistID)
values
('Starry Night','Night Watch','1889-10-25','Painting','starry_night.jpg',2),
('Mona Lisa','Alluring portrait','1503-11-12', 'Painting', 'mona_lisa.jpg',1),
('Guernica','Art Critic', '1937-12-17', 'Oil Painting', 'guernica.jpg',3),
('The Old Guitarist','Elderly hunched musician','1988-12-17','Oil Painting','theoldguitarist.jpg',3)


--create a table user
create table Users (
UserID int identity(101,1) primary key not Null,
Username varchar(50),
[Password] varchar(25),
Email varchar(50),
FirstName varchar(25),
LastName varchar(25),
DateOfBirth date,
ProfilePicture varchar(50))

Insert into Users (Username, [Password], Email, FirstName, LastName, DateOfBirth, ProfilePicture)
values 
('user_01', 'password_01', 'user01@email.com', 'Angelin', 'Simon', '2005-02-05', 'profile_user01_url'),
('user_02', 'password_02', 'user02@email.com', 'Gem', 'John', '2005-03-05', 'profile_user02_url'),
('user_03', 'password_03', 'user03@email.com', 'Cary', 'Don', '2005-04-05', 'profile_user03_url')


--create table Gallery
create table Gallery (
GalleryID int identity(1001,1) primary key not Null,
GallName varchar(25),
GallDesc text,
GallLocation varchar(50),
Curator varchar(25), 
OpeningHours varchar(50),
ArtistID int
Foreign key (ArtistID) references Artist(ArtistID))

insert into gallery (GallName, GallDesc, GallLocation, Curator, OpeningHours, ArtistID)
values 
('Gallery B1', 'Commercial Art', 'Delhi', 'Thomas Dhar', '11.00 AM - 5.00 PM', 1),
('Gallery B2', 'Abstract Art', 'Mumbai', 'Christy Randall', '9.00 AM - 4.00 PM', 2),
('Gallery B3', 'Vanity', 'Pune', 'James Oliver', '10.00 AM - 6.00 PM', 3)


--create table FavouriteArtwork
create table FavouriteArtwork(
UserID int,
ArtworkID int,
Primary key(UserID,ArtworkID),
foreign key (UserID) references Users(UserID),
foreign key (ArtworkID) references Artwork(ArtworkID))

insert into FavouriteArtwork
values
(101,4),
(103,5)


--create table ArtworkGallery
create table ArtworkGallery(
ArtworkID int,
GalleryID int,
Primary key (ArtworkID,GalleryID),
foreign key (ArtworkID) references Artwork(ArtworkID),
foreign key (GalleryID) references Gallery(GalleryID))

insert into ArtworkGallery values
(4,1001),
(5,1003)


--update a artwork
update Artwork
set
Title = 'Riding with Death',
Description_art= 'State of the world',
CreationDate='1988-02-14',
MediumofArt='Paining',
ImageURL='riding_death.jpg',
ArtistID=2
where ArtistID=2
select * from Artwork

--remove artwork
delete from Artwork
where  Title='The Old Guitarist'
select * from Artwork

--Add Artwork to  FavoriteArtwork:
insert into  FavouriteArtwork (UserID, ArtworkID)
VALUES (102,6);

--Delete artwork from FavouriteArtwork
delete from FavouriteArtwork
where UserID=102 and ArtworkID=6



