--Ducal Nicolae, grupa 234
--Proiect SGBD: Cerinta 14
--Definiti un pachet care sa includa tipuri de date complexe si obiecte necesare 
--pentru actiuni integrate

--Idei:
--Procedura prin care poti rezerva o locuinta daca e libera +
--Functie care sa-ti returneze cat trebuie sa achiti pentru o cazare intr-o locuinta +
--Ceva return de date complex, idk + (recordul)
--Tipuri de date: record, tabele

set serveroutput on;

create or replace package companie_complex as 
  --Tipuri de date
  --Vom crea recorduri pentru a fi mai clara definirea unor functii
  type cerere_rezerv_loc is record 
    (nume client.nume%type,
     prenume client.prenume%type,
     email client.email%type,
     numar_persoane rezervare_locuinta.numar_persoane%type,
     adresa locatie.adresa%type, 
     oras locatie.oras%type, 
     tara locatie.tara%type, 
     data_1 date, 
     data_2 date);
  
  --Record pentru tabelul imbricat de plati
  type chitanta_rez_loc is record
    (id client.client_id%type,
     nume client.nume%type,
     prenume client.prenume%type,
     rezervare_id rezervare_locuinta.rezervare_id%type,
     suma_plata locuinta.pret%type);
        
  --Tabel pentru plati
  type plati is table of chitanta_rez_loc;
  
  --Tablou cu agentii imobiliari
  type agenti_imobiliari is table of angajat.angajat_id%type;
  

  --Functii si proceduri
  --Creaza un obiect de tip cerere_rezerv_loc si il returneaza
  function completeaza_cerere
    (v_nume client.nume%type, v_prenume client.prenume%type, v_email client.email%type,
     numar_persoane rezervare_locuinta.numar_persoane%type,
     adresa locatie.adresa%type, oras locatie.oras%type, tara locatie.tara%type, 
     data_1 date, data_2 date)
  return cerere_rezerv_loc;
  
  --Verifica daca o locuinta de la o adresa anumita este disponibila in perioada indicata
  --Returneaza 'disponibila' sau 'indisponibila'
  function verifica_disp_locuinta
    (v_adresa locatie.adresa%type, v_oras locatie.oras%type, v_tara locatie.tara%type, data_1 date, data_2 date)
  return varchar2;
  
  --Returneaza pretul pentru inchirierea locuintei intr-o perioada, daca in acea perioada locuinta este disponibila
  --Daca locuinta este indisponibila, se va arunca o eroare, in caz contrar, se returneaza 
  --suma totala care trebuie achitata pentru perioada solicitata. Ne vom folosi de functia precedenta.
  function consulta_pret_locuinta
    (v_adresa locatie.adresa%type, v_oras locatie.oras%type, v_tara locatie.tara%type, data_1 date, data_2 date) 
  return number;
  
  --Functia care primeste datele despre client (nume, prenume, email - se are in vedere ca exista 
  --o unica astfel de combinatie) si datele despre locuinta intr-un record de tip cerere.
  --Returneaza o notificare sau eroare despre faptul daca s-a rezervat sau nu locuinta.
  --Ne folosim de functiile precedente.
  procedure rezerveaza_locuinta
    (cerere cerere_rezerv_loc); 
  
end companie_complex;
/

create or replace package body companie_complex as
  --Utilitare (tipuri de date)
  --Tablou cu toate platile
  idx integer := 0; --Pentru ultimul index
  t_plati plati := plati();
  t_agenti agenti_imobiliari := agenti_imobiliari();

  --Functii si proceduri
  function completeaza_cerere
    (v_nume client.nume%type, v_prenume client.prenume%type, v_email client.email%type,
     numar_persoane rezervare_locuinta.numar_persoane%type,
     adresa locatie.adresa%type, oras locatie.oras%type, tara locatie.tara%type, 
     data_1 date, data_2 date)
  return cerere_rezerv_loc
  is
    cerere cerere_rezerv_loc;
    perioada_invalida exception;
  begin
    --Verificam daca data_1 <= data_2
    if data_1 > data_2 then
      raise perioada_invalida;
    end if;
    cerere.nume := v_nume; cerere.prenume := v_prenume; cerere.email := v_email;
    cerere.numar_persoane := numar_persoane;
    cerere.adresa := adresa; cerere.oras := oras; cerere.tara := tara;
    cerere.data_1 := data_1; cerere.data_2 := data_2;
  return cerere;
  exception
    when perioada_invalida then
      raise_application_error(-20050, 'Data de cazare nu poate fi dupa data decazarii!');
    when others then
      raise_application_error(-20051, 'Eroare la completarea cererii!');
  end completeaza_cerere;
  
  
  function verifica_disp_locuinta
    (v_adresa locatie.adresa%type, v_oras locatie.oras%type, v_tara locatie.tara%type, data_1 date, data_2 date)
  return varchar2
  is
    loc_id locuinta.locuinta_id%type;
    good integer := 0;
    status varchar2(30) := 'Disponibila';
    perioada_invalida exception;
    id_locatie locatie.locatie_id%type;
  begin 
    --Verificam daca data_1 <= data_2
    if data_1 > data_2 then
      raise perioada_invalida;
    end if;
    
    select locuinta_id into loc_id
    from locuinta lo, locatie lc
    where lo.locatie_id = lc.locatie_id
    and lc.adresa = v_adresa and lc.oras = v_oras and lc.tara = v_tara;
        
    --Verificam disponibilatatea
    select count(*) into good
    from rezervare_locuinta
    where locuinta_id = loc_id 
    and ((data_1 <= data_cazare and data_decazare <= data_2)
      or (data_cazare <= data_2 and data_2 <= data_decazare)
      or (data_cazare <= data_1 and data_1 <= data_decazare));
    
    if good <> 0 then 
      status := 'Indisponibila';
    end if;
  return status;
  exception
    when no_data_found then
      raise_application_error(-20060, 'Nu exista nici o locuinta la aceasta locatie');
    when perioada_invalida then
      raise_application_error(-20061, 'Data de cazare nu poate fi dupa data decazarii!');
    when others then
      raise_application_error(-20062, 'Eroare la verificarea disponibilitatii!');
  end verifica_disp_locuinta;
  
  
  function consulta_pret_locuinta
    (v_adresa locatie.adresa%type, v_oras locatie.oras%type, v_tara locatie.tara%type, data_1 date, data_2 date) 
  return number
  is
    loc_id locuinta.locuinta_id%type;
    pret locuinta.pret%type;
    status varchar2(30);
    cost locuinta.pret%type;
    perioada_invalida exception;
    indisponibila exception;
  begin
    --Verificam daca data_1 <= data_2
    if data_1 > data_2 then
      raise perioada_invalida;
    end if;
    
    --Verificam daca e disponibila
    status := verifica_disp_locuinta(v_adresa, v_oras, v_tara, data_1, data_2);
    if status = 'Indisponibila' then
      raise indisponibila;
    end if;
    
    select lo.locuinta_id, lo.pret into loc_id, pret
    from locuinta lo, locatie lc
    where lo.locatie_id = lc.locatie_id
    and lc.adresa = v_adresa and lc.oras = v_oras and lc.tara = v_tara;
    
    cost := round(data_2 - data_1) * pret; 
  return cost;
  exception
    when perioada_invalida then
      raise_application_error(-20071, 'Data de cazare nu poate fi dupa data decazarii!');
    when indisponibila then
      raise_application_error(-20072, 'Locuinta nu este disponibila in aceasta perioada');
    when others then
      raise_application_error(-20073, 'Eroare la verificarea costului!');
  end consulta_pret_locuinta;
  
  
  procedure rezerveaza_locuinta
    (cerere cerere_rezerv_loc)
  is
    id_client client.client_id%type;
    cost locuinta.pret%type;
    loc_id locuinta.locuinta_id%type;
    client_inexistent exception;
    sup integer;
    rand integer;
    agent_id angajat.angajat_id%type;
    chitanta chitanta_rez_loc;
    rez_id number;
  begin
    --Verificam existenta clientului
    select client_id into id_client
    from client
    where nume = cerere.nume and prenume = cerere.prenume and email = cerere.email;
    
    cost := consulta_pret_locuinta(cerere.adresa, cerere.oras, cerere.tara, cerere.data_1, cerere.data_2);
    
    select lo.locuinta_id into loc_id
    from locuinta lo, locatie lc
    where lo.locatie_id = lc.locatie_id
    and lc.adresa = cerere.adresa and lc.oras = cerere.oras and lc.tara = cerere.tara;
    
    --Daca am ajuns pana aici, totul este in regula, putem efectua rezervarea
    --Luam toti agentii intr-un tabel
    select angajat_id bulk collect into t_agenti
    from angajat
    where job = 'Agent imobiliar';
    
    --Luam un agent random
    sup := t_agenti.count;
    rand := round(dbms_random.value(1, sup));
    agent_id := t_agenti(rand);
    t_agenti.delete;
    
    --Efectuam inregistrarea
    rez_id := seq_rez_loc.nextval; 
    insert into rezervare_locuinta values 
      (rez_id, loc_id, id_client, cerere.numar_persoane, 
      sysdate, cerere.data_1, cerere.data_2, 'Rezervat', agent_id);
      
    --Adaugam la plati rezervarea
    chitanta.id := id_client; chitanta.nume := cerere.nume;
    chitanta.prenume := cerere.prenume;
    chitanta.rezervare_id := rez_id;
    chitanta.suma_plata := cost;
    
    t_plati.extend;
    idx := idx + 1;
    t_plati(idx) := chitanta;
    
    dbms_output.put_line('Rezervare efectuata cu succes');
  exception
    when client_inexistent then
      raise_application_error(-20080, 'Nu exista nici un client cu asa date');
  end rezerveaza_locuinta; 
  
end companie_complex;
/

--Testare
select * from rezervare_locuinta;

--Verificarea disponibilitatii
--Indisponibila
declare
  status varchar2(30);
begin
  status := companie_complex.verifica_disp_locuinta('Gorjului Street 218', 
       'Bucuresti', 'Romania', to_date('11-01-2021', 'DD-MM-YYYY'), to_date('30-01-2021', 'DD-MM-YYYY'));
  dbms_output.put_line('Locuinta este ' || status);
end;
/

--Disponibila
declare
  status varchar2(30);
begin
  status := companie_complex.verifica_disp_locuinta('Gorjului Street 218', 
       'Bucuresti', 'Romania', to_date('11-01-2022', 'DD-MM-YYYY'), to_date('15-01-2022', 'DD-MM-YYYY'));
  dbms_output.put_line('Locuinta este ' || status);
end;
/

--Costul
--Indisponibila
begin
  dbms_output.put_line('Inchirierea va costa ' || companie_complex.consulta_pret_locuinta('Gorjului Street 218', 
       'Bucuresti', 'Romania', to_date('11-01-2021', 'DD-MM-YYYY'), to_date('30-01-2021', 'DD-MM-YYYY')));
end;
/

--Disponibila
begin
   dbms_output.put_line('Inchirierea va costa ' || companie_complex.consulta_pret_locuinta('Gorjului Street 218', 
       'Bucuresti', 'Romania', to_date('11-02-2022', 'DD-MM-YYYY'), to_date('28-02-2022', 'DD-MM-YYYY')));
end;
/

--Rezervarea
--Disponibila
begin
  companie_complex.rezerveaza_locuinta(
    companie_complex.completeaza_cerere('Smith', 'Emma', 'smith.emma@icloud.com',
      2, 'Gorjului Street 218', 'Bucuresti', 'Romania', 
      to_date('11-01-2022', 'DD-MM-YYYY'), to_date('15-01-2022', 'DD-MM-YYYY')));
end;
/

begin
  companie_complex.rezerveaza_locuinta(
    companie_complex.completeaza_cerere('Smith', 'Emma', 'smith.emma@icloud.com',
      2, 'Gorjului Street 218', 'Bucuresti', 'Romania', 
      to_date('11-01-2021', 'DD-MM-YYYY'), to_date('15-01-2021', 'DD-MM-YYYY')));
end;
/



select * from client;

select * from rezervare_locuinta;
select * from istoric_rezervare_locuinta;

select * from locuinta lo, locatie lc
where lo.locatie_id = lc.locatie_id;