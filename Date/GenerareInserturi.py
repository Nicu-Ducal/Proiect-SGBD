import csv
from random import random, choice
from math import floor
from os import close, write

path_locatie = 'locatie.csv'
path_client = 'client.csv'
path_proprietar = 'proprietar.csv'
path_sediu = 'sediu.csv'
path_angajat = 'angajat.csv'
path_hotel = 'hotel.csv'
output = 'inserts.sql'
dates_output = 'dates.txt'


def generate_dates(number, out):
    def create_list(available):
        return [('0' + str(i) if i < 10 else str(i)) for i in range(1, available + 1)]

    output = open(out, 'w')
    calendar = {
        '01': create_list(31),
        '02': create_list(28),
        '03': create_list(31),
        '04': create_list(30),
        '05': create_list(31),
        '06': create_list(30),
        '07': create_list(31),
        '08': create_list(31),
        '09': create_list(30),
        '10': create_list(31),
        '11': create_list(30),
        '12': create_list(31)
    }

    years = [i for i in range(1950, 2005)]

    for i in range(1, number + 1):
        year = choice(years)
        month = choice(list(calendar))
        day = choice(calendar[month])
        output.write(f"to_date('{day}-{month}-{year}', 'DD-MM-YYYY')\n")

    output.close()


# Populari
def generate_locatie(path, out):
    csv_file = open(path, 'r')
    output = open(out, 'w')

    csv_reader = csv.reader(csv_file)

    next(csv_reader)
    locatie_id = 0
    for line in csv_reader:
        numar_random = floor(1 + (random() * (500 - 1)))
        adresa = line[0] + " " + str(numar_random)
        oras = line[1]
        tara = line[2]
        locatie_id += 1
        cod_postal = floor(100001 + (random() * (999999 - 100001)))
        query = f"insert into locatie values ({locatie_id}, '{adresa}', {cod_postal}, '{oras}', '{tara}');"
        output.write(query + "\n")

    csv_file.close()
    output.close()


def generate_client(path, out):
    csv_file = open(path, 'r')
    output = open(out, 'w')

    csv_reader = csv.reader(csv_file)
    emails = ['gmail.com', 'yahoo.com',
              'outlook.com', 'apple.com', 'icloud.com']
    delimitators = ['.', '_', ""]

    next(csv_reader)
    client_id = 0
    for line in csv_reader:
        telefon = floor(11111111 + (random() * (99999999 - 11111111)))
        nume = line[0].lower().capitalize()
        prenume = line[1]
        data = line[2]
        email = nume.lower() + choice(delimitators) + \
            prenume.lower() + "@" + choice(emails)
        client_id += 1
        query = f"insert into client values ({client_id}, '{nume}', '{prenume}', '{email}', {telefon}, {data});"
        output.write(query + "\n")

    csv_file.close()
    output.close()


def generate_proprietar(path, out):
    csv_file = open(path, 'r')
    output = open(out, 'w')

    csv_reader = csv.reader(csv_file)
    emails = ['gmail.com', 'yahoo.com',
              'outlook.com', 'apple.com', 'icloud.com']
    delimitators = ['.', '_', ""]

    next(csv_reader)
    proprietar_id = 0
    for line in csv_reader:
        telefon = floor(11111111 + (random() * (99999999 - 11111111)))
        nume = line[0].lower().capitalize()
        prenume = line[1]
        email = nume.lower() + choice(delimitators) + \
            prenume.lower() + "@" + choice(emails)
        proprietar_id += 1
        query = f"insert into proprietar values ({proprietar_id}, '{nume}', '{prenume}', '{email}', {telefon});"
        output.write(query + "\n")

    csv_file.close()
    output.close()


def generate_angajat(path, out):
    csv_file = open(path, 'r')
    output = open(out, 'w')

    csv_reader = csv.reader(csv_file)
    emails = ['gmail.com', 'yahoo.com',
              'outlook.com', 'apple.com', 'icloud.com']
    delimitators = ['.', '_', ""]
    jobs = ['Director', 'Consultant', 'Agent imobiliar', 'Secretar']

    next(csv_reader)
    angajat_id = 0
    for line in csv_reader:
        angajat_id += 1
        salariu = 100 * floor(100 + (random() * (999 - 100)))
        nume = line[0].lower().capitalize()
        prenume = line[1]
        email = nume.lower() + choice(delimitators) + \
            prenume.lower() + "@" + choice(emails)
        job = ""
        sediu_id = 10 * floor(1 + (random() * (5 - 1)))
        if angajat_id <= 5:
            job = jobs[0]
            sediu_id = angajat_id * 10
        elif angajat_id <= 12:
            job = jobs[1]
        elif angajat_id <= 20:
            job = jobs[2]
        else:
            job = jobs[3]

        query = f"insert into angajat values ({angajat_id}, '{nume}', '{prenume}', '{email}', '{job}', {salariu}, {sediu_id});"
        output.write(query + "\n")

    csv_file.close()
    output.close()


# generate_dates(194, dates_output)
# Generare inserturi
# generate_locatie(path_locatie, output)
# generate_client(path_client, output)
# generate_proprietar(path_proprietar, output)
generate_angajat(path_angajat, output)
