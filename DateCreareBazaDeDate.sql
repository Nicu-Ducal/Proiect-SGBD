--Ducal Nicolae, grupa 234
--Proiect SGBD - Crearea bazei de date

set serveroutput on;

--Tabelul Proprietar
create table proprietar (
  proprietar_id number(8) primary key,
  nume varchar2(30) not null,
  prenume varchar2(30) not null, 
  email varchar2(30) not null,
  telefon varchar2(15));

--Tabelul Client
--Va avea o constrangere unica pentru tuplul (nume, prenume, email, data_nasterii)
create table client (
  client_id number primary key,
  nume varchar2(30) not null,
  prenume varchar2(30) not null,
  email varchar2(30) not null,
  telefon varchar2(15),
  data_nasterii date not null,
  constraint unq_client unique (nume, prenume, email, data_nasterii));
  
--Tabelul Serviciu
--Constrangeri: Denumire unica, ratingul sa fie intre 1 si 10
create table serviciu (
  serviciu_id number primary key,
  denumire varchar2(50) not null,
  rating number(2),
  constraint unq_serviciu unique (denumire),
  constraint chk_serviciu check (1 <= rating and rating <= 10));

--Tabelul Locatie
--Va avea o constrangere unica pentru tuplul (adresa, oras, tara)
create table locatie (
  locatie_id number(5) primary key,
  adresa varchar2(80) not null,
  cod_postal number(10),
  oras varchar2(50) not null,
  tara varchar2(50) not null,
  constraint unq_locatie unique(adresa, oras, tara));

--Tabelul Hotel
--Constrangeri: Cheie externa - locatie_id, check ca numarul de stele sa fie intre 1 si 5
create table hotel (
  hotel_id number primary key,
  denumire varchar2(30) not null,
  numar_stele number(2) not null,
  locatie_id number(5),
  constraint fk1_hotel foreign key(locatie_id) references locatie(locatie_id) on delete set null,
  constraint chk_hotel check(1 <= numar_stele and numar_stele <= 5));

--Tabelul Locuinta
--Constrangeri: Cheie externa - locatie_id si ratingul e un numar zecimal intre 1 si 10
create table locuinta (
  locuinta_id number primary key,
  pret number(10) not null,
  numar_camere number(3) not null,
  rating number(3, 3) not null,
  locatie_id number(5),
  proprietar_id number not null,
  constraint fk1_locuinta foreign key(locatie_id) references locatie(locatie_id) on delete set null,
  constraint fk2_locuinta foreign key(proprietar_id) references proprietar(proprietar_id) on delete cascade);

--Tabelul Camera
--Constrangeri: Cheie externa - hotel_id, 
--combinatie unica de (hotel_id, etaj, numar)
create table camera (
  camera_id number primary key,
  pret number(10) not null,
  etaj number(3) not null,
  numar number(5) not null,
  hotel_id number not null,
  constraint unq_camera unique(hotel_id, etaj, numar),
  constraint fk1_camera foreign key(hotel_id) references hotel(hotel_id) on delete cascade);

--Tabel asociativ Serviciu-Locuinta
create table serviciu_locuinta (
  serviciu_id number not null,
  locuinta_id number not null,
  constraint pk_serviciu_locuinta primary key(serviciu_id, locuinta_id),
  constraint fk1_serviciu_locuinta foreign key(serviciu_id) references serviciu(serviciu_id) on delete cascade,
  constraint fk2_serviciu_locuinta foreign key(locuinta_id) references locuinta(locuinta_id) on delete cascade);

--Tabel asociativ Serviciu-Hotel
create table serviciu_hotel (
  serviciu_id number not null,
  hotel_id number not null,
  constraint pk_serviciu_hotel primary key(serviciu_id, hotel_id),
  constraint fk1_serviciu_hotel foreign key(serviciu_id) references serviciu(serviciu_id) on delete cascade,
  constraint fk2_serviciu_hotel foreign key(hotel_id) references hotel(hotel_id) on delete cascade);

--Tabelul Sediu
--Constrangeri: Cheie externa - director_id - unica
--Constrangeri: Cheie externa - locatie_id
create table sediu (
  sediu_id number primary key,
  locatie_id number(5),
  director_id number,
  numar_angajati number,
  constraint fk1_sediu foreign key(locatie_id) references locatie(locatie_id) on delete set null,
  constraint unq_sediu unique(director_id));

--Tabelul Angajat
create table angajat (
  angajat_id number primary key,
  nume varchar2(30) not null,
  prenume varchar2(30) not null,
  email varchar2(30) not null,
  job varchar2(30) not null,
  salariu number,
  sediu_id number not null,
  constraint unq_angajat unique(nume, prenume, email),
  constraint fk1_angajat foreign key(sediu_id) references sediu(sediu_id) on delete cascade);

--Adaug constrangerea pentru director_id din sediu
alter table sediu
add constraint fk2_sediu foreign key(director_id) references angajat(angajat_id) on delete set null;

--Tabelul Rezervare_locuinta
create table rezervare_locuinta (
  rezervare_id number primary key,
  locuinta_id number not null,
  client_id number not null,
  numar_persoane number not null,
  data_rezervare date not null,
  data_cazare date not null,
  data_decazare date not null,
  status varchar2(30),
  angajat_id number not null,
  constraint fk1_rezervare_locuinta foreign key(locuinta_id) references locuinta(locuinta_id) on delete cascade,
  constraint fk2_rezervare_locuinta foreign key(client_id) references client(client_id) on delete cascade,
  constraint fk3_rezervare_locuinta foreign key(angajat_id) references angajat(angajat_id) on delete cascade);
  
--Tabelul Rezervare_Hotel
create table rezervare_hotel (
  rezervare_id number primary key,
  camera_id number not null,
  client_id number not null,
  numar_persoane number not null,
  data_rezervare date not null,
  data_cazare date not null,
  data_decazare date not null,
  status varchar2(30),
  angajat_id number not null,
  constraint fk1_rezervare_hotel foreign key(camera_id) references camera(camera_id) on delete cascade,
  constraint fk2_rezervare_hotel foreign key(client_id) references client(client_id) on delete cascade,
  constraint fk3_rezervare_hotel foreign key(angajat_id) references angajat(angajat_id) on delete cascade);

--Tabelul Istoric_Rezervare_locuinta
create table istoric_rezervare_locuinta (
  rezervare_id number primary key,
  locuinta_id number not null,
  client_id number not null,
  numar_persoane number not null,
  data_rezervare date not null,
  data_cazare date not null,
  data_decazare date not null,
  angajat_id number not null,
  constraint fk1_istoric_rezervare_locuinta foreign key(locuinta_id) references locuinta(locuinta_id) on delete cascade,
  constraint fk2_istoric_rezervare_locuinta foreign key(client_id) references client(client_id) on delete cascade,
  constraint fk3_istoric_rezervare_locuinta foreign key(angajat_id) references angajat(angajat_id) on delete cascade);

--Tabelul Istoric_Rezervare_Hotel
create table istoric_rezervare_hotel (
  rezervare_id number primary key,
  camera_id number not null,
  client_id number not null,
  numar_persoane number not null,
  data_rezervare date not null,
  data_cazare date not null,
  data_decazare date not null,
  angajat_id number not null,
  constraint fk1_istoric_rezervare_hotel foreign key(camera_id) references camera(camera_id) on delete cascade,
  constraint fk2_istoric_rezervare_hotel foreign key(client_id) references client(client_id) on delete cascade,
  constraint fk3_istoric_rezervare_hotel foreign key(angajat_id) references angajat(angajat_id) on delete cascade);
  
