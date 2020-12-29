--Ducal Nicolae, grupa 234
--Proiect SGBD: Cerinta nr. 9
--Definiti un subprogram stocat de tip procedura care sa utilizeze 5 dintre tabelele definite. Tratati toate exceptiile care pot aparea. 
--Apelati subprogramul astfel încât sa evidentiati toate cazurile tratate.

set serveroutput on;

--Sa se determine rezervarile de locuinte care inca sunt valabile,
--(clientii inca sunt cazati sau au rezervat locuinta) din orasul
--si tara (care vor fi trimise ca parametru functiei), care au fost efectuate 
--de c?tre angajatii ce lucreaza in sediile companiei din aceeasi ?ar?. 
--(Remarc?: ca si in cazul cerintelor anterioare, se vor lua in considerare doar
--angajatii care sunt agenti imobiliari). 
--Sa se afiseze in formatul: "Locuinta de la adresa _ este rezervata de pe _ pana pe _"

--Tabele folosite: Locatie, Sediu, Angajat, Rezervare_Locuinta, Locuinta


create or replace procedure informatii_rezervari_locale
  (tara_sol locatie.tara%type, oras_sol locatie.oras%type)
is
  type t_angajati is table of angajat.angajat_id%type;
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
    raise_application_error('-20021', 'Nu exista nici un sediu ;a acesta locatie');
  when lipsa_agenti then
    raise_application_error('-20020', 'Nu lucreaza nici un agent imobiliar la aceasa locatie');
  when others then
    raise_application_error('-20020', 'Alta eroare');
end informatii_rezervari_locale;
/

--Varianta valida
begin
  informatii_rezervari_locale('Romania', 'Bucuresti');
end;
/

--Nu exista sediu
begin
  informatii_rezervari_locale('Romania', 'Arad');
end;
/

--Nu exista angajati
begin
  informatii_rezervari_locale('Romania', 'Timisoara');
end;
/ 