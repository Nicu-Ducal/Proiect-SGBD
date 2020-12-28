--Ducal Nicolae, grupa 234
--Proiect SGBD: Cerinta nr. 5
--Insertia datelor coerente in tabele

--Date pentru tabelul Locatie
insert into locatie values (1, 'Main Street 49', 680953, 'Tirana', 'Albania');
insert into locatie values (2, 'Field Alley 26', 920458, 'Andorra la Vella', 'Andorra');
insert into locatie values (3, 'Station Street 407', 236405, 'Vienna', 'Austria');
insert into locatie values (4, 'Church Street 197', 421670, 'Minsk', 'Belarus');
insert into locatie values (5, 'Mill Street 60', 486664, 'Brussels', 'Belgium');
insert into locatie values (6, 'School Street 452', 773878, 'Sarajevo', 'Bosnia and Herzegovina');
insert into locatie values (7, 'Garden Street 136', 315450, 'Sofia', 'Bulgaria');
insert into locatie values (8, 'Short Street 153', 670665, 'Zagreb', 'Croatia');
insert into locatie values (9, 'Station Street 424', 151291, 'Prague', 'Czechia');
insert into locatie values (10, 'Lark Street 122', 550665, 'Copenhagen', 'Denmark');
insert into locatie values (11, 'Birch Street 487', 477967, 'Tallinn', 'Estonia');
insert into locatie values (12, 'Angle Street 182', 901047, 'Helsinki', 'Finland');
insert into locatie values (13, 'Beach Road 329', 301537, 'Paris', 'France');
insert into locatie values (14, 'Church Street 499', 759825, 'Berlin', 'Germany');
insert into locatie values (15, 'School Street 354', 641379, 'Gibraltar', 'Gibraltar');
insert into locatie values (16, 'Rome Street 60', 126060, 'Athens', 'Greece');
insert into locatie values (17, 'Garibaldi Street 369', 856714, 'Saint Peter Port', 'Guernsey');
insert into locatie values (18, 'Marconi Street 356', 641600, 'Budapest', 'Hungary');
insert into locatie values (19, 'Linden Street 374', 886157, 'Reykjavik', 'Iceland');
insert into locatie values (20, 'Forest Street 291', 467551, 'Dublin', 'Ireland');
insert into locatie values (21, 'Birch Street 145', 822400, 'Douglas', 'Isle of Man');
insert into locatie values (22, 'Field Street 83', 793403, 'Rome', 'Italy');
insert into locatie values (23, 'Forest Street 171', 767090, 'Saint Helier', 'Jersey');
insert into locatie values (24, 'Sunny Street 48', 618860, 'Pristina', 'Kosovo');
insert into locatie values (25, 'Central Street 277', 733341, 'Riga', 'Latvia');
insert into locatie values (26, 'Youth Street 425', 122415, 'Vaduz', 'Liechtenstein');
insert into locatie values (27, 'School Street 380', 865229, 'Vilnius', 'Lithuania');
insert into locatie values (28, 'Ring Road 152', 531194, 'Luxembourg', 'Luxembourg');
insert into locatie values (29, 'Grand Street 378', 343951, 'Valletta', 'Malta');
insert into locatie values (30, 'Stefan cel Mare Street 63', 459969, 'Chisinau', 'Moldova');
insert into locatie values (31, 'Station Street 192', 989326, 'Monaco', 'Monaco');
insert into locatie values (32, 'Main Street 463', 652441, 'Podgorica', 'Montenegro');
insert into locatie values (33, 'Village Street 285', 283507, 'Amsterdam', 'Netherlands');
insert into locatie values (34, 'Church Street 139', 432308, 'Skopje', 'North Macedonia');
insert into locatie values (35, 'Field Street 152', 171528, 'Oslo', 'Norway');
insert into locatie values (36, 'Meadow Street 139', 797676, 'Warsaw', 'Poland');
insert into locatie values (37, 'School Street 265', 825955, 'Lisbon', 'Portugal');
insert into locatie values (38, 'Lujerului Street 315', 488255, 'Bucuresti', 'Romania');
insert into locatie values (39, 'Tverskaia Street 165', 935472, 'Moscow', 'Russia');
insert into locatie values (40, 'School Street 167', 574556, 'San Marino', 'San Marino');
insert into locatie values (41, 'Preseren Street 68', 512202, 'Belgrade', 'Serbia');
insert into locatie values (42, 'Garden Street 319', 351035, 'Bratislava', 'Slovakia');
insert into locatie values (43, 'Ring Road 303', 728262, 'Ljubljana', 'Slovenia');
insert into locatie values (44, 'Grand Street 339', 948719, 'Madrid', 'Spain');
insert into locatie values (45, 'School Street 287', 657165, 'Longyearbyen', 'Svalbard');
insert into locatie values (46, 'Lark Street 443', 875896, 'Stockholm', 'Sweden');
insert into locatie values (47, 'Birch Street 495', 615401, 'Bern', 'Switzerland');
insert into locatie values (48, 'Angle Street 236', 525700, 'Kiev', 'Ukraine');
insert into locatie values (49, 'Tea Street 136', 607859, 'London', 'United Kingdom');
insert into locatie values (50, 'Academiei Street 392', 358891, 'Bucuresti', 'Romania');
insert into locatie values (51, 'Aviatorilor Street 405', 372338, 'Bucuresti', 'Romania');
insert into locatie values (52, 'Aviatorilor Street 433', 103239, 'Bucuresti', 'Romania');
insert into locatie values (53, 'Dristor Street 179', 162182, 'Bucuresti', 'Romania');
insert into locatie values (54, 'Lujerului Street 358', 302618, 'Bucuresti', 'Romania');
insert into locatie values (55, 'Gorjului Street 218', 654009, 'Bucuresti', 'Romania');
insert into locatie values (56, 'Erorilor Street 95', 596877, 'Bucuresti', 'Romania');
insert into locatie values (57, 'Gorjului Street 479', 538786, 'Bucuresti', 'Romania');
insert into locatie values (58, 'Erorilor Street 23', 157817, 'Bucuresti', 'Romania');
insert into locatie values (59, 'Tineretului Street 143', 855434, 'Cluj', 'Romania');
insert into locatie values (60, 'Universitatii Street 113', 604271, 'Cluj', 'Romania');
insert into locatie values (61, 'Unirii Street 190', 940977, 'Cluj', 'Romania');
insert into locatie values (62, 'Unirii Street 398', 506606, 'Iasi', 'Romania');
insert into locatie values (63, 'Unirii Street 436', 765577, 'Timisoara', 'Romania');

select * from locatie;

--Date pentru tabelul Client
insert into client values (1, 'Smith', 'Emma', 'smith.emma@icloud.com', 99155828, to_date('22-03-2003', 'DD-MM-YYYY'));
insert into client values (2, 'Johnson', 'Olivia', 'johnsonolivia@yahoo.com', 91375434, to_date('29-04-1993', 'DD-MM-YYYY'));
insert into client values (3, 'Williams', 'Noah', 'williams.noah@gmail.com', 43260301, to_date('25-04-1954', 'DD-MM-YYYY'));
insert into client values (4, 'Brown', 'Liam', 'brown.liam@icloud.com', 72581670, to_date('11-05-2003', 'DD-MM-YYYY'));
insert into client values (5, 'Jones', 'Sophia', 'jones.sophia@outlook.com', 65576421, to_date('20-08-1952', 'DD-MM-YYYY'));
insert into client values (6, 'Miller', 'Mason', 'miller_mason@outlook.com', 25636148, to_date('11-08-1953', 'DD-MM-YYYY'));
insert into client values (7, 'Davis', 'Ava', 'davis_ava@icloud.com', 33240263, to_date('19-12-1984', 'DD-MM-YYYY'));
insert into client values (8, 'Garcia', 'Jacob', 'garcia_jacob@apple.com', 20279417, to_date('05-04-1960', 'DD-MM-YYYY'));
insert into client values (9, 'Rodriguez', 'William', 'rodriguez.william@gmail.com', 52637808, to_date('27-11-2002', 'DD-MM-YYYY'));
insert into client values (10, 'Wilson', 'Isabella', 'wilsonisabella@yahoo.com', 93911010, to_date('01-02-1976', 'DD-MM-YYYY'));
insert into client values (11, 'Martinez', 'Ethan', 'martinez_ethan@apple.com', 99246903, to_date('16-11-2001', 'DD-MM-YYYY'));
insert into client values (12, 'Anderson', 'Mia', 'anderson_mia@apple.com', 78950147, to_date('18-06-1993', 'DD-MM-YYYY'));
insert into client values (13, 'Taylor', 'James', 'taylor.james@icloud.com', 44575251, to_date('14-03-1960', 'DD-MM-YYYY'));
insert into client values (14, 'Thomas', 'Alexander', 'thomasalexander@icloud.com', 37609610, to_date('09-08-1994', 'DD-MM-YYYY'));
insert into client values (15, 'Hernandez', 'Michael', 'hernandezmichael@apple.com', 65063852, to_date('25-03-1982', 'DD-MM-YYYY'));
insert into client values (16, 'Moore', 'Benjamin', 'moorebenjamin@yahoo.com', 63430223, to_date('07-07-1960', 'DD-MM-YYYY'));
insert into client values (17, 'Martin', 'Elijah', 'martinelijah@apple.com', 44835120, to_date('03-01-2003', 'DD-MM-YYYY'));
insert into client values (18, 'Jackson', 'Daniel', 'jacksondaniel@outlook.com', 54541827, to_date('23-02-1992', 'DD-MM-YYYY'));
insert into client values (19, 'Thompson', 'Aiden', 'thompson_aiden@icloud.com', 89229880, to_date('08-07-1957', 'DD-MM-YYYY'));
insert into client values (20, 'White', 'Logan', 'white_logan@yahoo.com', 62258980, to_date('28-07-1987', 'DD-MM-YYYY'));
insert into client values (21, 'Lopez', 'Matthew', 'lopezmatthew@icloud.com', 26895901, to_date('05-03-1959', 'DD-MM-YYYY'));
insert into client values (22, 'Lee', 'Abigail', 'leeabigail@outlook.com', 60028236, to_date('20-04-1957', 'DD-MM-YYYY'));
insert into client values (23, 'Gonzalez', 'Lucas', 'gonzalez.lucas@outlook.com', 46957997, to_date('17-07-1972', 'DD-MM-YYYY'));
insert into client values (24, 'Harris', 'Jackson', 'harris_jackson@outlook.com', 81897478, to_date('06-08-1994', 'DD-MM-YYYY'));
insert into client values (25, 'Clark', 'Emily', 'clark.emily@apple.com', 42567252, to_date('11-07-1961', 'DD-MM-YYYY'));
insert into client values (26, 'Lewis', 'David', 'lewisdavid@gmail.com', 15011359, to_date('27-06-1976', 'DD-MM-YYYY'));
insert into client values (27, 'Robinson', 'Oliver', 'robinson_oliver@icloud.com', 49000646, to_date('08-07-1950', 'DD-MM-YYYY'));
insert into client values (28, 'Walker', 'Jayden', 'walkerjayden@icloud.com', 75616766, to_date('04-05-1956', 'DD-MM-YYYY'));
insert into client values (29, 'Perez', 'Joseph', 'perez.joseph@apple.com', 75842970, to_date('26-02-1993', 'DD-MM-YYYY'));
insert into client values (30, 'Hall', 'Charlotte', 'hallcharlotte@icloud.com', 35610891, to_date('29-10-1973', 'DD-MM-YYYY'));
insert into client values (31, 'Young', 'Gabriel', 'young_gabriel@apple.com', 71737982, to_date('31-08-1975', 'DD-MM-YYYY'));
insert into client values (32, 'Fowler', 'Samuel', 'fowler.samuel@gmail.com', 77788657, to_date('13-06-1952', 'DD-MM-YYYY'));
insert into client values (33, 'Bowman', 'Carter', 'bowman_carter@apple.com', 73581957, to_date('20-06-1957', 'DD-MM-YYYY'));
insert into client values (34, 'Davidson', 'Anthony', 'davidsonanthony@apple.com', 24008312, to_date('18-02-1953', 'DD-MM-YYYY'));
insert into client values (35, 'May', 'John', 'mayjohn@outlook.com', 77530464, to_date('12-05-2002', 'DD-MM-YYYY'));
insert into client values (36, 'Day', 'Harper', 'day_harper@icloud.com', 69516542, to_date('06-05-1998', 'DD-MM-YYYY'));
insert into client values (37, 'Schneider', 'Dylan', 'schneider.dylan@yahoo.com', 78973554, to_date('11-12-1970', 'DD-MM-YYYY'));
insert into client values (38, 'Newman', 'Luke', 'newman_luke@outlook.com', 36146247, to_date('02-02-1956', 'DD-MM-YYYY'));
insert into client values (39, 'Brewer', 'Henry', 'brewer_henry@yahoo.com', 67581970, to_date('20-04-1961', 'DD-MM-YYYY'));
insert into client values (40, 'Lucas', 'Madison', 'lucas_madison@apple.com', 99614736, to_date('16-12-2000', 'DD-MM-YYYY'));
insert into client values (41, 'Holland', 'Andrew', 'holland_andrew@apple.com', 50647050, to_date('23-10-1984', 'DD-MM-YYYY'));
insert into client values (42, 'Wong', 'Isaac', 'wongisaac@gmail.com', 67485949, to_date('22-11-1989', 'DD-MM-YYYY'));
insert into client values (43, 'Banks', 'Amelia', 'banks_amelia@icloud.com', 99714717, to_date('11-11-1995', 'DD-MM-YYYY'));
insert into client values (44, 'Santos', 'Christopher', 'santos.christopher@yahoo.com', 31852010, to_date('01-11-1957', 'DD-MM-YYYY'));
insert into client values (45, 'Curtis', 'Joshua', 'curtisjoshua@icloud.com', 57647953, to_date('07-12-1989', 'DD-MM-YYYY'));
insert into client values (46, 'Pearson', 'Elizabeth', 'pearson_elizabeth@outlook.com', 59937846, to_date('14-12-1966', 'DD-MM-YYYY'));
insert into client values (47, 'Delgado', 'Sofia', 'delgado.sofia@apple.com', 49183454, to_date('03-03-1984', 'DD-MM-YYYY'));
insert into client values (48, 'Valdez', 'Wyatt', 'valdez.wyatt@icloud.com', 54133888, to_date('24-08-1999', 'DD-MM-YYYY'));
insert into client values (49, 'Pena', 'Sebastian', 'pena.sebastian@apple.com', 12901907, to_date('21-03-1959', 'DD-MM-YYYY'));
insert into client values (50, 'Rios', 'Owen', 'riosowen@apple.com', 83467998, to_date('27-06-1962', 'DD-MM-YYYY'));
insert into client values (51, 'Douglas', 'Evelyn', 'douglas.evelyn@gmail.com', 40444332, to_date('23-10-1993', 'DD-MM-YYYY'));
insert into client values (52, 'Sandoval', 'Avery', 'sandovalavery@yahoo.com', 11363567, to_date('25-08-1961', 'DD-MM-YYYY'));
insert into client values (53, 'Barrett', 'Caleb', 'barrettcaleb@outlook.com', 28964461, to_date('08-03-1967', 'DD-MM-YYYY'));
insert into client values (54, 'Hopkins', 'Nathan', 'hopkins.nathan@icloud.com', 61316337, to_date('22-09-1988', 'DD-MM-YYYY'));
insert into client values (55, 'Keller', 'Ryan', 'keller.ryan@apple.com', 56399739, to_date('09-04-1983', 'DD-MM-YYYY'));
insert into client values (56, 'Guerrero', 'Jack', 'guerrero_jack@gmail.com', 46602434, to_date('04-02-2002', 'DD-MM-YYYY'));
insert into client values (57, 'Stanley', 'Hunter', 'stanleyhunter@apple.com', 60651850, to_date('13-12-1958', 'DD-MM-YYYY'));
insert into client values (58, 'Heines', 'Levi', 'heines.levi@apple.com', 66161750, to_date('13-08-1950', 'DD-MM-YYYY'));
insert into client values (59, 'Hilsinger', 'Christian', 'hilsingerchristian@gmail.com', 77634793, to_date('28-08-2003', 'DD-MM-YYYY'));
insert into client values (60, 'Himelright', 'Jaxon', 'himelright.jaxon@apple.com', 78002491, to_date('17-07-1995', 'DD-MM-YYYY'));
insert into client values (61, 'Hisler', 'Julian', 'hislerjulian@apple.com', 38091363, to_date('18-08-1960', 'DD-MM-YYYY'));
insert into client values (62, 'Huenefeld', 'Landon', 'huenefeldlandon@yahoo.com', 75367698, to_date('06-03-1961', 'DD-MM-YYYY'));
insert into client values (63, 'Hughen', 'Chloe', 'hughenchloe@gmail.com', 50224475, to_date('30-09-1950', 'DD-MM-YYYY'));
insert into client values (64, 'Ihm', 'Ella', 'ihm.ella@apple.com', 25517194, to_date('07-10-1969', 'DD-MM-YYYY'));
insert into client values (65, 'Ingemi', 'Grayson', 'ingemigrayson@yahoo.com', 69478510, to_date('22-05-1976', 'DD-MM-YYYY'));
insert into client values (66, 'Isackson', 'Grace', 'isackson_grace@apple.com', 61102983, to_date('12-06-1996', 'DD-MM-YYYY'));
insert into client values (67, 'Iskhakov', 'Jonathan', 'iskhakovjonathan@yahoo.com', 60069919, to_date('09-09-1971', 'DD-MM-YYYY'));
insert into client values (68, 'Jaure', 'Victoria', 'jaure.victoria@yahoo.com', 95095987, to_date('26-05-1972', 'DD-MM-YYYY'));
insert into client values (69, 'Karter', 'Isaiah', 'karter_isaiah@outlook.com', 35898013, to_date('20-09-1996', 'DD-MM-YYYY'));
insert into client values (70, 'Kautzer', 'Aubrey', 'kautzeraubrey@apple.com', 38327013, to_date('10-12-1993', 'DD-MM-YYYY'));
insert into client values (71, 'Kitten', 'Charles', 'kitten.charles@gmail.com', 36492798, to_date('10-01-2004', 'DD-MM-YYYY'));
insert into client values (72, 'Kluz', 'Thomas', 'kluz.thomas@apple.com', 76118371, to_date('07-06-1952', 'DD-MM-YYYY'));
insert into client values (73, 'Koetz', 'Aaron', 'koetzaaron@icloud.com', 83542893, to_date('25-02-2000', 'DD-MM-YYYY'));
insert into client values (74, 'Kummerer', 'Scarlett', 'kummerer.scarlett@icloud.com', 41600341, to_date('31-08-1966', 'DD-MM-YYYY'));
insert into client values (75, 'Kuni', 'Eli', 'kuni.eli@icloud.com', 92721356, to_date('28-02-1980', 'DD-MM-YYYY'));
insert into client values (76, 'Elayyan', 'Zoey', 'elayyan.zoey@apple.com', 77649070, to_date('25-09-1972', 'DD-MM-YYYY'));
insert into client values (77, 'Elnaggar', 'Connor', 'elnaggar_connor@outlook.com', 84515434, to_date('03-12-1952', 'DD-MM-YYYY'));
insert into client values (78, 'Embert', 'Jeremiah', 'embert.jeremiah@icloud.com', 22029378, to_date('25-07-1968', 'DD-MM-YYYY'));
insert into client values (79, 'Emlaw', 'Cameron', 'emlawcameron@icloud.com', 61973308, to_date('05-06-1974', 'DD-MM-YYYY'));
insert into client values (80, 'Espelien', 'Addison', 'espelien_addison@apple.com', 28700922, to_date('18-09-1995', 'DD-MM-YYYY'));
insert into client values (81, 'Falquez', 'Lily', 'falquezlily@gmail.com', 22078632, to_date('13-04-2003', 'DD-MM-YYYY'));
insert into client values (82, 'Falta', 'Josiah', 'faltajosiah@yahoo.com', 90911245, to_date('24-03-1967', 'DD-MM-YYYY'));
insert into client values (83, 'Fangue', 'Lillian', 'fangue.lillian@gmail.com', 96135155, to_date('19-03-1974', 'DD-MM-YYYY'));
insert into client values (84, 'Ferrarelli', 'Adrian', 'ferrarelli_adrian@apple.com', 76952126, to_date('14-08-1995', 'DD-MM-YYYY'));
insert into client values (85, 'Fitgerald', 'Natalie', 'fitgerald.natalie@gmail.com', 38526376, to_date('15-05-1978', 'DD-MM-YYYY'));
insert into client values (86, 'Fitzerald', 'Hannah', 'fitzeraldhannah@outlook.com', 29171969, to_date('14-07-1994', 'DD-MM-YYYY'));
insert into client values (87, 'Fixmer', 'Aria', 'fixmer.aria@gmail.com', 35723212, to_date('30-11-1953', 'DD-MM-YYYY'));
insert into client values (88, 'Flandro', 'Layla', 'flandro_layla@outlook.com', 40301182, to_date('08-10-1996', 'DD-MM-YYYY'));
insert into client values (89, 'Poyser', 'Colton', 'poysercolton@icloud.com', 26163107, to_date('14-08-2001', 'DD-MM-YYYY'));
insert into client values (90, 'Ridpath', 'Brooklyn', 'ridpath.brooklyn@yahoo.com', 45900773, to_date('08-02-1956', 'DD-MM-YYYY'));
insert into client values (91, 'Romanek', 'Jordan', 'romanekjordan@yahoo.com', 24265460, to_date('04-03-1987', 'DD-MM-YYYY'));
insert into client values (92, 'Schara', 'Brayden', 'scharabrayden@yahoo.com', 54641470, to_date('30-06-1985', 'DD-MM-YYYY'));
insert into client values (93, 'Schnipke', 'Nicholas', 'schnipke.nicholas@gmail.com', 81141406, to_date('12-08-1989', 'DD-MM-YYYY'));
insert into client values (94, 'Slayter', 'Robert', 'slayter.robert@apple.com', 50746844, to_date('23-02-1988', 'DD-MM-YYYY'));
insert into client values (95, 'Sodhi', 'Angel', 'sodhi.angel@yahoo.com', 60490476, to_date('01-04-1996', 'DD-MM-YYYY'));
insert into client values (96, 'Solinger', 'Alexa', 'solinger.alexa@gmail.com', 35386212, to_date('30-10-1992', 'DD-MM-YYYY'));
insert into client values (97, 'Steffler', 'Hudson', 'steffler_hudson@yahoo.com', 61578120, to_date('07-03-1987', 'DD-MM-YYYY'));
insert into client values (98, 'Stegemann', 'Zoe', 'stegemann.zoe@gmail.com', 76561286, to_date('21-09-1963', 'DD-MM-YYYY'));
insert into client values (99, 'Tomaro', 'Lincoln', 'tomarolincoln@apple.com', 32600298, to_date('22-10-1960', 'DD-MM-YYYY'));
insert into client values (100, 'Totton', 'Penelope', 'tottonpenelope@gmail.com', 20983569, to_date('03-04-1978', 'DD-MM-YYYY'));
insert into client values (101, 'Waker', 'Evan', 'waker_evan@apple.com', 79119942, to_date('25-02-2000', 'DD-MM-YYYY'));
insert into client values (102, 'Weisensel', 'Dominic', 'weisenseldominic@gmail.com', 94798364, to_date('11-09-1957', 'DD-MM-YYYY'));
insert into client values (103, 'Zangara', 'Austin', 'zangara_austin@apple.com', 61829976, to_date('01-12-1980', 'DD-MM-YYYY'));
insert into client values (104, 'Nickel', 'Gavin', 'nickel_gavin@outlook.com', 61159671, to_date('21-03-1983', 'DD-MM-YYYY'));
insert into client values (105, 'Sells', 'Nolan', 'sells_nolan@apple.com', 96723381, to_date('05-02-1965', 'DD-MM-YYYY'));
insert into client values (106, 'Pinkerton', 'Riley', 'pinkerton_riley@apple.com', 27485106, to_date('29-08-1962', 'DD-MM-YYYY'));
insert into client values (107, 'Dao', 'Leah', 'dao_leah@apple.com', 41899552, to_date('12-03-1968', 'DD-MM-YYYY'));
insert into client values (108, 'Dion', 'Audrey', 'dionaudrey@outlook.com', 92587503, to_date('30-12-1985', 'DD-MM-YYYY'));
insert into client values (109, 'Mcfarlane', 'Savannah', 'mcfarlanesavannah@gmail.com', 11621304, to_date('16-02-1978', 'DD-MM-YYYY'));
insert into client values (110, 'Atwell', 'Parker', 'atwell_parker@yahoo.com', 35977465, to_date('27-09-2004', 'DD-MM-YYYY'));
insert into client values (111, 'Ridenour', 'Adam', 'ridenouradam@icloud.com', 27435336, to_date('30-06-1965', 'DD-MM-YYYY'));
insert into client values (112, 'Sturgill', 'Chase', 'sturgillchase@outlook.com', 89543213, to_date('01-02-1989', 'DD-MM-YYYY'));
insert into client values (113, 'Schoen', 'Allison', 'schoen_allison@icloud.com', 85449814, to_date('04-12-1994', 'DD-MM-YYYY'));
insert into client values (114, 'Partin', 'Jace', 'partin_jace@gmail.com', 40295490, to_date('06-05-1955', 'DD-MM-YYYY'));
insert into client values (115, 'Nemeth', 'Samantha', 'nemeth.samantha@gmail.com', 52210078, to_date('07-02-1991', 'DD-MM-YYYY'));
insert into client values (116, 'Almonte', 'Nora', 'almonte.nora@outlook.com', 63791466, to_date('09-02-1950', 'DD-MM-YYYY'));
insert into client values (117, 'Pan', 'Ian', 'panian@yahoo.com', 47362442, to_date('26-10-1960', 'DD-MM-YYYY'));
insert into client values (118, 'Rickard', 'Skylar', 'rickard_skylar@yahoo.com', 85371560, to_date('09-07-1972', 'DD-MM-YYYY'));
insert into client values (119, 'Wentworth', 'Camila', 'wentworthcamila@apple.com', 65764408, to_date('22-07-1957', 'DD-MM-YYYY'));
insert into client values (120, 'Sammons', 'Cooper', 'sammons_cooper@icloud.com', 30624269, to_date('19-07-1958', 'DD-MM-YYYY'));
insert into client values (121, 'Sayre', 'Easton', 'sayre.easton@apple.com', 32307649, to_date('19-06-1970', 'DD-MM-YYYY'));
insert into client values (122, 'Southerland', 'Kevin', 'southerlandkevin@gmail.com', 96134861, to_date('22-04-1991', 'DD-MM-YYYY'));
insert into client values (123, 'Ahn', 'Jose', 'ahnjose@apple.com', 65538442, to_date('02-01-1979', 'DD-MM-YYYY'));
insert into client values (124, 'Parisi', 'Tyler', 'parisityler@apple.com', 56336442, to_date('03-11-1980', 'DD-MM-YYYY'));
insert into client values (125, 'Carrion', 'Anna', 'carrion_anna@apple.com', 40770793, to_date('20-09-2002', 'DD-MM-YYYY'));
insert into client values (126, 'Testa', 'Brandon', 'testabrandon@apple.com', 25843382, to_date('23-02-1950', 'DD-MM-YYYY'));
insert into client values (127, 'Shorter', 'Asher', 'shorter_asher@outlook.com', 83322484, to_date('30-09-1957', 'DD-MM-YYYY'));
insert into client values (128, 'Covert', 'Paisley', 'covertpaisley@apple.com', 26428730, to_date('04-07-1951', 'DD-MM-YYYY'));
insert into client values (129, 'Gorham', 'Jaxson', 'gorham_jaxson@gmail.com', 16926031, to_date('27-08-1990', 'DD-MM-YYYY'));
insert into client values (130, 'Alcantara', 'Mateo', 'alcantara_mateo@apple.com', 94342329, to_date('15-04-1996', 'DD-MM-YYYY'));
insert into client values (131, 'Belton', 'Jason', 'belton.jason@icloud.com', 92259369, to_date('23-04-1984', 'DD-MM-YYYY'));
insert into client values (132, 'Bannister', 'Ariana', 'bannister.ariana@icloud.com', 41897601, to_date('22-05-1994', 'DD-MM-YYYY'));
insert into client values (133, 'Sharkey', 'Ayden', 'sharkeyayden@yahoo.com', 60901207, to_date('29-11-1952', 'DD-MM-YYYY'));
insert into client values (134, 'Mccreary', 'Ellie', 'mccrearyellie@yahoo.com', 15305533, to_date('18-08-1997', 'DD-MM-YYYY'));
insert into client values (135, 'Pannell', 'Aaliyah', 'pannell.aaliyah@icloud.com', 67056614, to_date('17-01-1990', 'DD-MM-YYYY'));
insert into client values (136, 'Keeling', 'Zachary', 'keeling_zachary@yahoo.com', 24736463, to_date('11-06-1966', 'DD-MM-YYYY'));
insert into client values (137, 'Mahaffey', 'Claire', 'mahaffey.claire@yahoo.com', 60751469, to_date('04-01-1964', 'DD-MM-YYYY'));
insert into client values (138, 'Niles', 'Violet', 'niles_violet@gmail.com', 51735493, to_date('03-10-1963', 'DD-MM-YYYY'));
insert into client values (139, 'Mccue', 'Stella', 'mccuestella@yahoo.com', 65276612, to_date('18-05-1963', 'DD-MM-YYYY'));
insert into client values (140, 'Vargo', 'Sadie', 'vargo.sadie@outlook.com', 80515522, to_date('29-11-1954', 'DD-MM-YYYY'));
insert into client values (141, 'Holcombe', 'Carson', 'holcombe.carson@icloud.com', 27293865, to_date('15-03-1970', 'DD-MM-YYYY'));
insert into client values (142, 'Ralph', 'Mila', 'ralph.mila@gmail.com', 70646333, to_date('26-07-1995', 'DD-MM-YYYY'));
insert into client values (143, 'Castleberry', 'Xavier', 'castleberry_xavier@yahoo.com', 32241488, to_date('25-03-1996', 'DD-MM-YYYY'));
insert into client values (144, 'Snipes', 'Gabriella', 'snipesgabriella@outlook.com', 37863940, to_date('10-04-1966', 'DD-MM-YYYY'));
insert into client values (145, 'Nutter', 'Leo', 'nutterleo@yahoo.com', 22000445, to_date('21-08-1990', 'DD-MM-YYYY'));
insert into client values (146, 'Vanmeter', 'Lucy', 'vanmeter.lucy@outlook.com', 97544617, to_date('04-07-1955', 'DD-MM-YYYY'));
insert into client values (147, 'Wilt', 'Arianna', 'wiltarianna@apple.com', 55132464, to_date('23-03-1958', 'DD-MM-YYYY'));
insert into client values (148, 'Mendiola', 'Kennedy', 'mendiola_kennedy@outlook.com', 19524191, to_date('20-09-1971', 'DD-MM-YYYY'));
insert into client values (149, 'Burchett', 'Sarah', 'burchettsarah@icloud.com', 34015117, to_date('03-12-1994', 'DD-MM-YYYY'));
insert into client values (150, 'Enos', 'Madelyn', 'enos.madelyn@icloud.com', 23510050, to_date('20-04-1968', 'DD-MM-YYYY'));
insert into client values (151, 'Jobe', 'Eleanor', 'jobeeleanor@outlook.com', 82792463, to_date('21-11-1972', 'DD-MM-YYYY'));
insert into client values (152, 'Kirkwood', 'Kaylee', 'kirkwood.kaylee@gmail.com', 63633635, to_date('21-10-1981', 'DD-MM-YYYY'));
insert into client values (153, 'Pedroza', 'Caroline', 'pedrozacaroline@outlook.com', 60536170, to_date('08-05-1989', 'DD-MM-YYYY'));
insert into client values (154, 'Iglesias', 'Ezra', 'iglesias_ezra@icloud.com', 86115504, to_date('23-03-1993', 'DD-MM-YYYY'));
insert into client values (155, 'Leong', 'Bentley', 'leong_bentley@yahoo.com', 92222680, to_date('09-07-1955', 'DD-MM-YYYY'));
insert into client values (156, 'Cromer', 'Hazel', 'cromer_hazel@yahoo.com', 61925347, to_date('22-04-1982', 'DD-MM-YYYY'));
insert into client values (157, 'Trice', 'Sawyer', 'trice.sawyer@yahoo.com', 98102895, to_date('18-02-1978', 'DD-MM-YYYY'));
insert into client values (158, 'Magnuson', 'Hailey', 'magnuson_hailey@gmail.com', 81356863, to_date('03-03-2000', 'DD-MM-YYYY'));
insert into client values (159, 'Eagle', 'Kayden', 'eaglekayden@gmail.com', 69713846, to_date('24-11-1969', 'DD-MM-YYYY'));
insert into client values (160, 'Montenegro', 'Blake', 'montenegro_blake@gmail.com', 67119669, to_date('03-04-1982', 'DD-MM-YYYY'));
insert into client values (161, 'Cato', 'Nathaniel', 'cato_nathaniel@apple.com', 55955046, to_date('16-07-1985', 'DD-MM-YYYY'));
insert into client values (162, 'Edmond', 'Christian', 'edmondchristian@apple.com', 42951852, to_date('21-09-1985', 'DD-MM-YYYY'));
insert into client values (163, 'Troy', 'Jaxon', 'troy_jaxon@gmail.com', 66477699, to_date('08-11-1950', 'DD-MM-YYYY'));
insert into client values (164, 'Hendrick', 'Julian', 'hendrick.julian@apple.com', 62357942, to_date('01-06-1983', 'DD-MM-YYYY'));
insert into client values (165, 'Lebron', 'Landon', 'lebronlandon@apple.com', 12099050, to_date('29-11-1970', 'DD-MM-YYYY'));
insert into client values (166, 'Budd', 'Chloe', 'budd.chloe@yahoo.com', 12576979, to_date('07-01-1980', 'DD-MM-YYYY'));
insert into client values (167, 'Lathrop', 'Ella', 'lathrop.ella@icloud.com', 59567952, to_date('29-10-1959', 'DD-MM-YYYY'));
insert into client values (168, 'Montiel', 'Grayson', 'montiel_grayson@yahoo.com', 61196011, to_date('13-09-1985', 'DD-MM-YYYY'));
insert into client values (169, 'Fincher', 'Evelyn', 'fincherevelyn@outlook.com', 58550744, to_date('08-05-1970', 'DD-MM-YYYY'));
insert into client values (170, 'Eggers', 'Avery', 'eggersavery@apple.com', 63845093, to_date('31-07-1992', 'DD-MM-YYYY'));
insert into client values (171, 'Griffis', 'Caleb', 'griffis_caleb@yahoo.com', 63579196, to_date('22-08-2000', 'DD-MM-YYYY'));
insert into client values (172, 'Moen', 'Nathan', 'moen_nathan@yahoo.com', 15701476, to_date('11-01-1970', 'DD-MM-YYYY'));
insert into client values (173, 'Hauck', 'Ryan', 'hauck.ryan@apple.com', 28426805, to_date('29-11-1984', 'DD-MM-YYYY'));
insert into client values (174, 'Lister', 'Audrey', 'listeraudrey@icloud.com', 13324871, to_date('18-08-1950', 'DD-MM-YYYY'));
insert into client values (175, 'Lundberg', 'Savannah', 'lundbergsavannah@icloud.com', 30893171, to_date('16-02-1971', 'DD-MM-YYYY'));
insert into client values (176, 'Cornish', 'Parker', 'cornish.parker@gmail.com', 76152048, to_date('19-02-1988', 'DD-MM-YYYY'));
insert into client values (177, 'Tanaka', 'Adam', 'tanaka.adam@yahoo.com', 17034237, to_date('12-12-1960', 'DD-MM-YYYY'));
insert into client values (178, 'Whitlow', 'Chase', 'whitlow_chase@gmail.com', 12042490, to_date('23-04-1973', 'DD-MM-YYYY'));
insert into client values (179, 'Chou', 'Sawyer', 'chousawyer@icloud.com', 89285382, to_date('22-09-1986', 'DD-MM-YYYY'));
insert into client values (180, 'Griego', 'Hailey', 'griego.hailey@icloud.com', 67736896, to_date('22-06-1991', 'DD-MM-YYYY'));
insert into client values (181, 'Ballinger', 'Kayden', 'ballinger_kayden@outlook.com', 24804556, to_date('10-10-1979', 'DD-MM-YYYY'));
insert into client values (182, 'Prosser', 'Blake', 'prosser.blake@icloud.com', 68622362, to_date('19-07-1981', 'DD-MM-YYYY'));
insert into client values (183, 'Robson', 'Taylor', 'robson.taylor@outlook.com', 95794287, to_date('04-03-1995', 'DD-MM-YYYY'));
insert into client values (184, 'Allman', 'Naomi', 'allman_naomi@apple.com', 33461089, to_date('15-11-1955', 'DD-MM-YYYY'));
insert into client values (185, 'Atchison', 'Brody', 'atchisonbrody@icloud.com', 99449356, to_date('23-07-1955', 'DD-MM-YYYY'));
insert into client values (186, 'Fogarty', 'Luis', 'fogarty.luis@yahoo.com', 64806786, to_date('21-03-1973', 'DD-MM-YYYY'));
insert into client values (187, 'Conaway', 'Miles', 'conaway.miles@outlook.com', 31089435, to_date('15-04-1985', 'DD-MM-YYYY'));
insert into client values (188, 'Riddick', 'Micah', 'riddick.micah@gmail.com', 76237929, to_date('09-12-1985', 'DD-MM-YYYY'));
insert into client values (189, 'Rupert', 'Vincent', 'rupert_vincent@outlook.com', 18849541, to_date('20-12-1955', 'DD-MM-YYYY'));
insert into client values (190, 'Krug', 'Justin', 'krug.justin@yahoo.com', 14554437, to_date('02-09-1980', 'DD-MM-YYYY'));
insert into client values (191, 'Pinkston', 'Aubree', 'pinkstonaubree@icloud.com', 70162228, to_date('07-07-1972', 'DD-MM-YYYY'));
insert into client values (192, 'Coggins', 'Aurora', 'coggins.aurora@icloud.com', 47020402, to_date('12-01-1983', 'DD-MM-YYYY'));
insert into client values (193, 'Earnest', 'Greyson', 'earnest_greyson@icloud.com', 78732780, to_date('10-08-1984', 'DD-MM-YYYY'));
insert into client values (194, 'Fain', 'Declan', 'fain.declan@apple.com', 37813791, to_date('23-03-1977', 'DD-MM-YYYY'));

select * from client;


--Date pentru tabelul Proprietar
insert into proprietar values (1, 'Lo', 'Jordan', 'lojordan@icloud.com', 41799993);
insert into proprietar values (2, 'Kumar', 'Paris', 'kumarparis@gmail.com', 65482612);
insert into proprietar values (3, 'Toledo', 'Shane', 'toledo.shane@yahoo.com', 86678953);
insert into proprietar values (4, 'Lorenz', 'Lane', 'lorenzlane@yahoo.com', 12986972);
insert into proprietar values (5, 'Vallejo', 'Louis', 'vallejo.louis@icloud.com', 84311516);
insert into proprietar values (6, 'Starkey', 'Angelo', 'starkeyangelo@apple.com', 35956836);
insert into proprietar values (7, 'Kitchen', 'Olive', 'kitchen_olive@outlook.com', 25260111);
insert into proprietar values (8, 'Reaves', 'Ayla', 'reaves.ayla@gmail.com', 33766444);
insert into proprietar values (9, 'Demarco', 'Remington', 'demarco_remington@yahoo.com', 87068366);
insert into proprietar values (10, 'Farrar', 'Troy', 'farrartroy@outlook.com', 91055662);
insert into proprietar values (11, 'Stearns', 'Emerson', 'stearns.emerson@apple.com', 40321578);
insert into proprietar values (12, 'Michaud', 'Maximiliano', 'michaudmaximiliano@icloud.com', 86667443);
insert into proprietar values (13, 'Higginbotham', 'Hector', 'higginbotham.hector@yahoo.com', 69430357);
insert into proprietar values (14, 'Fernandes', 'Rosalie', 'fernandes_rosalie@icloud.com', 62206443);
insert into proprietar values (15, 'Isaacs', 'Emilio', 'isaacs.emilio@yahoo.com', 15290725);
insert into proprietar values (16, 'Marion', 'Kali', 'marion.kali@outlook.com', 89679569);
insert into proprietar values (17, 'Guillory', 'Anderson', 'guilloryanderson@yahoo.com', 92680639);
insert into proprietar values (18, 'Priest', 'Trevor', 'priest.trevor@icloud.com', 71679438);
insert into proprietar values (19, 'Meehan', 'Maci', 'meehanmaci@gmail.com', 28164106);
insert into proprietar values (20, 'Oliveira', 'Gemma', 'oliveira.gemma@yahoo.com', 83196710);
insert into proprietar values (21, 'Palma', 'Lilliana', 'palma.lilliana@yahoo.com', 50539293);
insert into proprietar values (22, 'Oswald', 'Raegan', 'oswaldraegan@icloud.com', 72378234);
insert into proprietar values (23, 'Galvez', 'Lena', 'galvezlena@outlook.com', 30972242);
insert into proprietar values (24, 'Loomis', 'Adelaide', 'loomis.adelaide@yahoo.com', 19963072);
insert into proprietar values (25, 'Lind', 'Phoenix', 'lind_phoenix@gmail.com', 11947349);
insert into proprietar values (26, 'Mena', 'Walter', 'mena.walter@gmail.com', 48492926);
insert into proprietar values (27, 'Stclair', 'Journey', 'stclair_journey@gmail.com', 21064891);
insert into proprietar values (28, 'Hinds', 'Johnathan', 'hinds_johnathan@gmail.com', 50779202);
insert into proprietar values (29, 'Reardon', 'Johnny', 'reardon.johnny@gmail.com', 26318445);
insert into proprietar values (30, 'Alley', 'Adelynn', 'alley_adelynn@outlook.com', 63989251);
insert into proprietar values (31, 'Barth', 'Edwin', 'barth.edwin@outlook.com', 18553698);
insert into proprietar values (32, 'Crook', 'Julius', 'crook_julius@outlook.com', 75442678);
insert into proprietar values (33, 'Bliss', 'Alessandra', 'blissalessandra@gmail.com', 88997846);
insert into proprietar values (34, 'Nagel', 'Kenzie', 'nagelkenzie@gmail.com', 11556826);
insert into proprietar values (35, 'Banuelos', 'Barrett', 'banuelos.barrett@yahoo.com', 23110459);
insert into proprietar values (36, 'Parish', 'Miranda', 'parish.miranda@icloud.com', 19686423);
insert into proprietar values (37, 'Harman', 'Leon', 'harman_leon@apple.com', 31749184);
insert into proprietar values (38, 'Douglass', 'Haley', 'douglass_haley@icloud.com', 69071377);
insert into proprietar values (39, 'Kearns', 'June', 'kearns_june@apple.com', 53061171);
insert into proprietar values (40, 'Newcomb', 'Harley', 'newcomb_harley@gmail.com', 12175541);
insert into proprietar values (41, 'Mulligan', 'Charlee', 'mulligancharlee@apple.com', 39274029);
insert into proprietar values (42, 'Coughlin', 'Tyson', 'coughlintyson@icloud.com', 38635105);
insert into proprietar values (43, 'Way', 'Lucille', 'way_lucille@gmail.com', 64107014);
insert into proprietar values (44, 'Fournier', 'Talia', 'fournier_talia@yahoo.com', 57964722);
insert into proprietar values (45, 'Lawler', 'Skyler', 'lawler.skyler@gmail.com', 22507856);

select * from proprietar;

--Date pentru Sediu si Angajati
insert into sediu values (10, 38, null, 0);
insert into sediu values (20, 39, null, 0);
insert into sediu values (30, 30, null, 0);
insert into sediu values (40, 57, null, 0);
insert into sediu values (50, 63, null, 0);


insert into angajat values (1, 'Dalton', 'Maverick', 'dalton.maverick@yahoo.com', 'Director', 34500, 10);
insert into angajat values (2, 'Valencia', 'Aidan', 'valenciaaidan@icloud.com', 'Director', 35400, 20);
insert into angajat values (3, 'Callahan', 'Makayla', 'callahan.makayla@apple.com', 'Director', 91900, 30);
insert into angajat values (4, 'Hensley', 'Molly', 'hensley.molly@gmail.com', 'Director', 16800, 40);
insert into angajat values (5, 'Atkins', 'Tucker', 'atkins_tucker@yahoo.com', 'Director', 54400, 50);
insert into angajat values (6, 'Huffman', 'Emilia', 'huffmanemilia@yahoo.com', 'Consultant', 23200, 20);
insert into angajat values (7, 'Roy', 'Avery', 'roy.avery@outlook.com', 'Consultant', 73100, 30);
insert into angajat values (8, 'Boyer', 'Amir', 'boyeramir@gmail.com', 'Consultant', 44700, 30);
insert into angajat values (9, 'Shields', 'Brian', 'shields.brian@gmail.com', 'Consultant', 73900, 30);
insert into angajat values (10, 'Lin', 'Mya', 'lin.mya@icloud.com', 'Consultant', 36400, 30);
insert into angajat values (11, 'Hancock', 'Kendall', 'hancockkendall@apple.com', 'Consultant', 44200, 30);
insert into angajat values (12, 'Grimes', 'Iker', 'grimesiker@icloud.com', 'Consultant', 28900, 40);
insert into angajat values (13, 'Glenn', 'Melody', 'glenn_melody@outlook.com', 'Agent imobiliar', 84200, 30);
insert into angajat values (14, 'Cline', 'Matteo', 'cline.matteo@outlook.com', 'Agent imobiliar', 78900, 20);
insert into angajat values (15, 'Delacruz', 'Isabel', 'delacruzisabel@yahoo.com', 'Agent imobiliar', 58700, 40);
insert into angajat values (16, 'Camacho', 'Brooke', 'camacho.brooke@apple.com', 'Agent imobiliar', 38500, 20);
insert into angajat values (17, 'Dillon', 'Caden', 'dillon_caden@icloud.com', 'Agent imobiliar', 56000, 30);
insert into angajat values (18, 'Parrish', 'Zayden', 'parrish.zayden@yahoo.com', 'Agent imobiliar', 22300, 40);
insert into angajat values (19, 'Oneill', 'Mckenzie', 'oneill_mckenzie@outlook.com', 'Agent imobiliar', 72800, 20);
insert into angajat values (20, 'Melton', 'Nicole', 'melton.nicole@yahoo.com', 'Agent imobiliar', 62400, 40);
insert into angajat values (21, 'Booth', 'Payton', 'booth_payton@yahoo.com', 'Secretar', 35600, 20);
insert into angajat values (22, 'Kane', 'Margaret', 'kane.margaret@apple.com', 'Secretar', 14500, 20);
insert into angajat values (23, 'Berg', 'Mariah', 'berg_mariah@apple.com', 'Secretar', 35000, 30);
insert into angajat values (24, 'Harrell', 'Andrei', 'harrell.andrei@gmail.com', 'Secretar', 95900, 40);

--Setarea directorilor
begin 
  for ang_id in 1..5 loop
    update sediu set director_id = ang_id where sediu_id = ang_id * 10;  
  end loop;
end;
/

--Update numar de lucratori
declare 
  sum number;
begin
  for sed_id in 1..5 loop
    select count(*) into sum
    from angajat
    where sediu_id = sed_id * 10;
    update sediu set numar_angajati = sum where sediu_id = sed_id * 10;
  end loop;
end;
/

select * from sediu;
select * from angajat;

--Date pentru Hotel
insert into hotel values (1, 'Grand Romania', 5, 59);
insert into hotel values (2, 'Hotel Plaza Bucuresti', 4, 58);
insert into hotel values (3, 'Iasi Resort and Spa', 4, 62);
insert into hotel values (4, 'Iulius Hotel', 2, 61);
insert into hotel values (5, 'ARIA RESORT', 3, 1);
insert into hotel values (6, 'Hotel California', 3, 2);
insert into hotel values (7, 'Hotel Cismigiu', 1, 3);
insert into hotel values (8, 'Liberton', 5, 4);
insert into hotel values (9, 'Grand Plaza', 5, 5);
insert into hotel values (10, 'New York Plaza', 3, 6);

select * from hotel;

--Date pentru Locuinta
insert into locuinta values (1, 500, 2, 0, 53, 1);
insert into locuinta values (2, 1000, 4, 0, 54, 2);
insert into locuinta values (3, 600, 2, 0, 55, 3);
insert into locuinta values (4, 400, 1, 0, 56, 4);
insert into locuinta values (5, 700, 3, 0, 60, 1);
insert into locuinta values (6, 200, 1, 0, 7, 3);
insert into locuinta values (7, 550, 2, 0, 8, 5);
insert into locuinta values (8, 500, 3, 0, 9, 1);
insert into locuinta values (9, 1500, 4, 0, 10, 6);
insert into locuinta values (10, 500, 2, 0, 11, 2);

select * from locuinta;

--Date pentru camera
insert into camera values (1, 500, 1, 120, 1);
insert into camera values (2, 1000, 4, 410, 1);
insert into camera values (3, 600, 2, 205, 1);
insert into camera values (4, 400, 1, 120, 2);
insert into camera values (5, 700, 1, 121, 2);
insert into camera values (6, 200, 1, 101, 3);
insert into camera values (7, 550, 2, 210, 4);
insert into camera values (8, 500, 7, 701, 5);
insert into camera values (9, 1500, 5, 501, 6);
insert into camera values (10, 500, 8, 810, 7);
insert into camera values (11, 500, 10, 1010, 8);
insert into camera values (12, 1000, 4, 409, 8);
insert into camera values (13, 600, 2, 220, 9);
insert into camera values (14, 400, 8, 807, 8);
insert into camera values (15, 700, 5, 505, 4);
insert into camera values (16, 200, 1, 101, 5);

select * from camera;

--Date pentru serviciu
--Putem folosi o secventa
create sequence secv_serviciu
increment by 10
start with 10;

insert into serviciu values (secv_serviciu.nextval, 'Parcare', 8);
insert into serviciu values (secv_serviciu.nextval, 'Pat pentru copii', 10);
insert into serviciu values (secv_serviciu.nextval, 'Masina de spalat rufe', 9);
insert into serviciu values (secv_serviciu.nextval, 'Masina de spalat vase', 10);
insert into serviciu values (secv_serviciu.nextval, 'Paturi separate', 6);
insert into serviciu values (secv_serviciu.nextval, 'Bucatarie moderna', 10);
insert into serviciu values (secv_serviciu.nextval, 'Cabina de dus', 9);
insert into serviciu values (secv_serviciu.nextval, 'Teren de joaca pentru copii', 10);
insert into serviciu values (secv_serviciu.nextval, 'Deserivire in camera', 10);
insert into serviciu values (secv_serviciu.nextval, 'Bucatarie si sufragerie comuna', 8);
insert into serviciu values (secv_serviciu.nextval, 'Camere spatioase', 9);

select * from serviciu;


--Date pentru Serviciu_Locuinta
insert into serviciu_locuinta values (10, 1);
insert into serviciu_locuinta values (20, 1);
insert into serviciu_locuinta values (80, 1);
insert into serviciu_locuinta values (10, 2);
insert into serviciu_locuinta values (30, 2);
insert into serviciu_locuinta values (10, 3);
insert into serviciu_locuinta values (50, 4);
insert into serviciu_locuinta values (60, 5);
insert into serviciu_locuinta values (70, 6);
insert into serviciu_locuinta values (10, 7);
insert into serviciu_locuinta values (30, 8);
insert into serviciu_locuinta values (40, 8);
insert into serviciu_locuinta values (60, 10);
insert into serviciu_locuinta values (100, 4);
insert into serviciu_locuinta values (110, 6);

select * from serviciu_locuinta;


--Date pentru Serviciu_Hotel
insert into serviciu_hotel values (10, 1);
insert into serviciu_hotel values (110, 1);
insert into serviciu_hotel values (90, 1);
insert into serviciu_hotel values (10, 2);
insert into serviciu_hotel values (20, 3);
insert into serviciu_hotel values (80, 5);
insert into serviciu_hotel values (90, 4);

select * from serviciu_hotel;

--Date pentru Rezervari:
--Locuinte:
create sequence seq_rez_loc
increment by 1
start with 5;

select * from angajat where job = 'Agent imobiliar';

insert into rezervare_locuinta values(seq_rez_loc.nextval, 1, 1, 2, to_date('01-10-2020', 'DD-MM-YYYY'), to_date('01-01-2021', 'DD-MM-YYYY'), to_date('05-01-2020', 'DD-MM-YYYY'), 'Rezervat', 13);
insert into rezervare_locuinta values(seq_rez_loc.nextval, 1, 5, 4, to_date('12-11-2020', 'DD-MM-YYYY'), to_date('20-12-2020', 'DD-MM-YYYY'), to_date('30-12-2020', 'DD-MM-YYYY'), 'Cazat', 14);
insert into rezervare_locuinta values(seq_rez_loc.nextval, 4, 2, 1, to_date('02-11-2020', 'DD-MM-YYYY'), to_date('01-12-2020', 'DD-MM-YYYY'), to_date('31-12-2020', 'DD-MM-YYYY'), 'Cazat', 14);
insert into rezervare_locuinta values(seq_rez_loc.nextval, 6, 10, 2, to_date('30-08-2020', 'DD-MM-YYYY'), to_date('12-02-2021', 'DD-MM-YYYY'), to_date('15-02-2020', 'DD-MM-YYYY'), 'Rezervat', 20);


insert into istoric_rezervare_locuinta values(1, 1, 8, 3, to_date('12-10-2020', 'DD-MM-YYYY'), to_date('19-10-2020', 'DD-MM-YYYY'), 18);
insert into istoric_rezervare_locuinta values(2, 4, 9, 2, to_date('01-10-2020', 'DD-MM-YYYY'), to_date('25-10-2020', 'DD-MM-YYYY'), 20);
insert into istoric_rezervare_locuinta values(3, 5, 4, 2, to_date('15-09-2020', 'DD-MM-YYYY'), to_date('17-09-2020', 'DD-MM-YYYY'), 20);

select * from rezervare_locuinta;
select * from istoric_rezervare_locuinta;

--Hotel:
create sequence seq_rez_hotel
increment by 1
start with 5;

insert into rezervare_hotel values (seq_rez_hotel.nextval, 1, 1, 2, to_date('05-11-2020', 'DD-MM-YYYY'), to_date('05-01-2021', 'DD-MM-YYYY'), to_date('06-01-2020', 'DD-MM-YYYY'), 'Rezervat', 15);
insert into rezervare_hotel values (seq_rez_hotel.nextval, 2, 3, 3, to_date('01-12-2020', 'DD-MM-YYYY'), to_date('12-12-2020', 'DD-MM-YYYY'), to_date('30-12-2020', 'DD-MM-YYYY'), 'Cazat', 16);
insert into rezervare_hotel values (seq_rez_hotel.nextval, 8, 7, 1, to_date('10-09-2020', 'DD-MM-YYYY'), to_date('03-01-2021', 'DD-MM-YYYY'), to_date('10-01-2020', 'DD-MM-YYYY'), 'Rezervat', 17);


insert into istoric_rezervare_hotel values(1, 5, 4, 2, to_date('01-12-2020', 'DD-MM-YYYY'), to_date('07-12-2020', 'DD-MM-YYYY'), 20);
insert into istoric_rezervare_hotel values(2, 8, 3, 4, to_date('15-09-2020', 'DD-MM-YYYY'), to_date('25-09-2020', 'DD-MM-YYYY'), 17);
insert into istoric_rezervare_hotel values(3, 4, 11, 3, to_date('03-11-2020', 'DD-MM-YYYY'), to_date('06-11-2020', 'DD-MM-YYYY'), 16);

select * from rezervare_hotel;
select * from istoric_rezervare_hotel;

commit;

--Verificare:
select * from sediu;
select * from angajat;
select * from client;
select * from proprietar;
select * from locuinta;
select * from hotel;
select * from camera;
select * from locatie;
select * from serviciu;
select * from serviciu_locuinta;
select * from serviciu_hotel;
select * from rezervare_locuinta;
select * from istoric_rezervare_locuinta;
select * from rezervare_hotel;
select * from istoric_rezervare_hotel;