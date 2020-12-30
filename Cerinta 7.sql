--Ducal Nicolae, grupa 234
--Proiect SGBD: Cerinta nr. 7
--Definiti un subprogram stocat care sa utilizeze un tip de cursor studiat. 
--Apelati subprogramul.

set serveroutput on;

--Compania trebuie sa aib? si o statistica a celor mai bune locuinte si hoteluri.
--Sa se afiseze cele mai bune locuinte si hoteluri la momentul de fata. Tara si orasul
--pot fi introduse de catre utilizator. Daca nu, se afiseaza locuintele/hotelurile
--din toate locatiile disponibile.
--O locuinta sau un hotel este considerat buna, daca ratingul mediu al serviciilor
--de care beneficiaza locuinta/hotelul este cel putin 9.5 (ratingul maxim posibil
--este 10). Sa se afiseze mai intai toate locuintele cele mai bune, specificandu-se:
--adresa, orasul, tara, si proprietarul. De asemenea, sa se afiseze si ratingul si 
--serviciile de care dispune. Pentru Hotel, sa se specifice denumirea, locatia (adresa,
--orasul, tara), numarul de stele si serviciile.

--Rezolvare: Vom mentine datele necesare despre locuinte si hoteluri in doua cursoare explicite.
--Apoi vom parcurge prin serviciile de care beneficiaza fiecare din ele. 
--Pentru hoteluri vom folosi un ciclu cursor. 
--Exercitiul este rezolvat cu utilizarea a 8 tabele.

create or replace procedure determina_top 
 (tara_sol varchar2 default '%', oras_sol varchar2 default '%')
is 
  cursor c_loc is 
    select lo.locuinta_id loc_id, lc.adresa adresa, 
      lc.oras oras, lc.tara tara, pr.nume nume, pr.prenume prenume
    from locuinta lo, locatie lc, proprietar pr
    where lo.locatie_id = lc.locatie_id and pr.proprietar_id = lo.proprietar_id
    and lc.tara like(tara_sol) and lc.oras like(oras_sol);
  
  cursor c_hot is 
    select h.hotel_id hotel_id, h.denumire denumire, h.numar_stele stele, 
      lc.adresa adresa, lc.oras oras, lc.tara tara
    from hotel h, locatie lc
    where h.locatie_id = lc.locatie_id
    and lc.tara like(tara_sol) and lc.oras like(oras_sol);
    
  v_loc_id locuinta.locuinta_id%type;
  v_adresa locatie.adresa%type;
  v_oras locatie.oras%type;
  v_tara locatie.tara%type;
  v_nume proprietar.nume%type;
  v_prenume proprietar.prenume%type;
  good integer;
  check_oras_tara integer;
  rating_mediu number;
  iter number;
  
begin
  --Sa vedem daca orasul si tara sunt valide:
  select count(*) into check_oras_tara
  from locatie lc
  where lc.tara like(tara_sol) and lc.oras like(oras_sol);
  
  if check_oras_tara = 0 then
    raise_application_error('-20001', 'Nu exista date despre locatia indicata');
  end if;
  
  --Iteram initial prin locuinte
  --Good va fi indicator ca avem sau nu locuinte bune
  --Daca e 0 - nu, daca e 1 - da, daca e 2 - a fost 1 deja
  good := 0;
  open c_loc;
  loop
    fetch c_loc into v_loc_id, v_adresa, v_oras, v_tara, v_nume, v_prenume;
    exit when c_loc%notfound;
    
    select avg(s.rating) into rating_mediu
    from serviciu_locuinta sl, serviciu s
    where sl.serviciu_id = s.serviciu_id
    and sl.locuinta_id = v_loc_id;
    
    if nvl(rating_mediu, 0) >= 9.5 then 
      if good = 0 and oras_sol = '%' and tara_sol = '%' then
        dbms_output.put_line('Cele mai bune locuinte sunt: ');
      elsif good = 0 and oras_sol = '%' then
        dbms_output.put_line('Cele mai bune locuinte din ' || tara_sol || ' sunt: ');
      elsif good = 0 then
        dbms_output.put_line('Cele mai bune locuinte din ' || tara_sol || ', ' || oras_sol || ' sunt: ');
      end if;
 
      good := good + 1;
      
      if oras_sol = '%' and tara_sol = '%' then
        dbms_output.put_line(good || ') ' || v_adresa || ', ' || v_oras || ', ' || v_tara);
      elsif oras_sol = '%' then
        dbms_output.put_line(good || ') ' || v_adresa || ', ' || v_oras);
      else 
        dbms_output.put_line(good || ') ' || v_adresa);
      end if;
      
      dbms_output.put_line('Rating: ' || rating_mediu);
      dbms_output.put_line('Proprietar: ' || v_nume || ' ' || v_prenume);
      dbms_output.put('Servicile propuse: ');
      --Folosim un ciclu cursor pentru a prezenta serviciile:
      for i in (select denumire 
                from serviciu_locuinta sl, serviciu s
                where sl.serviciu_id = s.serviciu_id
                and sl.locuinta_id = v_loc_id) loop
        dbms_output.put(i.denumire || '; ');
      end loop;
      dbms_output.put_line('');
      dbms_output.put_line('');
    end if;
  end loop;
  close c_loc;
  
  if good = 0 then 
    dbms_output.put_line('Nu au fost identificate locuinte care ar indeplini criteriului');
  end if;
  
  --Repetam pentru hotel
  good := 0;
  for hot in c_hot loop 
    select avg(s.rating) into rating_mediu
    from serviciu_hotel sh, serviciu s
    where sh.serviciu_id = s.serviciu_id
    and sh.hotel_id = hot.hotel_id;
    
    if nvl(rating_mediu, 0) >= 9.5 then 
      if good = 0 and oras_sol = '%' and tara_sol = '%' then
        dbms_output.put_line('Cele mai bune hoteluri sunt: ');
      elsif good = 0 and oras_sol = '%' then
        dbms_output.put_line('Cele mai bune hoteluri din ' || tara_sol || ' sunt: ');
      elsif good = 0 then
        dbms_output.put_line('Cele mai bune hoteluri din ' || tara_sol || ', ' || oras_sol || ' sunt: ');
      end if;
 
      good := good + 1;
      
      if oras_sol = '%' and tara_sol = '%' then
        dbms_output.put_line(good || ') ' || hot.denumire || ', ' || hot.stele || ' stele, ' || hot.adresa || ', ' || hot.oras || ', ' || hot.tara);
      elsif oras_sol = '%' then
        dbms_output.put_line(good || ') ' || hot.denumire || ', ' || hot.stele || ' stele, ' || hot.adresa || ', ' || hot.oras);
      else 
        dbms_output.put_line(good || ') ' || hot.denumire || ', ' || hot.stele || ' stele, ' || hot.adresa);
      end if;
      
      dbms_output.put('Servicile propuse: ');
      --Folosim un ciclu cursor pentru a prezenta serviciile:
      for i in (select denumire 
                from serviciu_hotel sh, serviciu s
                where sh.serviciu_id = s.serviciu_id
                and sh.hotel_id = hot.hotel_id) loop
        dbms_output.put(i.denumire || '; ');
      end loop;
      dbms_output.put_line('');
      dbms_output.put_line('');
    end if;
  end loop;
  
  if good = 0 then 
    dbms_output.put_line('Nu au fost identificate hoteluri care ar indeplini criteriului');
  end if;
end determina_top; 
/


begin 
  determina_top();
end;
/

begin
  determina_top('Romania');
end;
/

begin 
  determina_top('Romania', 'Cluj');
end;
/
