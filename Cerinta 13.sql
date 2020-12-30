--Ducal Nicolae, grupa 234
--Proiect SGBD: Cerinta 13
--Definiti un pachet care sa contina toate obiectele definite în cadrul proiectului.

set serveroutput on;

--Declarare
create or replace package companie_inchirieri as 
  --Cursoare, tipuri de date
  --Cerinta 6
  type statistica_angajat is record 
    (id angajat.angajat_id%type,
     nume angajat.nume%type,
     prenume angajat.prenume%type,
     efectuate number);
  
  type raport is table of statistica_angajat; 
  
  type indecsi_best is table of number;
  
  --Cerinta 7
  type linie_cursor_loc is record
    (locuinta_id locuinta.locuinta_id%type, 
     adresa locatie.adresa%type,
     oras locatie.oras%type, 
     tara locatie.tara%type, 
     nume proprietar.nume%type, 
     prenume proprietar.prenume%type);
  cursor c_loc(oras_sol locatie.oras%type, tara_sol locatie.tara%type) return linie_cursor_loc;
  
  type linie_cursor_hot is record
    (hotel_id hotel.hotel_id%type, 
     denumire hotel.denumire%type,
     stele hotel.numar_stele%type,
     adresa locatie.adresa%type,
     oras locatie.oras%type, 
     tara locatie.tara%type);
  cursor c_hot(oras_sol locatie.oras%type, tara_sol locatie.tara%type) return linie_cursor_hot;
  
  --Cerinta 8
  type linie_id_client is record 
    (id client.client_id%type);
  cursor c_cl(v_an varchar2) return linie_id_client;
  
  --Cerinta 9
  type t_angajati is table of angajat.angajat_id%type;
  
  --Proceduri, functii
  --Cerinta 6
  procedure raport_anual 
    (v_an in varchar2);
  
  --Cerinta 7
  procedure determina_top 
    (tara_sol varchar2 default '%', oras_sol varchar2 default '%');

  --Cerinta 8
  function costul_maxim
    (v_an varchar2)
  return locuinta.pret%type;
  
  --Cerinta 9
  procedure informatii_rezervari_locale
    (tara_sol locatie.tara%type, oras_sol locatie.oras%type);
    
end companie_inchirieri;
/


--Body-ul pachetului
create or replace package body companie_inchirieri as
  --Cursoare, tipuri de date
  --Cerinta 7
  cursor c_loc(oras_sol locatie.oras%type, tara_sol locatie.tara%type) return linie_cursor_loc is 
    select lo.locuinta_id loc_id, lc.adresa adresa, 
      lc.oras oras, lc.tara tara, pr.nume nume, pr.prenume prenume
    from locuinta lo, locatie lc, proprietar pr
    where lo.locatie_id = lc.locatie_id and pr.proprietar_id = lo.proprietar_id
    and lc.tara like(tara_sol) and lc.oras like(oras_sol);
  
  cursor c_hot(oras_sol locatie.oras%type, tara_sol locatie.tara%type) return linie_cursor_hot is 
    select h.hotel_id hotel_id, h.denumire denumire, h.numar_stele stele, 
      lc.adresa adresa, lc.oras oras, lc.tara tara
    from hotel h, locatie lc
    where h.locatie_id = lc.locatie_id
    and lc.tara like(tara_sol) and lc.oras like(oras_sol);
    
  --Cerinta 8
  cursor c_cl(v_an varchar2) return linie_id_client is 
         select c.client_id id
         from client c, rezervare_locuinta rl
         where rl.client_id = c.client_id and 
         to_char(extract(year from rl.data_rezervare)) = v_an
         union
         select c.client_id id
         from client c, istoric_rezervare_locuinta irl
         where irl.client_id = c.client_id and 
         to_char(extract(year from irl.data_rezervare)) = v_an
         union
         select c.client_id id
         from client c, rezervare_hotel rh
         where rh.client_id = c.client_id and 
         to_char(extract(year from rh.data_rezervare)) = v_an
         union
         select c.client_id id
         from client c, istoric_rezervare_hotel irh
         where irh.client_id = c.client_id and 
         to_char(extract(year from irh.data_rezervare)) = v_an;
  
  --Functiile si procedurile
  --Cerinta 6
  procedure raport_anual 
    (v_an in varchar2)
  is    
    efect_loc number;
    efect_hot number;
    efect_ist_loc number;
    efect_ist_hot number;
    cur_stat statistica_angajat;
    rap raport := raport();
    idx integer;
    avg number := 0;
    best_stat number := 0;
    best_angajati indecsi_best := indecsi_best();
  begin
    --Vom folosi un cursor ca sa parcurgem prin toti angajatii de tip agent imobiliar
    idx := 1;
    for ang in (select angajat_id, nume, prenume
                from angajat
                where job = 'Agent imobiliar') loop
      
      --Numarul de rezervari curente de locuinte
      select count(*) into efect_loc
      from rezervare_locuinta
      where angajat_id = ang.angajat_id
      and to_char(extract(year from data_rezervare)) = v_an;
      
      --Numarul de rezervari de locuinte din istoric
      select count(*) into efect_ist_loc
      from istoric_rezervare_locuinta
      where angajat_id = ang.angajat_id
      and extract(year from data_rezervare) = v_an;
      
      --Numarul de rezervari curente de hoteluri
      select count(*) into efect_hot
      from rezervare_hotel
      where angajat_id = ang.angajat_id
      and to_char(extract(year from data_rezervare)) = v_an;
      
      --Numarul de rezervari de hoteluri din istoric
      select count(*) into efect_ist_hot
      from istoric_rezervare_hotel
      where angajat_id = ang.angajat_id
      and extract(year from data_rezervare) = v_an;
      
      cur_stat.id := ang.angajat_id;
      cur_stat.nume := ang.nume;
      cur_stat.prenume := ang.prenume;
      cur_stat.efectuate := efect_loc + efect_hot + efect_ist_loc + efect_ist_hot;
      
      rap.extend;
      rap(idx) := cur_stat;
      idx := idx + 1;
    end loop;
    
    --Afisam raportul:
    for i in rap.first..rap.last loop
      dbms_output.put_line(i || ') ' || rap(i).nume || ' ' || rap(i).prenume || ' a efectuat ' || rap(i).efectuate || ' rezervari.');
      --Vom pastra in best_stat numarul maxim de rezervari efectuate de catre un agent imobiliar
      if best_stat < rap(i).efectuate then
        best_stat := rap(i).efectuate;
      end if;
    end loop;
    
    --Afisam cei mai buni angajati
    idx := 0;
    for i in rap.first..rap.last loop
      if rap(i).efectuate = best_stat then
        --Pastram indexul din tabelul raport
        idx := idx + 1;
        best_angajati.extend;
        best_angajati(idx) := i; 
      end if;
    end loop;
    
    dbms_output.put_line('');
    if idx = 0 then 
      dbms_output.put_line('Nici un angajat nu poate fi considerat cel mai bun in acest an'); 
    else
      if idx = 1 then
        dbms_output.put_line('Cel mai bun agent imobiliar din acest an este ' || rap(best_angajati(idx)).nume || ' ' || rap(best_angajati(idx)).prenume);  
      else
        dbms_output.put_line('Cei mai buni agenti imobiliari din acest an sunt: ');
        for i in best_angajati.first..best_angajati.last loop
          dbms_output.put_line(i || ') ' || rap(best_angajati(i)).nume || ' ' || rap(best_angajati(i)).prenume); 
        end loop;
      end if;
      
      --Marim salariile:
      select avg(salariu) into avg
      from angajat
      where job = 'Agent imobiliar';
      
      for i in best_angajati.first..best_angajati.last loop
        update angajat
        set salariu = floor(salariu + 0.1 * avg)
        where angajat_id = rap(best_angajati(i)).id;
      end loop;
    end if;
  end raport_anual;

  --Cerinta 7
  procedure determina_top 
    (tara_sol varchar2 default '%', oras_sol varchar2 default '%')
  is   
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
    open c_loc(oras_sol, tara_sol);
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
    for hot in c_hot(oras_sol, tara_sol) loop 
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
  
  --Cerinta 8
  function costul_maxim
    (v_an varchar2)
  return locuinta.pret%type is
    max_cost locuinta.pret%type := 0;
    cur_cost locuinta.pret%type := 0;
    fara_inregistrari exception;
    good integer;
    verifica_an number;
  begin
    --Verificam daca e bun anul introdus
    verifica_an := to_number(v_an);
    --Verificam daca avem inregistrari
    good := 0;
    for i in c_cl(v_an) loop
      good := good + 1;
    end loop;
    if good = 0 then 
      raise fara_inregistrari;
    end if;
  
    
    for cl in c_cl(v_an) loop
      --Pentru toate rezervarile din istoric, e evident ca se va lua suma pentru
      --toate zilele de cazare;
      cur_cost := 0;
      for rez in (select irl.data_cazare d_caz, irl.data_decazare d_decaz, lo.pret pret
                  from istoric_rezervare_locuinta irl, locuinta lo 
                  where client_id = cl.id and lo.locuinta_id = irl.locuinta_id) loop
        cur_cost := cur_cost + rez.pret * round(rez.d_decaz - rez.d_caz);
      end loop;
      
      for rez in (select irh.data_cazare d_caz, irh.data_decazare d_decaz, cam.pret pret
                  from istoric_rezervare_hotel irh, camera cam 
                  where client_id = cl.id and cam.camera_id = irh.camera_id) loop
        cur_cost := cur_cost + rez.pret * round(rez.d_decaz - rez.d_caz);
      end loop;
      
      --Pentru rezervarile care inca sunt valabile si pentru cele cazate, aplicam formulele
      for rez in (select rl.data_cazare d_caz, rl.data_decazare d_decaz, 
                    rl.status status, lo.pret pret
                  from rezervare_locuinta rl, locuinta lo 
                  where client_id = cl.id and lo.locuinta_id = rl.locuinta_id) loop
        if rez.status = 'Rezervat' then
          cur_cost := cur_cost + 0.5 * rez.pret * round(rez.d_decaz - rez.d_caz);
        elsif rez.status = 'Cazat' then
          cur_cost := cur_cost + rez.pret * round(rez.d_decaz - rez.d_caz);
        end if;
      end loop;
      
      for rez in (select rh.data_cazare d_caz, rh.data_decazare d_decaz, 
                    rh.status status, cam.pret pret
                  from rezervare_hotel rh, camera cam 
                  where client_id = cl.id and cam.camera_id = rh.camera_id) loop
        if rez.status = 'Rezervat' then
          cur_cost := cur_cost + 0.5 * rez.pret * round(rez.d_decaz - rez.d_caz);
        elsif rez.status = 'Cazat' then
          cur_cost := cur_cost + rez.pret * round(rez.d_decaz - rez.d_caz);
        end if;  
      end loop;
      
      --Verificam daca e maxime cheltuilelile persoanei in cauza
      if cur_cost > max_cost then max_cost := cur_cost; end if;
      --dbms_output.put_line(cl.id || ' ' || cur_cost);
    end loop;
  return max_cost;
  exception
    when value_error then
      raise_application_error('-20010', 'Anul introdus este gresit (nu este numeric)');
    when fara_inregistrari then 
      raise_application_error('-20011', 'Nu a fost identificata nici o inregistrare
        despre cheltuieli');
    when others then
      raise_application_error('-20012', 'Alta eroare');
  end costul_maxim;
  
  --Cerinta 9
  procedure informatii_rezervari_locale
    (tara_sol locatie.tara%type, oras_sol locatie.oras%type)
  is
    angajati_locali t_angajati := t_angajati();
    
    row_id number := 0;
    good integer;
    lipsa_sediu exception;
    lipsa_agenti exception;
  begin
    --Verficam daca exista sedii in acest oras + tara
    select count(*) into good
    from sediu s, locatie l
    where s.locatie_id = l.locatie_id 
    and l.oras = oras_sol and l.tara = tara_sol;
    
    if good = 0 then
      raise lipsa_sediu;
    end if;
    
    --Verificam daca exista agenti imobiliari in sediile din acest oras
    select count(*) into good
    from sediu s, locatie l, angajat a
    where s.locatie_id = l.locatie_id 
    and s.sediu_id = a.sediu_id
    and l.oras = oras_sol and l.tara = tara_sol
    and a.job = 'Agent imobiliar';
    
    if good = 0 then
      raise lipsa_agenti;
    end if;
    
    --Veriicam rezervarile efectuate de catre ei
    select angajat_id bulk collect into angajati_locali
    from sediu s, locatie l, angajat a
    where s.locatie_id = l.locatie_id 
    and s.sediu_id = a.sediu_id
    and l.oras = oras_sol and l.tara = tara_sol
    and a.job = 'Agent imobiliar';
    
    for i in angajati_locali.first..angajati_locali.last loop
      for rez in (select rl.data_cazare d_caz, rl.data_decazare d_decaz, lc.adresa adresa
                  from rezervare_locuinta rl, locuinta lo, locatie lc
                  where rl.locuinta_id = lo.locuinta_id 
                  and lc.locatie_id = lo.locatie_id
                  and lc.oras = oras_sol and lc.tara = tara_sol
                  and rl.angajat_id = angajati_locali(i)) loop
        if row_id = 0 then 
          dbms_output.put_line('Locuintele rezervate din ' || oras_sol || ', ' || tara_sol || 
          ' de catre agentii locali sunt: ');
        end if;
        row_id := row_id + 1;
        dbms_output.put_line(row_id || ') ' || 'Adresa: ' || rez.adresa ||  
          '; Rezervata de pe ' || to_char(rez.d_caz) || ' pana pe ' || to_char(rez.d_decaz));
      end loop;
    end loop;
    
    if row_id = 0 then
      dbms_output.put_line('Nu exista rezervari in orasul indicat'); 
    end if;  
  exception
    when lipsa_sediu then
      raise_application_error('-20021', 'Nu exista nici un sediu la aceasta locatie');
    when lipsa_agenti then
      raise_application_error('-20020', 'Nu lucreaza nici un agent imobiliar la aceasta locatie');
    when others then
      raise_application_error('-20020', 'Alta eroare');
  end informatii_rezervari_locale;
  
end companie_inchirieri;
/



--Cerinta 6
begin
  companie_inchirieri.raport_anual('2020');
end;
/

select * from angajat where job = 'Agent imobiliar';
rollback;

--Cerinta 7
begin 
  companie_inchirieri.determina_top();
end;
/

begin
  companie_inchirieri.determina_top('Romania');
end;
/

begin 
  companie_inchirieri.determina_top('Romania', 'Cluj');
end;
/

--Cerinta 8
--Caz bun:
begin
  dbms_output.put_line('Costul maxim in anul 2020 este ' || companie_inchirieri.costul_maxim('2020'));
end;
/

--Eroarea de an:
begin 
  dbms_output.put_line('Costul maxim in anul 2020 este ' || companie_inchirieri.costul_maxim('202a'));
end;
/

--Nu avem inregistrari
begin
  dbms_output.put_line('Costul maxim in anul 2018 este ' || companie_inchirieri.costul_maxim('2018'));
end;
/

--Cerinta 9
--Varianta valida
begin
  companie_inchirieri.informatii_rezervari_locale('Romania', 'Bucuresti');
end;
/

--Nu exista sediu
begin
  companie_inchirieri.informatii_rezervari_locale('Romania', 'Arad');
end;
/

--Nu exista angajati
begin
  companie_inchirieri.informatii_rezervari_locale('Romania', 'Timisoara');
end;
/ 