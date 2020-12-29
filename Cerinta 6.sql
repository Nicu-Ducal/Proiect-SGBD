--Ducal Nicolae, grupa 234
--Proiect SGBD: Cerinta nr. 6
--Definiti un subprogram stocat care sa utilizeze un tip de colectie studiat. 
--Apelati subprogramul.

set serveroutput on;


--Conditia problemei: 
--Compania noastra trebuie sa faca un raport anual la fiecare sfarsit de an. 
--Raportul consta din urmatoarele date: un tablou cu angajatii companiei 
--care sunt agenti imobiliari (pentru ca doar ei pot aproba rezervarile de 
--locuinta si camere din hoteluri) si cate camere si locuinte au 
--efectuat acestia in anul solicitat (in cazul nostru, va fi anul 2020). 
--De asemenea, sa se mentioneze angajatul cu ce mai buna statistica si sa
--i se ofere o marire de salariu egala cu 10% din media salariilor tuturor salariilor
--agentilor imobiliari. (Daca sunt mai multi, sa se afiseze, respectivi mareasca salariul
--tuturor). Remarca: angajatul trebuie sa aiba cel putin o rezervare facuta ca sa poata
--intra in acest top.
--Observatie: Trebuie sa fie luate in considerare nu doar rezervarile care inca sunt valabile, ci si cele care au fost finalizate 
--(adica rezervarile in urma carora s-au decazat clientii).

--Rezolvare: Pentru a rezolva aceasta problema, putem folosi doua colectii studiate la curs si la laborator: tipul de date record si tabel (indexat, imbricat, sau vectori).
--Pentru problema noastra vom folosi un tabel imbricat. Vom face un tip record care sa contina numele si prenumele angajatului, impreuna cu numarul de rezervari efectuate pe
--parcursul anului. Apoi, vom face tabelul nostru imbricat de acest tip record si vom mentine in el toate datele necesare. La final, ii vom afisa pe toti.


--Procedura noastra primeste ca parametru de intrare anul, caruia vrem sa ii facem raportul
create or replace procedure raport_anual 
  (v_an in varchar2)
is
  type statistica_angajat is record 
    (id angajat.angajat_id%type,
     nume angajat.nume%type,
     prenume angajat.prenume%type,
     efectuate number);
  
  type raport is table of statistica_angajat; 
  
  type indecsi_best is table of number;
  
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
/

--Apelam functia pentru anul 2020;
begin
  raport_anual('2020');
end;
/

select * from angajat where job = 'Agent imobiliar';
rollback;

