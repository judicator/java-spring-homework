-- Взлётно-посадочные полосы
DELETE FROM runway;

-- Рейсы
DELETE FROM flight;

-- Клиенты для уведомлений об изменении статуса рейса
DELETE FROM client_to_notify;

-- Самолёты (модели)
DELETE FROM aircraft;

INSERT INTO aircraft(id, icao_code, model, range, speed, mass, landing_run, takeoff_run, passengers)
VALUES
    (nextval('aircraft_id'), 'A318', 'Airbus A318-100', 3100, 447, 68, 1230, 1780, 132),
    (nextval('aircraft_id'), 'A319', 'Airbus A319-100', 3750, 447, 76, 1360, 1850, 156),
    (nextval('aircraft_id'), 'A320', 'Airbus A320-100', 3300, 447, 78, 1500, 2100, 180),
    (nextval('aircraft_id'), 'A321', 'Airbus A321-100', 3200, 447, 94, 1500, 2100, 220),
    (nextval('aircraft_id'), 'A332', 'Airbus A330-200', 7260, 470, 242, 1730, 2770, 406),
    (nextval('aircraft_id'), 'A333', 'Airbus A330-300', 6340, 470, 242, 1730, 2770, 440),
    (nextval('aircraft_id'), 'E170', 'Embraer E170', 2150, 430, 39, 1241, 1644, 78),
    (nextval('aircraft_id'), 'E195', 'Embraer E190', 2450, 447, 52, 1244, 2100, 114),
    (nextval('aircraft_id'), 'B733', 'Boeing 737-300', 2255, 430, 63, 1860, 2649, 149),
    (nextval('aircraft_id'), 'B734', 'Boeing 737-400', 2060, 430, 68, 1610, 2286, 168),
    (nextval('aircraft_id'), 'B737', 'Boeing 737-700', 3010, 450, 70, 1440, 2042, 140),
    (nextval('aircraft_id'), 'B738', 'Boeing 737-800', 2935, 455, 79, 1630, 2316, 175),
    (nextval('aircraft_id'), 'B762', 'Boeing 767-200', 3900, 480, 143, 1440, 2042, 245),
    (nextval('aircraft_id'), 'B763', 'Boeing 767-300F', 5980, 480, 187, 1630, 2316, 290),
    (nextval('aircraft_id'), 'B772', 'Boeing 777-200ER', 7065, 482, 298, 2400, 3380, 313),
    (nextval('aircraft_id'), 'B77W', 'Boeing 777-300ER', 7370, 482, 351, 2150, 3050, 296),
    (nextval('aircraft_id'), 'DH8D', 'Bombardier Q400', 1100, 360, 31, 1290, 1425, 82);

-- Названия авиакомпаний
DELETE FROM airline;

INSERT INTO airline(name)
VALUES
    ('Aegean Airlines'),
    ('Aer Lingus'),
    ('Aeroflot'),
    ('Aerolineas Argentinas'),
    ('Aeromexico'),
    ('Air Arabia'),
    ('Air Astana'),
    ('Air Austral'),
    ('Air Baltic'),
    ('Air Belgium'),
    ('Air Canada'),
    ('Air Caraibes'),
    ('Air China'),
    ('Air Corsica'),
    ('Air Dolomiti'),
    ('Air Europa'),
    ('Air France'),
    ('Air India'),
    ('Air India Express'),
    ('Air Macau'),
    ('Air Malta'),
    ('Air Mauritius'),
    ('Air Namibia'),
    ('Air New Zealand'),
    ('Air North'),
    ('Air Seoul'),
    ('Air Serbia'),
    ('Air Tahiti Nui'),
    ('Air Transat'),
    ('Air Vanuatu'),
    ('AirAsia'),
    ('AirAsia X'),
    ('Aircalin'),
    ('Alaska Airlines'),
    ('Alitalia'),
    ('Allegiant'),
    ('American Airlines'),
    ('ANA'),
    ('Asiana'),
    ('Austrian'),
    ('Avianca'),
    ('Azerbaijan Hava Yollary'),
    ('Azores Airlines'),
    ('Azul'),
    ('Bamboo Airways'),
    ('Bangkok Airways'),
    ('British Airways'),
    ('Brussels Airlines'),
    ('Caribbean Airlines'),
    ('Cathay Dragon'),
    ('Cathay Pacific'),
    ('Cayman Airways'),
    ('CEBU Pacific Air'),
    ('China Airlines'),
    ('China Eastern'),
    ('China Southern'),
    ('Condor'),
    ('Copa Airlines'),
    ('Croatia Airlines'),
    ('Czech Airlines'),
    ('Delta'),
    ('easyJet'),
    ('Edelweiss Air'),
    ('Egyptair'),
    ('EL AL'),
    ('Emirates'),
    ('Ethiopian Airlines'),
    ('Etihad'),
    ('Eurowings'),
    ('EVA Air'),
    ('Fiji Airways'),
    ('Finnair'),
    ('flydubai'),
    ('FlyOne'),
    ('French bee'),
    ('Frontier'),
    ('Garuda Indonesia'),
    ('Gol'),
    ('Gulf Air'),
    ('Hainan Airlines'),
    ('Hawaiian Airlines'),
    ('Helvetic Airways'),
    ('HK Express'),
    ('Hong Kong Airlines'),
    ('Iberia'),
    ('Icelandair'),
    ('IndiGo Airlines'),
    ('InterJet'),
    ('Japan Airlines'),
    ('Jeju Air'),
    ('Jet2'),
    ('JetBlue'),
    ('Jetstar'),
    ('Jin Air'),
    ('Kenya Airways'),
    ('KLM'),
    ('Korean Air'),
    ('Kulula'),
    ('La Compagnie'),
    ('LATAM'),
    ('Lion Airlines'),
    ('LOT Polish Airlines'),
    ('Lufthansa'),
    ('Luxair'),
    ('Malaysia Airlines'),
    ('Mango'),
    ('Middle East Airlines'),
    ('Nok Air'),
    ('Nordwind Airlines'),
    ('Norwegian Air International'),
    ('Norwegian Air Shuttle'),
    ('Norwegian Air Sweden'),
    ('Norwegian Air UK'),
    ('Oman Air'),
    ('Pakistan International Airlines'),
    ('Peach'),
    ('Pegasus Airlines'),
    ('Philippine Airlines'),
    ('Porter'),
    ('Qantas'),
    ('Qatar Airways'),
    ('Regional Express'),
    ('Rossiya - Russian Airlines'),
    ('Royal Air Maroc'),
    ('Royal Brunei'),
    ('Royal Jordanian'),
    ('RwandAir'),
    ('Ryanair'),
    ('S7 Airlines'),
    ('SAS'),
    ('Saudia'),
    ('Scoot Airlines'),
    ('Shanghai Airlines'),
    ('Silkair'),
    ('Silver'),
    ('Singapore Airlines'),
    ('Skylanes'),
    ('South African Airways'),
    ('Southwest'),
    ('SpiceJet'),
    ('Spirit'),
    ('Spring Airlines'),
    ('Spring Japan'),
    ('SriLankan Airlines'),
    ('Sun Country'),
    ('Sunclass Airlines'),
    ('Sunwing'),
    ('SWISS'),
    ('Swoop'),
    ('TAAG'),
    ('TACA'),
    ('TAP Portugal'),
    ('THAI'),
    ('tigerair Australia'),
    ('Transavia Airlines'),
    ('TUI UK'),
    ('TUIfly'),
    ('Tunis Air'),
    ('Turkish Airlines'),
    ('Ukraine International'),
    ('United'),
    ('Ural Airlines'),
    ('UTair Aviation'),
    ('Uzbekistan Airways'),
    ('Vietnam Airlines'),
    ('Virgin Atlantic'),
    ('Virgin Australia'),
    ('Vistara'),
    ('Viva Aerobus'),
    ('Volaris'),
    ('Volotea'),
    ('Vueling Airlines'),
    ('WestJet'),
    ('Wizzair'),
    ('Xiamen Airlines');

-- Аэропорты
DELETE FROM airport;

INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'HIR', 'SB', -9.428, 160.054993, 'Honiara International Airport', 'Honiara', 'Pacific/Guadalcanal');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'POM', 'PG', -9.443380355834961, 147.22000122070312, 'Port Moresby Jacksons International Airport', 'Port Moresby', 'Pacific/Port_Moresby');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'KEF', 'IS', 63.985001, -22.6056, 'Keflavik International Airport', 'Reykjavík', 'Atlantic/Reykjavik');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'YEG', 'CA', 53.3097, -113.580002, 'Edmonton International Airport', 'Edmonton', 'America/Edmonton');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'YHZ', 'CA', 44.8807983398, -63.5085983276, 'Halifax / Stanfield International Airport', 'Halifax', 'America/Halifax');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'YOW', 'CA', 45.322498, -75.669197, 'Ottawa Macdonald-Cartier International Airport', 'Ottawa', 'America/Toronto');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'YQB', 'CA', 46.7911, -71.393303, 'Quebec Jean Lesage International Airport', 'Quebec', 'America/Toronto');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'YUL', 'CA', 45.4706001282, -73.7407989502, 'Montreal / Pierre Elliott Trudeau International Airport', 'Montréal', 'America/Toronto');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'YVR', 'CA', 49.193901062, -123.183998108, 'Vancouver International Airport', 'Vancouver', 'America/Vancouver');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'YWG', 'CA', 49.909999847399995, -97.2398986816, 'Winnipeg / James Armstrong Richardson International Airport', 'Winnipeg', 'America/Winnipeg');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'YXS', 'CA', 53.884311, -122.666554, 'Prince George Airport', 'Prince George', 'America/Vancouver');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'YXX', 'CA', 49.025299, -122.361, 'Abbotsford International Airport', 'Abbotsford', 'America/Vancouver');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'YYC', 'CA', 51.113899231, -114.019996643, 'Calgary International Airport', 'Calgary', 'America/Edmonton');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'YYJ', 'CA', 48.6469, -123.426003, 'Victoria International Airport', 'Victoria', 'America/Vancouver');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'YYT', 'CA', 47.618599, -52.7519, 'St. John''s International Airport', 'St. John''s', 'America/St_Johns');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'YYZ', 'CA', 43.6772, -79.6306, 'Toronto Lester B. Pearson International Airport', 'Toronto', 'America/Toronto');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'ALG', 'DZ', 36.693886, 3.214531, 'Houari Boumediene Airport', 'Algiers', 'Africa/Algiers');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'ACC', 'GH', 5.605189800262451, -0.16678600013256073, 'Kotoka International Airport', 'Accra', 'Africa/Accra');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'ABV', 'NG', 9.006790161132812, 7.263169765472412, 'Nnamdi Azikiwe International Airport', 'Abuja', 'Africa/Lagos');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'LOS', 'NG', 6.5773701667785645, 3.321160078048706, 'Murtala Muhammed International Airport', 'Lagos', 'Africa/Lagos');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'NIM', 'NE', 13.4815, 2.18361, 'Diori Hamani International Airport', 'Niamey', 'Africa/Niamey');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'TUN', 'TN', 36.851002, 10.2272, 'Tunis Carthage International Airport', 'Tunis', 'Africa/Tunis');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BRU', 'BE', 50.901402, 4.48444, 'Brussels Airport', 'Zaventem', 'Europe/Brussels');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BER', 'DE', 52.362247, 13.500672, 'Berlin Brandenburg Airport', 'Berlin', 'Europe/Berlin');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'FRA', 'DE', 50.036521, 8.561268, 'Frankfurt Airport', 'Frankfurt am Main', 'Europe/Berlin');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'HAM', 'DE', 53.630402, 9.98823, 'Hamburg Helmut Schmidt Airport', 'Hamburg', 'Europe/Berlin');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'CGN', 'DE', 50.865898, 7.14274, 'Cologne Bonn Airport', 'Köln (Cologne)', 'Europe/Berlin');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'DUS', 'DE', 51.289501, 6.76678, 'Düsseldorf Airport', 'Düsseldorf', 'Europe/Berlin');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MUC', 'DE', 48.353802, 11.7861, 'Munich Airport', 'Munich', 'Europe/Berlin');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'NUE', 'DE', 49.498699, 11.078056, 'Nuremberg Airport', 'Nuremberg', 'Europe/Berlin');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'LEJ', 'DE', 51.423889, 12.236389, 'Leipzig/Halle Airport', 'Schkeuditz', 'Europe/Berlin');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'STR', 'DE', 48.689899444599995, 9.22196006775, 'Stuttgart Airport', 'Stuttgart', 'Europe/Berlin');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'HAJ', 'DE', 52.461102, 9.68508, 'Hannover Airport', 'Hannover', 'Europe/Berlin');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'TLL', 'EE', 59.41329956049999, 24.832799911499997, 'Lennart Meri Tallinn Airport', 'Tallinn', 'Europe/Tallinn');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'HEL', 'FI', 60.3172, 24.963301, 'Helsinki Vantaa Airport', 'Helsinki', 'Europe/Helsinki');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BFS', 'GB', 54.6575012207, -6.2158298492399995, 'Belfast International Airport', 'Belfast', 'Europe/London');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BHX', 'GB', 52.453899383499994, -1.74802994728, 'Birmingham International Airport', 'Birmingham', 'Europe/London');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MAN', 'GB', 53.349375, -2.279521, 'Manchester Airport', 'Manchester', 'Europe/London');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'LTN', 'GB', 51.874698638916016, -0.36833301186561584, 'London Luton Airport', 'London', 'Europe/London');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'LGW', 'GB', 51.148102, -0.190278, 'London Gatwick Airport', 'London', 'Europe/London');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'LHR', 'GB', 51.4706, -0.461941, 'London Heathrow Airport', 'London', 'Europe/London');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'GLA', 'GB', 55.871899, -4.43306, 'Glasgow International Airport', 'Paisley, Renfrewshire', 'Europe/London');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'EDI', 'GB', 55.950145, -3.372288, 'Edinburgh Airport', 'Edinburgh', 'Europe/London');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'STN', 'GB', 51.8849983215, 0.234999999404, 'London Stansted Airport', 'London', 'Europe/London');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'AMS', 'NL', 52.308601, 4.76389, 'Amsterdam Airport Schiphol', 'Amsterdam', 'Europe/Amsterdam');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'EIN', 'NL', 51.4500999451, 5.37452983856, 'Eindhoven Airport', 'Eindhoven', 'Europe/Amsterdam');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'EHU', 'CN', 30.341178, 115.03926, 'Ezhou Huahu Airport', 'Ezhou', 'America/Nome');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'DUB', 'IE', 53.428713, -6.262121, 'Dublin Airport', 'Dublin', 'Europe/Dublin');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SNN', 'IE', 52.702, -8.92482, 'Shannon Airport', 'Shannon', 'Europe/Dublin');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BLL', 'DK', 55.7402992249, 9.15178012848, 'Billund Airport', 'Billund', 'Europe/Copenhagen');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'CPH', 'DK', 55.617900848389, 12.656000137329, 'Copenhagen Kastrup Airport', 'Copenhagen', 'Europe/Copenhagen');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'LUX', 'LU', 49.6233333, 6.2044444, 'Luxembourg-Findel International Airport', 'Luxembourg', 'Europe/Luxembourg');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BGO', 'NO', 60.2934, 5.21814, 'Bergen Airport, Flesland', 'Bergen', 'Europe/Oslo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'OSL', 'NO', 60.193901, 11.1004, 'Oslo Airport, Gardermoen', 'Oslo', 'Europe/Oslo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'TOS', 'NO', 69.683296, 18.9189, 'Tromsø Airport, Langnes', 'Tromsø', 'Europe/Oslo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'TRD', 'NO', 63.457802, 10.924, 'Trondheim Airport, Værnes', 'Trondheim', 'Europe/Oslo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SVG', 'NO', 58.876701, 5.63778, 'Stavanger Airport, Sola', 'Stavanger', 'Europe/Oslo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'GDN', 'PL', 54.377601623535156, 18.46619987487793, 'Gdańsk Lech Wałęsa Airport', 'Gdańsk', 'Europe/Warsaw');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'KRK', 'PL', 50.077702, 19.7848, 'Kraków John Paul II International Airport', 'Kraków', 'Europe/Warsaw');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'WAW', 'PL', 52.1656990051, 20.967100143399996, 'Warsaw Chopin Airport', 'Warsaw', 'Europe/Warsaw');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'GOT', 'SE', 57.662799835205, 12.279800415039, 'Gothenburg-Landvetter Airport', 'Gothenburg', 'Europe/Stockholm');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'ARN', 'SE', 59.651901245117, 17.918600082397, 'Stockholm-Arlanda Airport', 'Stockholm', 'Europe/Stockholm');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'RIX', 'LV', 56.923599, 23.9711, 'Riga International Airport', 'Riga', 'Europe/Riga');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'VNO', 'LT', 54.634102, 25.285801, 'Vilnius International Airport', 'Vilnius', 'Europe/Vilnius');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'CPT', 'ZA', -33.9648017883, 18.6016998291, 'Cape Town International Airport', 'Cape Town', 'Africa/Johannesburg');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'DUR', 'ZA', -29.6144444444, 31.1197222222, 'King Shaka International Airport', 'Durban', 'Africa/Johannesburg');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'JNB', 'ZA', -26.1392, 28.246, 'OR Tambo International Airport', 'Johannesburg', 'Africa/Johannesburg');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'GBE', 'BW', -24.555201, 25.9182, 'Sir Seretse Khama International Airport', 'Gaborone', 'Africa/Gaborone');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SHO', 'SZ', -26.358611, 31.716944, 'King Mswati III International Airport', 'Mpaka', 'Africa/Mbabane');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MRU', 'MU', -20.430201, 57.683601, 'Sir Seewoosagur Ramgoolam International Airport', 'Plaine Magnien', 'Indian/Mauritius');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'LUN', 'ZM', -15.330833, 28.452722, 'Kenneth Kaunda International Airport', 'Lusaka', 'Africa/Lusaka');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'RUN', 'RE', -20.890087, 55.518894, 'Roland Garros Airport', 'Sainte-Marie', 'Indian/Reunion');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'TNR', 'MG', -18.7969, 47.478802, 'Ivato Airport', 'Antananarivo', 'Indian/Antananarivo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'LAD', 'AO', -8.85837, 13.2312, 'Quatro de Fevereiro International Airport', 'Luanda', 'Africa/Luanda');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MPM', 'MZ', -25.920799, 32.572601, 'Maputo Airport', 'Maputo', 'Africa/Maputo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SEZ', 'SC', -4.67434, 55.521801, 'Seychelles International Airport', 'Mahe Island', 'Indian/Mahe');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'NDJ', 'TD', 12.1337, 15.034, 'N''Djamena International Airport', 'N''Djamena', 'Africa/Ndjamena');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'HRE', 'ZW', -17.931801, 31.0928, 'Robert Gabriel Mugabe International Airport', 'Harare', 'Africa/Harare');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'WDH', 'NA', -22.4799, 17.4709, 'Hosea Kutako International Airport', 'Windhoek', 'Africa/Windhoek');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'FIH', 'CD', -4.38575, 15.4446, 'Ndjili International Airport', 'Kinshasa', 'Africa/Kinshasa');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BKO', 'ML', 12.5335, -7.94994, 'Modibo Keita International Airport', 'Bamako', 'Africa/Bamako');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BJL', 'GM', 13.338, -16.652201, 'Banjul International Airport', 'Banjul', 'Africa/Banjul');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'FUE', 'ES', 28.4527, -13.8638, 'Fuerteventura Airport', 'El Matorral', 'Atlantic/Canary');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'LPA', 'ES', 27.9319, -15.3866, 'Gran Canaria Airport', 'Gran Canaria Island', 'Atlantic/Canary');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'ACE', 'ES', 28.945499, -13.6052, 'César Manrique-Lanzarote Airport', 'San Bartolomé', 'Atlantic/Canary');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'TFS', 'ES', 28.0445, -16.5725, 'Tenerife Sur Airport', 'Tenerife', 'Atlantic/Canary');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'FNA', 'SL', 8.61644, -13.1955, 'Lungi International Airport', 'Freetown (Lungi-Town)', 'Africa/Freetown');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'ROB', 'LR', 6.23379, -10.3623, 'Roberts International Airport', 'Monrovia', 'Africa/Monrovia');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'CMN', 'MA', 33.36750030517578, -7.589970111846924, 'Mohammed V International Airport', 'Casablanca', 'Africa/Casablanca');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'DSS', 'SN', 14.67, -17.073333, 'Blaise Diagne International Airport', 'Dakar', 'Africa/Dakar');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'NKC', 'MR', 18.31, -15.9697222, 'Nouakchott–Oumtounsy International Airport', 'Nouakchott', 'Africa/Nouakchott');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SID', 'CV', 16.7414, -22.9494, 'Amílcar Cabral International Airport', 'Espargos', 'Atlantic/Cape_Verde');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'ADD', 'ET', 8.97789, 38.799301, 'Addis Ababa Bole International Airport', 'Addis Ababa', 'Africa/Addis_Ababa');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'JIB', 'DJ', 11.5473, 43.1595, 'Djibouti-Ambouli Airport', 'Djibouti City', 'Africa/Djibouti');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'CAI', 'EG', 30.111534, 31.396694, 'Cairo International Airport', 'Cairo', 'Africa/Cairo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'HRG', 'EG', 27.176776, 33.796692, 'Hurghada International Airport', 'Hurghada', 'Africa/Cairo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SSH', 'EG', 27.977272, 34.394717, 'Sharm El Sheikh International Airport', 'Sharm El Sheikh', 'Africa/Cairo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'JUB', 'SS', 4.87201, 31.601101, 'Juba International Airport', 'Juba', 'Africa/Juba');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'NBO', 'KE', -1.31923997402, 36.9277992249, 'Jomo Kenyatta International Airport', 'Nairobi', 'Africa/Nairobi');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MBA', 'KE', -4.03483, 39.5942, 'Moi International Airport', 'Mombasa', 'Africa/Nairobi');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MJI', 'LY', 32.89177, 13.287878, 'Mitiga International Airport', 'Tripoli', 'Africa/Tripoli');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'KGL', 'RW', -1.96863, 30.1395, 'Kigali International Airport', 'Kigali', 'Africa/Kigali');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'KRT', 'SD', 15.5895, 32.5532, 'Khartoum International Airport', 'Khartoum', 'Africa/Khartoum');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'DAR', 'TZ', -6.87811, 39.202599, 'Julius Nyerere International Airport', 'Dar es Salaam', 'Africa/Dar_es_Salaam');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'ZNZ', 'TZ', -6.22202, 39.224899, 'Abeid Amani Karume International Airport', 'Zanzibar', 'Africa/Dar_es_Salaam');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'EBB', 'UG', 0.042386, 32.443501, 'Entebbe International Airport', 'Kampala', 'Africa/Kampala');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'ATL', 'US', 33.6367, -84.428101, 'Hartsfield Jackson Atlanta International Airport', 'Atlanta', 'America/New_York');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'AUS', 'US', 30.197535, -97.662015, 'Austin Bergstrom International Airport', 'Austin', 'America/Chicago');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BNA', 'US', 36.1245002746582, -86.6781997680664, 'Nashville International Airport', 'Nashville', 'America/Chicago');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BOS', 'US', 42.3643, -71.005203, 'Logan International Airport', 'Boston', 'America/New_York');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BUF', 'US', 42.94049835, -78.73220062, 'Buffalo Niagara International Airport', 'Buffalo', 'America/New_York');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BWI', 'US', 39.1754, -76.668297, 'Baltimore/Washington International Thurgood Marshall Airport', 'Baltimore', 'America/New_York');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'CLE', 'US', 41.4117012024, -81.8498001099, 'Cleveland Hopkins International Airport', 'Cleveland', 'America/New_York');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'CLT', 'US', 35.2140007019043, -80.94309997558594, 'Charlotte Douglas International Airport', 'Charlotte', 'America/New_York');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'CMH', 'US', 39.998001, -82.891899, 'John Glenn Columbus International Airport', 'Columbus', 'America/New_York');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'CVG', 'US', 39.048801, -84.667801, 'Cincinnati Northern Kentucky International Airport', 'Cincinnati / Covington', 'America/New_York');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'DCA', 'US', 38.8521, -77.037697, 'Ronald Reagan Washington National Airport', 'Washington', 'America/New_York');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'DEN', 'US', 39.861698150635, -104.672996521, 'Denver International Airport', 'Denver', 'America/Denver');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'DFW', 'US', 32.896801, -97.038002, 'Dallas Fort Worth International Airport', 'Dallas-Fort Worth', 'America/Chicago');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'DTW', 'US', 42.212398529052734, -83.35340118408203, 'Detroit Metropolitan Wayne County Airport', 'Detroit', 'America/Detroit');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'EWR', 'US', 40.692501, -74.168701, 'Newark Liberty International Airport', 'Newark', 'America/New_York');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'FLL', 'US', 26.072599, -80.152702, 'Fort Lauderdale Hollywood International Airport', 'Fort Lauderdale', 'America/New_York');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'IAD', 'US', 38.9445, -77.455803, 'Washington Dulles International Airport', 'Dulles', 'America/New_York');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'IAH', 'US', 29.984399795532227, -95.34140014648438, 'George Bush Intercontinental Houston Airport', 'Houston', 'America/Chicago');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'IND', 'US', 39.7173, -86.294403, 'Indianapolis International Airport', 'Indianapolis', 'America/Indiana/Indianapolis');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'JAX', 'US', 30.49410057067871, -81.68789672851562, 'Jacksonville International Airport', 'Jacksonville', 'America/New_York');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'JFK', 'US', 40.639447, -73.779317, 'John F Kennedy International Airport', 'New York', 'America/New_York');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'LAS', 'US', 36.083361, -115.151817, 'Harry Reid International Airport', 'Las Vegas', 'America/Los_Angeles');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'LAX', 'US', 33.942501, -118.407997, 'Los Angeles / Tom Bradley International Airport', 'Los Angeles', 'America/Los_Angeles');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'LGA', 'US', 40.777199, -73.872597, 'La Guardia Airport', 'New York', 'America/New_York');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MCI', 'US', 39.2976, -94.713898, 'Kansas City International Airport', 'Kansas City', 'America/Chicago');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MCO', 'US', 28.429399490356445, -81.30899810791016, 'Orlando International Airport', 'Orlando', 'America/New_York');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MDW', 'US', 41.785999, -87.752403, 'Chicago Midway International Airport', 'Chicago', 'America/Chicago');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MEM', 'US', 35.04240036010742, -89.97669982910156, 'Memphis International Airport', 'Memphis', 'America/Chicago');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MIA', 'US', 25.79319953918457, -80.29060363769531, 'Miami International Airport', 'Miami', 'America/New_York');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MKE', 'US', 42.947200775146484, -87.89659881591797, 'General Mitchell International Airport', 'Milwaukee', 'America/Chicago');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MSP', 'US', 44.882, -93.221802, 'Minneapolis–Saint Paul International Airport / Wold–Chamberlain Field', 'Minneapolis', 'America/Chicago');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MSY', 'US', 29.99340057373047, -90.25800323486328, 'Louis Armstrong New Orleans International Airport', 'New Orleans', 'America/Chicago');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'OAK', 'US', 37.721298, -122.221001, 'Metropolitan Oakland International Airport', 'Oakland', 'America/Los_Angeles');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'OMA', 'US', 41.3032, -95.894096, 'Eppley Airfield', 'Omaha', 'America/Chicago');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'ONT', 'US', 34.055999755859375, -117.60099792480469, 'Ontario International Airport', 'Ontario', 'America/Los_Angeles');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'ORD', 'US', 41.9786, -87.9048, 'Chicago O''Hare International Airport', 'Chicago', 'America/Chicago');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'PBI', 'US', 26.68320083618164, -80.09559631347656, 'Palm Beach International Airport', 'West Palm Beach', 'America/New_York');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'PDX', 'US', 45.58869934, -122.5979996, 'Portland International Airport', 'Portland', 'America/Los_Angeles');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'PHL', 'US', 39.87189865112305, -75.24109649658203, 'Philadelphia International Airport', 'Philadelphia', 'America/New_York');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'PHX', 'US', 33.435302, -112.005905, 'Phoenix Sky Harbor International Airport', 'Phoenix', 'America/Phoenix');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'PIT', 'US', 40.49150085, -80.23290253, 'Pittsburgh International Airport', 'Pittsburgh', 'America/New_York');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'PVD', 'US', 41.725038, -71.425668, 'Theodore Francis Green State Airport', 'Warwick', 'America/New_York');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'PWM', 'US', 43.646198, -70.309303, 'Portland International Jetport', 'Portland', 'America/New_York');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'RDU', 'US', 35.877602, -78.787498, 'Raleigh Durham International Airport', 'Raleigh/Durham', 'America/New_York');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'RIC', 'US', 37.50519943237305, -77.3197021484375, 'Richmond International Airport', 'Richmond', 'America/New_York');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'RNO', 'US', 39.49909973144531, -119.76799774169922, 'Reno Tahoe International Airport', 'Reno', 'America/Los_Angeles');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'RSW', 'US', 26.53619956970215, -81.75520324707031, 'Southwest Florida International Airport', 'Fort Myers', 'America/New_York');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SAN', 'US', 32.7336006165, -117.190002441, 'San Diego International Airport', 'San Diego', 'America/Los_Angeles');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SAT', 'US', 29.533701, -98.469803, 'San Antonio International Airport', 'San Antonio', 'America/Chicago');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SAV', 'US', 32.12760162, -81.20210266, 'Savannah Hilton Head International Airport', 'Savannah', 'America/New_York');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SDF', 'US', 38.1744, -85.736, 'Louisville Muhammad Ali International Airport', 'Louisville', 'America/Kentucky/Louisville');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SEA', 'US', 47.449162, -122.311134, 'Seattle–Tacoma International Airport', 'Seattle', 'America/Los_Angeles');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SFB', 'US', 28.777599334716797, -81.23750305175781, 'Orlando Sanford International Airport', 'Orlando', 'America/New_York');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SFO', 'US', 37.61899948120117, -122.375, 'San Francisco International Airport', 'San Francisco', 'America/Los_Angeles');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SJC', 'US', 37.362452, -121.929188, 'Norman Y. Mineta San Jose International Airport', 'San Jose', 'America/Los_Angeles');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SLC', 'US', 40.785749, -111.979746, 'Salt Lake City International Airport', 'Salt Lake City', 'America/Denver');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SMF', 'US', 38.69540023803711, -121.59100341796875, 'Sacramento International Airport', 'Sacramento', 'America/Los_Angeles');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SNA', 'US', 33.675701, -117.867996, 'John Wayne Orange County International Airport', 'Santa Ana', 'America/Los_Angeles');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'STL', 'US', 38.748697, -90.370003, 'St Louis Lambert International Airport', 'St Louis', 'America/Chicago');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SYR', 'US', 43.11119842529297, -76.1063003540039, 'Syracuse Hancock International Airport', 'Syracuse', 'America/New_York');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'TPA', 'US', 27.975500106811523, -82.533203125, 'Tampa International Airport', 'Tampa', 'America/New_York');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'TUL', 'US', 36.19839859008789, -95.88809967041016, 'Tulsa International Airport', 'Tulsa', 'America/Chicago');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'TIA', 'AL', 41.4146995544, 19.7206001282, 'Tirana International Airport Mother Teresa', 'Tirana', 'Europe/Tirane');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BOJ', 'BG', 42.56959915161133, 27.515199661254883, 'Burgas Airport', 'Burgas', 'Europe/Sofia');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SOF', 'BG', 42.696357, 23.417671, 'Sofia Airport', 'Sofia', 'Europe/Sofia');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'VAR', 'BG', 43.232101, 27.8251, 'Varna Airport', 'Varna', 'Europe/Sofia');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'LCA', 'CY', 34.875099, 33.624901, 'Larnaca International Airport', 'Larnaca', 'Asia/Nicosia');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'ZAG', 'HR', 45.7429008484, 16.0687999725, 'Zagreb Airport', 'Zagreb', 'Europe/Zagreb');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'ALC', 'ES', 38.2822, -0.558156, 'Alicante-Elche Miguel Hernández Airport', 'Alicante', 'Europe/Madrid');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BCN', 'ES', 41.2971, 2.07846, 'Josep Tarradellas Barcelona-El Prat Airport', 'Barcelona', 'Europe/Madrid');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'IBZ', 'ES', 38.872898, 1.37312, 'Ibiza Airport', 'Ibiza (Eivissa)', 'Europe/Madrid');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MAD', 'ES', 40.471926, -3.56264, 'Adolfo Suárez Madrid–Barajas Airport', 'Madrid', 'Europe/Madrid');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'AGP', 'ES', 36.6749, -4.49911, 'Málaga-Costa del Sol Airport', 'Málaga', 'Europe/Madrid');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'PMI', 'ES', 39.551701, 2.73881, 'Palma de Mallorca Airport', 'Palma de Mallorca', 'Europe/Madrid');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SCQ', 'ES', 42.896301, -8.41514, 'Santiago-Rosalía de Castro Airport', 'Santiago de Compostela', 'Europe/Madrid');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BOD', 'FR', 44.8283, -0.715556, 'Bordeaux-Mérignac Airport', 'Bordeaux/Mérignac', 'Europe/Paris');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'TLS', 'FR', 43.629101, 1.36382, 'Toulouse-Blagnac Airport', 'Toulouse/Blagnac', 'Europe/Paris');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'LYS', 'FR', 45.725556, 5.081111, 'Lyon Saint-Exupéry Airport', 'Lyon', 'Europe/Paris');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MRS', 'FR', 43.439271922, 5.22142410278, 'Marseille Provence Airport', 'Marseille', 'Europe/Paris');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'NCE', 'FR', 43.658401, 7.21587, 'Nice-Côte d''Azur Airport', 'Nice', 'Europe/Paris');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'CDG', 'FR', 49.012798, 2.55, 'Charles de Gaulle International Airport', 'Paris', 'Europe/Paris');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'ORY', 'FR', 48.72333, 2.37944, 'Paris-Orly Airport', 'Paris', 'Europe/Paris');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BSL', 'FR', 47.60068, 7.521117, 'EuroAirport Basel-Mulhouse-Freiburg', 'Saint-Louis', 'Europe/Paris');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'ATH', 'GR', 37.936401, 23.9445, 'Athens Eleftherios Venizelos International Airport', 'Athens', 'Europe/Athens');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'HER', 'GR', 35.3396987915, 25.180299758900002, 'Heraklion International Nikos Kazantzakis Airport', 'Heraklion', 'Europe/Athens');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SKG', 'GR', 40.51969909667969, 22.97089958190918, 'Thessaloniki Macedonia International Airport', 'Thessaloniki', 'Europe/Athens');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BUD', 'HU', 47.43018, 19.262393, 'Budapest Liszt Ferenc International Airport', 'Budapest', 'Europe/Budapest');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BRI', 'IT', 41.138901, 16.760599, 'Bari Karol Wojtyła Airport', 'Bari', 'Europe/Rome');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BDS', 'IT', 40.6576, 17.947001, 'Brindisi Airport', 'Brindisi', 'Europe/Rome');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'CTA', 'IT', 37.466801, 15.0664, 'Catania-Fontanarossa Airport', 'Catania', 'Europe/Rome');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'PMO', 'IT', 38.175999, 13.091, 'Falcone–Borsellino Airport', 'Palermo', 'Europe/Rome');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'CAG', 'IT', 39.251499, 9.05428, 'Cagliari Elmas Airport', 'Cagliari', 'Europe/Rome');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MXP', 'IT', 45.6306, 8.72811, 'Malpensa International Airport', 'Milan', 'Europe/Rome');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BGY', 'IT', 45.673901, 9.70417, 'Milan Bergamo Airport', 'Milan', 'Europe/Rome');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'TRN', 'IT', 45.200802, 7.64963, 'Turin Airport', 'Torino', 'Europe/Rome');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BLQ', 'IT', 44.5354, 11.2887, 'Bologna Guglielmo Marconi Airport', 'Bologna', 'Europe/Rome');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'VRN', 'IT', 45.394955, 10.887303, 'Verona-Villafranca Valerio Catullo Airport', 'Villafranca di Verona', 'Europe/Rome');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'VCE', 'IT', 45.505299, 12.3519, 'Venice Marco Polo Airport', 'Venice', 'Europe/Rome');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'FCO', 'IT', 41.804532, 12.251998, 'Rome–Fiumicino Leonardo da Vinci International Airport', 'Rome', 'Europe/Rome');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'NAP', 'IT', 40.886002, 14.2908, 'Naples International Airport', 'Napoli', 'Europe/Rome');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'PSA', 'IT', 43.683899, 10.3927, 'Pisa International Airport', 'Pisa', 'Europe/Rome');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'LJU', 'SI', 46.223701, 14.4576, 'Ljubljana Jože Pučnik Airport', 'Ljubljana', 'Europe/Ljubljana');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'PRG', 'CZ', 50.103514, 14.256992, 'Václav Havel Airport Prague', 'Prague', 'Europe/Prague');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'TLV', 'IL', 32.01139831542969, 34.88669967651367, 'Ben Gurion International Airport', 'Tel Aviv', 'Asia/Jerusalem');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'ETM', 'IL', 29.727009, 35.014116, 'Ramon International Airport', 'Eilat', 'Asia/Jerusalem');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MLA', 'MT', 35.857498, 14.4775, 'Malta International Airport', 'Valletta', 'Europe/Malta');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'VIE', 'AT', 48.110298, 16.5697, 'Vienna International Airport', 'Vienna', 'Europe/Vienna');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'FAO', 'PT', 37.0144004822, -7.96590995789, 'Faro Airport', 'Faro', 'Europe/Lisbon');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'FNC', 'PT', 32.697899, -16.7745, 'Madeira International Airport Cristiano Ronaldo', 'Funchal', 'Atlantic/Madeira');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'PDL', 'PT', 37.7411994934, -25.6979007721, 'João Paulo II Airport', 'Ponta Delgada', 'Atlantic/Azores');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'OPO', 'PT', 41.2481002808, -8.68138980865, 'Francisco de Sá Carneiro Airport', 'Porto', 'Europe/Lisbon');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'LIS', 'PT', 38.7813, -9.13592, 'Humberto Delgado Airport (Lisbon Portela Airport)', 'Lisbon', 'Europe/Lisbon');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'OTP', 'RO', 44.571111, 26.085, 'Henri Coandă International Airport', 'Bucharest', 'Europe/Bucharest');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'GVA', 'CH', 46.23809814453125, 6.108950138092041, 'Geneva Cointrin International Airport', 'Geneva', 'Europe/Zurich');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'ZRH', 'CH', 47.458056, 8.548056, 'Zürich Airport', 'Zurich', 'Europe/Zurich');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'ESB', 'TR', 40.128101348899996, 32.995098114, 'Esenboğa International Airport', 'Ankara', 'Europe/Istanbul');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'AYT', 'TR', 36.898701, 30.800501, 'Antalya International Airport', 'Antalya', 'Europe/Istanbul');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'ISL', 'TR', 40.971913, 28.823714, 'İstanbul Atatürk Airport', 'Bakırköy, Istanbul', 'Europe/Istanbul');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'ADB', 'TR', 38.2924, 27.157, 'Adnan Menderes International Airport', 'İzmir', 'Europe/Istanbul');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'DLM', 'TR', 36.7131004333, 28.7924995422, 'Dalaman International Airport', 'Dalaman', 'Europe/Istanbul');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BJV', 'TR', 37.25059890749999, 27.6643009186, 'Milas Bodrum International Airport', 'Bodrum', 'Europe/Istanbul');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SAW', 'TR', 40.898602, 29.3092, 'Istanbul Sabiha Gökçen International Airport', 'Pendik, Istanbul', 'Europe/Istanbul');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'IST', 'TR', 41.261297, 28.741951, 'İstanbul Airport', 'Arnavutköy, Istanbul', 'Europe/Istanbul');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SKP', 'MK', 41.958087, 21.622581, 'Skopje International Airport', 'Ilinden', 'Europe/Skopje');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BEG', 'RS', 44.818401, 20.309099, 'Belgrade Nikola Tesla Airport', 'Belgrade', 'Europe/Belgrade');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'TGD', 'ME', 42.359402, 19.2519, 'Podgorica Airport / Podgorica Golubovci Airbase', 'Podgorica', 'Europe/Podgorica');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BTS', 'SK', 48.1702, 17.2127, 'M. R. Štefánik Airport', 'Bratislava', 'Europe/Bratislava');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'PLS', 'TC', 21.773697, -72.268321, 'Providenciales International Airport', 'Providenciales', 'America/Grand_Turk');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'PUJ', 'DO', 18.567399978599997, -68.36340332030001, 'Punta Cana International Airport', 'Punta Cana', 'America/Santo_Domingo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SDQ', 'DO', 18.42970085144, -69.668899536133, 'Las Américas International Airport', 'Santo Domingo', 'America/Santo_Domingo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'GUA', 'GT', 14.5833, -90.527496, 'La Aurora Airport', 'Guatemala City', 'America/Guatemala');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'KIN', 'JM', 17.935699462890625, -76.7874984741211, 'Norman Manley International Airport', 'Kingston', 'America/Jamaica');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'ACA', 'MX', 16.762118, -99.755473, 'Aeropuerto Internacional Juan N. Álvarez', 'Ciudad de Acapulco', 'America/Mexico_City');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'CZM', 'MX', 20.511425, -86.930287, 'Aeropuerto Internacional de Cozumel', 'Ciudad de Cozumel', 'America/Cancun');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'DGO', 'MX', 24.125908, -104.533904, 'Aeropuerto Internacional Gral, Guadalupe Victoria', 'Ciudad de Durango', 'America/Monterrey');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'GDL', 'MX', 20.52504, -103.301557, 'Aeropuerto Internacional Miguel Hidalgo', 'Ciudad de Tlajomulco de Zúñiga', 'America/Mexico_City');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'HMO', 'MX', 29.095899581900003, -111.047996521, 'General Ignacio P. Garcia International Airport', 'Hermosillo', 'America/Hermosillo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BJX', 'MX', 20.985813, -101.478825, 'Aeropuerto Internacional Del Bajío', 'Ciudad de Silao', 'America/Mexico_City');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MID', 'MX', 20.933384, -89.662621, 'Aeropuerto Internacional Manuel Crescencio Rejón', 'Ciudad de Mérida', 'America/Merida');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MEX', 'MX', 19.435433, -99.082432, 'Aeropuerto Internacional Lic. Benito Juárez', 'Ciudad de México', 'America/Mexico_City');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MTY', 'MX', 25.778561, -100.113602, 'Aeropuerto Internacional Gral. Mariano Escobedo', 'Ciudad de Apodaca', 'America/Monterrey');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MZT', 'MX', 23.166689, -106.270151, 'Aeropuerto Internacional Gral. Rafael Buelna', 'Ciudad de Mazatlàn', 'America/Mazatlan');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'PVR', 'MX', 20.679746, -105.246685, 'Aeropuerto Internacional Lic. Gustavo Díaz Ordaz', 'Ciudad de Puerto Vallarta', 'America/Mexico_City');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SJD', 'MX', 23.15642, -109.716811, 'Aeropuerto Internacional de Los Cabos', 'Ciudad de San José del Cabo', 'America/Mazatlan');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'NLU', 'MX', 19.7357, -99.0257, 'Aeropuerto Internacional General Felipe Ángeles', 'Mexico City', 'America/Mexico_City');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'TIJ', 'MX', 32.545963, -116.975856, 'Aeropuerto Internacional Gral. Abelardo Rodriguez', 'Ciudad de Tijuana', 'America/Tijuana');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'TLC', 'MX', 19.338196, -99.570358, 'Aeropuerto Internacional Adolfo López Mateos', 'Ciudad de Toluca', 'America/Mexico_City');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'CUN', 'MX', 21.039444, -86.874304, 'Aeropuerto Internacional de Cancún', 'Ciudad de Cancún', 'America/Cancun');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'PTY', 'PA', 9.0713596344, -79.3834991455, 'Tocumen International Airport', 'Tocumen', 'America/Panama');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'LIR', 'CR', 10.5933, -85.544403, 'Guanacaste Airport', 'Liberia', 'America/Costa_Rica');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SAL', 'SV', 13.4409, -89.055702, 'Monseñor Óscar Arnulfo Romero International Airport', 'San Salvador (San Luis Talpa)', 'America/El_Salvador');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'PAP', 'HT', 18.58, -72.292503, 'Toussaint Louverture International Airport', 'Port-au-Prince', 'America/Port-au-Prince');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'HAV', 'CU', 22.989200592041016, -82.40910339355469, 'José Martí International Airport', 'Havana', 'America/Havana');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'VRA', 'CU', 23.034401, -81.435303, 'Juan Gualberto Gomez International Airport', 'Matanzas', 'America/Havana');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'GCM', 'KY', 19.292801, -81.357697, 'Owen Roberts International Airport', 'George Town', 'America/Cayman');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'NAS', 'BS', 25.039, -77.466202, 'Lynden Pindling International Airport', 'Nassau', 'America/Nassau');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BZE', 'BZ', 17.539951, -88.303556, 'Philip S. W. Goldson International Airport', 'Belize City', 'America/Belize');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'PPT', 'PF', -17.553699, -149.606995, 'Faa''a International Airport', 'Papeete', 'Pacific/Tahiti');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'VLI', 'VU', -17.699301, 168.320007, 'Bauerfield International Airport', 'Port Vila', 'Pacific/Efate');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'GEA', 'NC', -22.258301, 166.473007, 'Nouméa Magenta Airport', 'Nouméa', 'Pacific/Noumea');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'AKL', 'NZ', -37.01199, 174.786331, 'Auckland International Airport', 'Auckland', 'Pacific/Auckland');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'CHC', 'NZ', -43.48939895629883, 172.53199768066406, 'Christchurch International Airport', 'Christchurch', 'Pacific/Auckland');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'WLG', 'NZ', -41.3272018433, 174.804992676, 'Wellington International Airport', 'Wellington', 'Pacific/Auckland');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BAH', 'BH', 26.267295, 50.63764, 'Bahrain International Airport', 'Manama', 'Asia/Bahrain');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'DMM', 'SA', 26.471200942993164, 49.79790115356445, 'King Fahd International Airport', 'Ad Dammam', 'Asia/Riyadh');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'JED', 'SA', 21.6796, 39.156502, 'King Abdulaziz International Airport', 'Jeddah', 'Asia/Riyadh');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MED', 'SA', 24.5534, 39.705101, 'Prince Mohammad Bin Abdulaziz Airport', 'Medina', 'Asia/Riyadh');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'RUH', 'SA', 24.957599639892578, 46.69879913330078, 'King Khaled International Airport', 'Riyadh', 'Asia/Riyadh');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'IKA', 'IR', 35.416099548339844, 51.152198791503906, 'Imam Khomeini International Airport', 'Tehran', 'Asia/Tehran');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'THR', 'IR', 35.68920135498047, 51.31340026855469, 'Mehrabad International Airport', 'Tehran', 'Asia/Tehran');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MHD', 'IR', 36.235198974609375, 59.64099884033203, 'Mashhad International Airport', 'Mashhad', 'Asia/Tehran');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SYZ', 'IR', 29.5392, 52.589802, 'Shiraz Shahid Dastghaib International Airport', 'Shiraz', 'Asia/Tehran');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'AMM', 'JO', 31.7226009369, 35.9931983948, 'Queen Alia International Airport', 'Amman', 'Asia/Amman');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'KWI', 'KW', 29.226601, 47.968899, 'Kuwait International Airport', 'Kuwait City', 'Asia/Kuwait');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BEY', 'LB', 33.820899963378906, 35.488399505615234, 'Beirut Rafic Hariri International Airport', 'Beirut', 'Asia/Beirut');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'DQM', 'OM', 19.501944, 57.634167, 'Duqm International Airport', 'Duqm', 'Asia/Muscat');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'AUH', 'AE', 24.443764, 54.651718, 'Abu Dhabi International Airport', 'Abu Dhabi', 'Asia/Dubai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'DXB', 'AE', 25.2527999878, 55.3643989563, 'Dubai International Airport', 'Dubai', 'Asia/Dubai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'DWC', 'AE', 24.896356, 55.161389, 'Al Maktoum International Airport', 'Jebel Ali', 'Asia/Dubai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SHJ', 'AE', 25.32859992980957, 55.5172004699707, 'Sharjah International Airport', 'Sharjah', 'Asia/Dubai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MCT', 'OM', 23.593299865722656, 58.284400939941406, 'Muscat International Airport', 'Muscat', 'Asia/Muscat');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'ISB', 'PK', 33.549, 72.82566, 'Islamabad International Airport', 'Attock', 'Asia/Karachi');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'KHI', 'PK', 24.9065, 67.160797, 'Jinnah International Airport', 'Karachi', 'Asia/Karachi');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'LHE', 'PK', 31.521601, 74.403603, 'Allama Iqbal International Airport', 'Lahore', 'Asia/Karachi');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BGW', 'IQ', 33.262501, 44.2346, 'Baghdad International Airport / New Al Muthana Air Base', 'Baghdad', 'Asia/Baghdad');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'DAM', 'SY', 33.4114990234375, 36.51559829711914, 'Damascus International Airport', 'Damascus', 'Asia/Damascus');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'DOH', 'QA', 25.273056, 51.608056, 'Hamad International Airport', 'Doha', 'Asia/Qatar');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'FAI', 'US', 64.81510162, -147.8560028, 'Fairbanks International Airport', 'Fairbanks', 'America/Anchorage');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'ANC', 'US', 61.1744, -149.996002, 'Ted Stevens Anchorage International Airport', 'Anchorage', 'America/Anchorage');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'GUM', 'GU', 13.4834, 144.796005, 'Antonio B. Won Pat International Airport', 'Hagåtña', 'Pacific/Guam');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'HNL', 'US', 21.32062, -157.924228, 'Daniel K Inouye International Airport', 'Honolulu', 'Pacific/Honolulu');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'KHH', 'TW', 22.577101, 120.349998, 'Kaohsiung International Airport', 'Kaohsiung (Xiaogang)', 'Asia/Taipei');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'TPE', 'TW', 25.0777, 121.233002, 'Taiwan Taoyuan International Airport', 'Taoyuan (Dayuan)', 'Asia/Taipei');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'NRT', 'JP', 35.764702, 140.386002, 'Narita International Airport', 'Narita', 'Asia/Tokyo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'KIX', 'JP', 34.427299, 135.244003, 'Kansai International Airport', 'Osaka', 'Asia/Tokyo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'CTS', 'JP', 42.7752, 141.692001, 'New Chitose Airport', 'Sapporo', 'Asia/Tokyo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'FUK', 'JP', 33.585899353027344, 130.4510040283203, 'Fukuoka Airport', 'Fukuoka', 'Asia/Tokyo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'KOJ', 'JP', 31.80340003967285, 130.718994140625, 'Kagoshima Airport', 'Kagoshima', 'Asia/Tokyo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'NGO', 'JP', 34.8583984375, 136.80499267578125, 'Chubu Centrair International Airport', 'Tokoname', 'Asia/Tokyo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'ITM', 'JP', 34.785499572753906, 135.43800354003906, 'Osaka International Airport', 'Osaka', 'Asia/Tokyo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SDJ', 'JP', 38.139702, 140.917007, 'Sendai Airport', 'Natori', 'Asia/Tokyo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'HND', 'JP', 35.552299, 139.779999, 'Tokyo Haneda International Airport', 'Tokyo', 'Asia/Tokyo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MWX', 'KR', 34.991406, 126.382814, 'Muan International Airport', 'Piseo-ri (Muan)', 'Asia/Seoul');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'CJU', 'KR', 33.512058, 126.492548, 'Jeju International Airport', 'Jeju City', 'Asia/Seoul');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'PUS', 'KR', 35.179501, 128.938004, 'Gimhae International Airport', 'Busan', 'Asia/Seoul');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'ICN', 'KR', 37.46910095214844, 126.45099639892578, 'Incheon International Airport', 'Seoul', 'Asia/Seoul');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'GMP', 'KR', 37.5583, 126.791, 'Gimpo International Airport', 'Seoul', 'Asia/Seoul');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'OKA', 'JP', 26.195801, 127.646004, 'Naha Airport / JASDF Naha Air Base', 'Naha', 'Asia/Tokyo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MNL', 'PH', 14.5086, 121.019997, 'Ninoy Aquino International Airport', 'Manila', 'Asia/Manila');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'DVO', 'PH', 7.12552, 125.646004, 'Francisco Bangoy International Airport', 'Davao', 'Asia/Manila');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'CEB', 'PH', 10.309261, 123.97974, 'Mactan Cebu International Airport', 'Lapu-Lapu City', 'Asia/Manila');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'AEP', 'AR', -34.5592, -58.4156, 'Jorge Newbery Airpark', 'Buenos Aires', 'America/Argentina/Buenos_Aires');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'EZE', 'AR', -34.8222, -58.5358, 'Minister Pistarini International Airport', 'Buenos Aires (Ezeiza)', 'America/Argentina/Buenos_Aires');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BEL', 'BR', -1.379279, -48.476207, 'Val de Cans/Júlio Cezar Ribeiro International Airport', 'Belém', 'America/Belem');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BSB', 'BR', -15.869167, -47.920834, 'Presidente Juscelino Kubitschek International Airport', 'Brasília', 'America/Sao_Paulo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'CNF', 'BR', -19.63571, -43.966928, 'Tancredo Neves International Airport', 'Belo Horizonte', 'America/Sao_Paulo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MAO', 'BR', -3.03861, -60.049702, 'Eduardo Gomes International Airport', 'Manaus', 'America/Manaus');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'FLN', 'BR', -27.670279, -48.552502, 'Hercílio Luz International Airport', 'Florianópolis', 'America/Sao_Paulo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'GIG', 'BR', -22.809999, -43.250557, 'Rio Galeão – Tom Jobim International Airport', 'Rio De Janeiro', 'America/Sao_Paulo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'GRU', 'BR', -23.431944, -46.467778, 'Guarulhos - Governador André Franco Montoro International Airport', 'São Paulo', 'America/Sao_Paulo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BPS', 'BR', -16.438426, -39.080584, 'Porto Seguro Airport', 'Porto Seguro', 'America/Bahia');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SSA', 'BR', -12.908611, -38.322498, 'Deputado Luiz Eduardo Magalhães International Airport', 'Salvador', 'America/Bahia');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'VIX', 'BR', -20.258, -40.285, 'Eurico de Aguiar Salles Airport', 'Vitória', 'America/Sao_Paulo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SCL', 'CL', -33.393001556396484, -70.78579711914062, 'Comodoro Arturo Merino Benítez International Airport', 'Santiago', 'America/Santiago');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'GYE', 'EC', -2.15742, -79.883598, 'José Joaquín de Olmedo International Airport', 'Guayaquil', 'America/Guayaquil');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'UIO', 'EC', -0.125399, -78.354306, 'Mariscal Sucre International Airport', 'Quito', 'America/Guayaquil');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'ASU', 'PY', -25.241736, -57.514104, 'Aeropuerto Internacional Silvio Pettirossi', 'Asunción', 'America/Asuncion');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'AGT', 'PY', -25.457186, -54.839544, 'Aeropuerto Internacional Guaraní', 'Ciudad del Este', 'America/Asuncion');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BOG', 'CO', 4.70159, -74.1469, 'El Dorado International Airport', 'Bogota', 'America/Bogota');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'VVI', 'BO', -17.6448, -63.135399, 'Viru Viru International Airport', 'Santa Cruz', 'America/La_Paz');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'PBM', 'SR', 5.45283, -55.187801, 'Johan Adolf Pengel International Airport', 'Zandery', 'America/Paramaribo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'CAY', 'GF', 4.819964, -52.361326, 'Cayenne – Félix Eboué Airport', 'Matoury', 'America/Cayenne');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'LIM', 'PE', -12.0219, -77.114305, 'Jorge Chávez International Airport', 'Lima', 'America/Lima');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'CUZ', 'PE', -13.535699844400002, -71.9387969971, 'Alejandro Velasco Astete International Airport', 'Cusco', 'America/Lima');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MVD', 'UY', -34.835647, -56.026497, 'Carrasco General Cesáreo L. Berisso International Airport', 'Ciudad de la Costa', 'America/Montevideo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BLA', 'VE', 10.111111, -64.692222, 'General José Antonio Anzoategui International Airport', 'Barcelona', 'America/Caracas');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'CCS', 'VE', 10.601194, -66.991222, 'Simón Bolívar International Airport', 'Caracas', 'America/Caracas');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'TAO', 'CN', 36.361953, 120.088171, 'Qingdao Jiaodong International Airport', 'Jiaozhou, Qingdao', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'FDF', 'MQ', 14.591, -61.003201, 'Martinique Aimé Césaire International Airport', 'Fort-de-France', 'America/Martinique');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'PTP', 'GP', 16.265301, -61.531799, 'Pointe-à-Pitre Le Raizet International  Airport', 'Pointe-à-Pitre', 'America/Guadeloupe');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SJU', 'PR', 18.4393997192, -66.0018005371, 'Luis Munoz Marin International Airport', 'San Juan', 'America/Puerto_Rico');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'UVF', 'LC', 13.7332, -60.952599, 'Hewanorra International Airport', 'Vieux Fort', 'America/St_Lucia');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'AUA', 'AW', 12.5014, -70.015198, 'Queen Beatrix International Airport', 'Oranjestad', 'America/Aruba');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BON', 'BQ', 12.131, -68.268501, 'Flamingo International Airport', 'Kralendijk, Bonaire', 'America/Kralendijk');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'CUR', 'CW', 12.1889, -68.959801, 'Hato International Airport', 'Willemstad', 'America/Curacao');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SXM', 'SX', 18.041, -63.108898, 'Princess Juliana International Airport', 'Saint Martin', 'America/Lower_Princes');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'ALA', 'KZ', 43.354267, 77.042828, 'Almaty International Airport', 'Almaty', 'Asia/Almaty');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'NQZ', 'KZ', 51.022202, 71.466904, 'Nursultan Nazarbayev International Airport', 'Nur-Sultan', 'Europe/London');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'FRU', 'KG', 43.0612983704, 74.4776000977, 'Manas International Airport', 'Bishkek', 'Asia/Bishkek');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'HSA', 'KZ', 43.313126, 68.549881, 'Hazrat Sultan International Airport', '', 'America/Sao_Paulo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'GYD', 'AZ', 40.467498779296875, 50.04669952392578, 'Heydar Aliyev International Airport', 'Baku', 'Asia/Baku');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'EVN', 'AM', 40.1473007202, 44.3959007263, 'Zvartnots International Airport', 'Yerevan', 'Asia/Yerevan');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'TBS', 'GE', 41.6692008972, 44.95470047, 'Tbilisi International Airport', 'Tbilisi', 'Asia/Tbilisi');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'VVO', 'RU', 43.396256, 132.148155, 'Vladivostok International Airport', 'Artyom', 'Asia/Vladivostok');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'KBP', 'UA', 50.345001, 30.894699, 'Boryspil International Airport', 'Boryspil', 'Europe/Kiev');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'LWO', 'UA', 49.8125, 23.9561, 'Lviv International Airport', 'Lviv', 'Europe/Uzhgorod');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'LED', 'RU', 59.80030059814453, 30.262500762939453, 'Pulkovo Airport', 'St. Petersburg', 'Europe/Moscow');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MSQ', 'BY', 53.888071, 28.039964, 'Minsk National Airport', 'Minsk', 'Europe/Minsk');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'KJA', 'RU', 56.173077, 92.492437, 'Krasnoyarsk International Airport', 'Krasnoyarsk', 'Asia/Krasnoyarsk');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'OVB', 'RU', 55.019756, 82.618675, 'Novosibirsk Tolmachevo Airport', 'Novosibirsk', 'Asia/Novosibirsk');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'ROV', 'RU', 47.493888, 39.924722, 'Platov International Airport', 'Rostov-on-Don', 'Europe/Moscow');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'AER', 'RU', 43.449902, 39.9566, 'Sochi International Airport', 'Sochi', 'Europe/Moscow');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SVX', 'RU', 56.743099212646, 60.802700042725, 'Koltsovo Airport', 'Yekaterinburg', 'Asia/Yekaterinburg');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'ASB', 'TM', 37.986801, 58.361, 'Ashgabat International Airport', 'Ashgabat', 'Asia/Ashgabat');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'TAS', 'UZ', 41.257900238, 69.2811965942, 'Tashkent International Airport', 'Tashkent', 'Asia/Tashkent');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'ZIA', 'RU', 55.553299, 38.150002, 'Zhukovsky International Airport', 'Moscow', 'Europe/Moscow');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'DME', 'RU', 55.40879821777344, 37.90629959106445, 'Domodedovo International Airport', 'Moscow', 'Europe/Moscow');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SVO', 'RU', 55.972599, 37.4146, 'Sheremetyevo International Airport', 'Moscow', 'Europe/Moscow');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'VKO', 'RU', 55.5914993286, 37.2615013123, 'Vnukovo International Airport', 'Moscow', 'Europe/Moscow');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'KZN', 'RU', 55.606201171875, 49.278701782227, 'Kazan International Airport', 'Kazan', 'Europe/Moscow');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'GSV', 'RU', 51.712778, 46.171111, 'Gagarin International Airport', 'Saratov', 'Africa/Khartoum');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'UFA', 'RU', 54.557498931885, 55.874401092529, 'Ufa International Airport', 'Ufa', 'Asia/Yekaterinburg');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'KUF', 'RU', 53.504901885986, 50.16429901123, 'Kurumoch International Airport', 'Samara', 'Europe/Samara');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BOM', 'IN', 19.0886993408, 72.8678970337, 'Chhatrapati Shivaji International Airport', 'Mumbai', 'Asia/Kolkata');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'GOI', 'IN', 15.3808, 73.831398, 'Dabolim Airport', 'Vasco da Gama', 'Asia/Kolkata');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'CMB', 'LK', 7.180759906768799, 79.88410186767578, 'Bandaranaike International Colombo Airport', 'Colombo', 'Asia/Colombo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'HRI', 'LK', 6.284467, 81.124128, 'Mattala Rajapaksa International Airport', '', 'Asia/Colombo');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'PNH', 'KH', 11.5466, 104.844002, 'Phnom Penh International Airport', 'Phnom Penh (Pou Senchey)', 'Asia/Phnom_Penh');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SAI', 'KH', 13.369167, 104.223056, 'Siem Reap-Angkor International Airport', 'Siem Reap', 'Asia/Aden');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'REP', 'KH', 13.41155, 103.813044, 'Siem Reap International Airport', 'Siem Reap', 'Asia/Phnom_Penh');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'CCU', 'IN', 22.654699325561523, 88.44670104980469, 'Netaji Subhash Chandra Bose International Airport', 'Kolkata', 'Asia/Kolkata');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'DAC', 'BD', 23.843347, 90.397783, 'Hazrat Shahjalal International Airport', 'Dhaka', 'Asia/Dhaka');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'HKG', 'HK', 22.308901, 113.915001, 'Hong Kong International Airport', 'Islands', 'Asia/Hong_Kong');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'DEL', 'IN', 28.55563, 77.09519, 'Indira Gandhi International Airport', 'New Delhi', 'Asia/Kolkata');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MFM', 'MO', 22.149599, 113.592003, 'Macau International Airport', 'Nossa Senhora do Carmo', 'Asia/Macau');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'KTM', 'NP', 27.6966, 85.3591, 'Tribhuvan International Airport', 'Kathmandu', 'Asia/Kathmandu');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BLR', 'IN', 13.1979, 77.706299, 'Kempegowda International Airport', 'Bangalore', 'Asia/Kolkata');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'COK', 'IN', 10.152, 76.401901, 'Cochin International Airport', 'Kochi', 'Asia/Kolkata');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'HYD', 'IN', 17.231318, 78.429855, 'Rajiv Gandhi International Airport', 'Hyderabad', 'Asia/Kolkata');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MAA', 'IN', 12.990005, 80.169296, 'Chennai International Airport', 'Chennai', 'Asia/Kolkata');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'TRV', 'IN', 8.48212, 76.920097, 'Thiruvananthapuram International Airport', 'Thiruvananthapuram', 'Asia/Kolkata');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MLE', 'MV', 4.191830158233643, 73.52909851074219, 'Malé International Airport', 'Malé', 'Indian/Maldives');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'DMK', 'TH', 13.9125995636, 100.607002258, 'Don Mueang International Airport', 'Bangkok', 'Asia/Bangkok');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BKK', 'TH', 13.681099891662598, 100.74700164794922, 'Suvarnabhumi Airport', 'Bangkok', 'Asia/Bangkok');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'CNX', 'TH', 18.766799926799997, 98.962600708, 'Chiang Mai International Airport', 'Chiang Mai', 'Asia/Bangkok');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'HKT', 'TH', 8.1132, 98.316902, 'Phuket International Airport', 'Phuket', 'Asia/Bangkok');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'HAN', 'VN', 21.221201, 105.806999, 'Noi Bai International Airport', 'Hanoi (Soc Son)', 'Asia/Ho_Chi_Minh');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SGN', 'VN', 10.8188, 106.652, 'Tan Son Nhat International Airport', 'Ho Chi Minh City', 'Asia/Ho_Chi_Minh');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MDL', 'MM', 21.702199935913086, 95.97789764404297, 'Mandalay International Airport', 'Mandalay', 'Asia/Yangon');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'RGN', 'MM', 16.907300949099998, 96.1332015991, 'Yangon International Airport', 'Yangon', 'Asia/Yangon');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'UPG', 'ID', -5.06163, 119.554001, 'Hasanuddin International Airport', 'Ujung Pandang', 'Asia/Makassar');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'DPS', 'ID', -8.74817, 115.167, 'Ngurah Rai (Bali) International Airport', 'Denpasar', 'Asia/Makassar');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'DJJ', 'ID', -2.579627, 140.519857, 'Dortheys Hiyo Eluay International Airport', 'Sentani', 'Asia/Jayapura');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BPN', 'ID', -1.268342, 116.89452, 'Sultan Aji Muhammad Sulaiman Sepinggan International Airport', 'Balikpapan', 'Asia/Makassar');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SUB', 'ID', -7.37983, 112.787003, 'Juanda International Airport', 'Surabaya', 'Asia/Jakarta');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BWN', 'BN', 4.9442, 114.928001, 'Brunei International Airport', 'Bandar Seri Begawan', 'Asia/Brunei');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'CGK', 'ID', -6.1255698204, 106.65599823, 'Soekarno-Hatta International Airport', 'Jakarta', 'Asia/Jakarta');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'KNO', 'ID', 3.637847, 98.870566, 'Kualanamu International Airport', 'Medan', 'Asia/Jakarta');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'KUL', 'MY', 2.74558, 101.709999, 'Kuala Lumpur International Airport', 'Sepang', 'Asia/Kuala_Lumpur');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SIN', 'SG', 1.35019, 103.994003, 'Singapore Changi Airport', 'Singapore', 'Asia/Singapore');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'BNE', 'AU', -27.384199142456055, 153.11700439453125, 'Brisbane International Airport', 'Brisbane', 'Australia/Brisbane');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'MEL', 'AU', -37.673302, 144.843002, 'Melbourne International Airport', 'Melbourne', 'Australia/Melbourne');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'YNT', 'CN', 37.659724, 120.978124, 'Yantai Penglai International Airport', 'Yantai', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'ADL', 'AU', -34.947512, 138.533393, 'Adelaide International Airport', 'Adelaide', 'Australia/Adelaide');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'DRW', 'AU', -12.41497, 130.88185, 'Darwin International Airport / RAAF Darwin', 'Darwin', 'Australia/Darwin');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'PER', 'AU', -31.94029998779297, 115.96700286865234, 'Perth International Airport', 'Perth', 'Australia/Perth');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SYD', 'AU', -33.94609832763672, 151.177001953125, 'Sydney Kingsford Smith International Airport', 'Sydney', 'Australia/Sydney');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'PEK', 'CN', 40.080101013183594, 116.58499908447266, 'Beijing Capital International Airport', 'Beijing', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'PKX', 'CN', 39.509945, 116.41092, 'Beijing Daxing International Airport', 'Beijing', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'HET', 'CN', 40.849658, 111.824598, 'Hohhot Baita International Airport', 'Hohhot', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'TSN', 'CN', 39.124401092499994, 117.346000671, 'Tianjin Binhai International Airport', 'Tianjin', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'TYN', 'CN', 37.746899, 112.627998, 'Taiyuan Wusu Airport', 'Taiyuan', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'CAN', 'CN', 23.392401, 113.299004, 'Guangzhou Baiyun International Airport', 'Guangzhou (Huadu)', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'CSX', 'CN', 28.189199, 113.220001, 'Changsha Huanghua International Airport', 'Changsha (Changsha)', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'KWL', 'CN', 25.219828, 110.039553, 'Guilin Liangjiang International Airport', 'Guilin (Lingui)', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'NNG', 'CN', 22.608299, 108.171997, 'Nanning Wuxu Airport', 'Nanning (Jiangnan)', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SZX', 'CN', 22.639299, 113.810997, 'Shenzhen Bao''an International Airport', 'Shenzhen (Bao''an)', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'CGO', 'CN', 34.526497, 113.849165, 'Zhengzhou Xinzheng International Airport', 'Zhengzhou', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'WUH', 'CN', 30.774798, 114.213723, 'Wuhan Tianhe International Airport', 'Wuhan (Huangpi)', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'HAK', 'CN', 19.9349, 110.459, 'Haikou Meilan International Airport', 'Haikou (Meilan)', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SYX', 'CN', 18.3029, 109.412003, 'Sanya Phoenix International Airport', 'Sanya (Tianya)', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'LHW', 'CN', 36.515202, 103.620003, 'Lanzhou Zhongchuan International Airport', 'Lanzhou (Yongdeng)', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'XIY', 'CN', 34.447102, 108.751999, 'Xi''an Xianyang International Airport', 'Xianyang (Weicheng)', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'UBN', 'MN', 47.646916, 106.819833, 'Ulaanbaatar Chinggis Khaan International Airport', 'Ulaanbaatar (Sergelen)', 'Asia/Ulaanbaatar');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'KMG', 'CN', 25.110313, 102.936743, 'Kunming Changshui International Airport', 'Kunming', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'XMN', 'CN', 24.54400062561035, 118.12799835205078, 'Xiamen Gaoqi International Airport', 'Xiamen', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'KHN', 'CN', 28.864815, 115.90271, 'Nanchang Changbei International Airport', 'Nanchang', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'FOC', 'CN', 25.934669, 119.66318, 'Fuzhou Changle International Airport', 'Fuzhou', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'HGH', 'CN', 30.23609, 120.428865, 'Hangzhou Xiaoshan International Airport', 'Hangzhou', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'TNA', 'CN', 36.857201, 117.216003, 'Jinan Yaoqiang International Airport', 'Jinan', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'NGB', 'CN', 29.82670021057129, 121.46199798583984, 'Ningbo Lishe International Airport', 'Ningbo', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'NKG', 'CN', 31.735032, 118.865949, 'Nanjing Lukou International Airport', 'Nanjing', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'PVG', 'CN', 31.1434, 121.805, 'Shanghai Pudong International Airport', 'Shanghai (Pudong)', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SHA', 'CN', 31.198104, 121.33426, 'Shanghai Hongqiao International Airport', 'Shanghai (Minhang)', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'WNZ', 'CN', 27.912201, 120.851997, 'Wenzhou Longwan International Airport', 'Wenzhou', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'CKG', 'CN', 29.712254, 106.651895, 'Chongqing Jiangbei International Airport', 'Chongqing', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'KWE', 'CN', 26.541466, 106.803331, 'Guiyang Longdongbao International Airport', 'Guiyang (Nanming)', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'TFU', 'CN', 30.31252, 104.441284, 'Chengdu Tianfu International Airport', 'Chengdu (Jianyang)', 'Asia/Karachi');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'CTU', 'CN', 30.558257, 103.945966, 'Chengdu Shuangliu International Airport', 'Chengdu (Shuangliu)', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'URC', 'CN', 43.907100677490234, 87.47419738769531, 'Ürümqi Diwopu International Airport', 'Ürümqi', 'Asia/Urumqi');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'CGQ', 'CN', 43.996201, 125.684998, 'Changchun Longjia International Airport', 'Changchun', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'HRB', 'CN', 45.623402, 126.25, 'Harbin Taiping International Airport', 'Harbin', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'DLC', 'CN', 38.965698, 121.539001, 'Dalian Zhoushuizi International Airport', 'Ganjingzi, Dalian', 'Asia/Shanghai');
INSERT INTO airport(id, iata_code, iso_country, latitude, longitude, name, municipality, timezone) VALUES (nextval('airport_id'), 'SHE', 'CN', 41.639801, 123.483002, 'Shenyang Taoxian International Airport', 'Hunnan, Shenyang', 'Asia/Shanghai');
