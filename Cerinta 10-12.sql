--Ducal Nicolae, grupa 234
--Proiect SGBD: Cerintele nr. 10-12
--10. Definiti un trigger de tip LMD la nivel de comanda. Declansati trigger-ul.
--11. Definiti un trigger de tip LMD la nivel de linie. Declansati trigger-ul.
--12. Definiti un trigger de tip LDD. Declansati trigger-ul.

set serveroutput on;

--Cerinta 10
--Triggerul de comanda va

--create or replace trigger trig10_comanda 
--before
--is
--
--begin 
--
--end;
--/

--Cerinta 11
--Triggerul acesta va efectua urmatoarele operatii:
--Atunci cand are loc una din operatiile insert, update, sau delete din tabelele rezervarilor
--se verifica daca data decazarii este mai mica decat data curenta. Daca da,
--se sterge din tabelul Rezervarilor si se adauga in tabelul Istoric;
create or replace trigger trig11_rezervare_locatie
  after insert or update or delete on rezervare_locuinta
  for each row
begin
  --Daca data de decazare a trecut, atunci stergem din acest tabel si inseram in 
  --istoric
  if :NEW.data_decazare < sysdate then
    insert into istoric_rezervare_locuinta values (:NEW.rezervare_id, 
      :NEW.locuinta_id, :NEW.client_id, :NEW.numar_persoane, :NEW.data_rezervare, 
      :NEW.data_cazare, :NEW.data_decazare, :NEW.angajat_id);
      
    delete from rezervare_locuinta where rezervare_id = :NEW.rezervare_id;
  --Daca data de cazare este azi sau a trecut de azi, dar inca nu e decazarea
  --schimbam statusul 'Rezervat' in 'Cazat' 
  elsif :NEW.data_cazare < sysdate then
    update rezervare_locuinta
    set status = 'Cazat'
    where rezervare_id = :NEW.rezervare_id;
  end if;
end;
/

create or replace trigger trig11_rezervare_hotel
  after insert or update or delete on rezervare_hotel
  for each row
begin
  --Daca data de decazare a trecut, atunci stergem din acest tabel si inseram in 
  --istoric
  if :NEW.data_decazare < sysdate then
    insert into istoric_rezervare_hotel values (:NEW.rezervare_id, 
      :NEW.camera_id, :NEW.client_id, :NEW.numar_persoane, :NEW.data_rezervare, 
      :NEW.data_cazare, :NEW.data_decazare, :NEW.angajat_id);
      
    delete from rezervare_hotel where rezervare_id = :NEW.rezervare_id;
  --Daca data de cazare este azi sau a trecut de azi, dar inca nu e decazarea
  --schimbam statusul 'Rezervat' in 'Cazat' 
  elsif :NEW.data_cazare < sysdate then
    update rezervare_hotel
    set status = 'Cazat'
    where rezervare_id = :NEW.rezervare_id;
  end if;
end;
/

--De asemenea, avem nevoie si de un trigger sa tinem cont de numarul angajatilor in sedii
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

