--Ducal Nicolae, grupa 234
--Proiect SGBD: Cerintele nr. 10-12
--10. Definiti un trigger de tip LMD la nivel de comanda. Declansati trigger-ul.
--11. Definiti un trigger de tip LMD la nivel de linie. Declansati trigger-ul.
--12. Definiti un trigger de tip LDD. Declansati trigger-ul.

set serveroutput on;

--Cerinta 10
--Compania lucreaza de marti pana sambata, de la ora 10 pâna la 18, fara pauza de masa.
--Trebuie sa creeam un trigger care permite adaugarea rezervarilor in tabelele rezervarilor
--doar in acest interval orar.
create or replace trigger trig10_orar_rezervare_loc 
  before insert or update or delete on rezervare_locuinta
begin 
  if (to_char(sysdate, 'D') between 1 and 2
    or to_char(sysdate, 'HH24') not between 10 and 18) then
      raise_application_error(-20100, 'Compania nu lucreaza in acest moment, reveniti altadata!');
  end if;
end;
/

create or replace trigger trig10_orar_rezervare_hot 
  before insert or update or delete on rezervare_hotel
begin 
  if (to_char(sysdate, 'D') between 1 and 2 
    or to_char(sysdate, 'HH24') not between 10 and 18) then
      raise_application_error(-20100, 'Compania nu lucreaza in acest moment, reveniti altadata!');
  end if;
end;
/

insert into rezervare_locuinta values(20, 1, 1, 2, to_date('01-10-2021', 'DD-MM-YYYY'), to_date('01-01-2022', 'DD-MM-YYYY'), to_date('05-01-2022', 'DD-MM-YYYY'), 'Rezervat', 13);

--Cerinta 11
--Avem nevoie de un trigger sa tinem cont de numarul angajatilor in sedii
create or replace trigger trig11_sediu
  after insert or update or delete on angajat
  for each row
begin
  if inserting then
    --Adaugam +1 la numarul de angajati din acel sediu
    update sediu
    set numar_angajati = numar_angajati + 1
    where sediu_id = :NEW.sediu_id;
  elsif updating('sediu_id') then
    --Adaugam +1 la noul sediu si -1 la vechiul sediu
    update sediu
    set numar_angajati = numar_angajati - 1
    where sediu_id = :OLD.sediu_id;
    
    update sediu
    set numar_angajati = numar_angajati + 1
    where sediu_id = :NEW.sediu_id;
  elsif deleting then
    --Scadem 1 din sediul din care pleaca
    update sediu
    set numar_angajati = numar_angajati - 1
    where sediu_id = :OLD.sediu_id;
  end if;
end;
/

--Verificam
select * from sediu;
select * from angajat;

update angajat
set sediu_id = 10
where angajat_id = 2;

rollback;

--Cerinta 12
--Pentru ca nimeni in afara de administratorul bazei de date nu trebuie sa 
--creeze/stearga tabele, sa definim un lucru care nu permite acest lucru.
--Observatie: pentru exemplul acesta vom preseupune ca username-ul administratorului
--este Admin
--O alta idee de trigger ar fi unul pentru gestionarea erorilor.

create or replace trigger trig12_tabele
  before create or drop or alter on schema
begin
  --Eventual se schimba numele de 'Admin' pe numele utilizatorului
  --care este administrator
  if user <> upper('Admin') then
    raise_application_error(-20500, 'Nu esti administratorul bazei de date');
  end if;
end;
/

--Testare trigger
create table Erori 
  (eroare varchar2(300),
   user_id varchar2(30));

drop trigger trig12_tabele;