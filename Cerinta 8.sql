--Ducal Nicolae, grupa 234
--Proiect SGBD: Cerinta nr. 8
--Definiti un subprogram stocat de tip functie care sa utilizeze 3 dintre tabelele definite. Tratati toate exceptiile care pot aparea. 
--Apelati subprogramul astfel încât sa evidentiati toate cazurile tratate.

set serveroutput on;

--Sa se implementeze o functie care returneaza costul total achitat de catre clientul care a
--chelutit cea mai mare suma de bani pentru cazari intr-un anumit an. Anul va fi transmis
--ca parametru functiei si vor fi luate in calcul anul rezervarii, nu cazarii.
--Observatie: Costul pentru o rezervare se va calcula in felul urmator: 
--Daca persoana s-a cazat deja, trebuie sa plateasca in ziua cazarii toata perioada indicata in rezervare, adica: 
--pret_locuinta/camera * numarul de zile de cazare (de la data cazarii pana la data decazarii).
--Daca persoana inca nu s-a cazat si a efectuat doar rezervarea, se va plati un avans in valoare de jumatate din
--costul care ar trebui sa fie platit la cazare. La cazare va fi achitata cea de-a doua parte a sumei. In caz de anulare a 
--rezervarii suma va fi restituita, doar in anumite conditii. Restituirea nu ne intereseaza pentru aceasta cerinta.

--Tabelele folosite: Client, Rezervare_Locuinta, Istoric_Rezervare_Locuinta, 
--Rezervare_Hotel, Istoric_Rezervare_Hotel, Locuinta, Camera

create or replace function costul_maxim
  (v_an varchar2)
return locuinta.pret%type is
  --Vom folosi un cursor ca sa iteram doar prin clientii care facut careva rezervari
  --in anul solicitat
  cursor c_cl is select c.client_id id
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
  for i in c_cl loop
    good := good + 1;
  end loop;
  if good = 0 then 
    raise fara_inregistrari;
  end if;

  
  for cl in c_cl loop
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
/

--Caz bun:
begin
  dbms_output.put_line('Costul maxim in anul 2020 este ' || costul_maxim('2020'));
end;
/

--Eroarea de an:
begin 
  dbms_output.put_line('Costul maxim in anul 2020 este ' || costul_maxim('202a'));
end;
/

--Nu avem inregistrari
begin
  dbms_output.put_line('Costul maxim in anul 2018 este ' || costul_maxim('2018'));
end;
/
