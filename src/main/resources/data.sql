
-- Initialisation des tables
INSERT INTO Country(id, code, name) VALUES
-- Les clés sont auto-générées, donc on ne les spécifie pas
(default, 'FR', 'France'), -- id = 1
(default, 'UK', 'United Kingdom'), -- id = 2
(default, 'US', 'United States of America'); -- id = 3
(default, 'ES', 'Espagne'); -- id = 4

-- attention, l'ordre des clés auto-générées n'est pas forcément séquentiel
INSERT INTO CITY(name, population, country_id) VALUES
                                                   ('Paris', 12, SELECT id FROM Country WHERE code = 'FR'),
                                                   ('London', 18, SELECT id FROM Country WHERE code = 'UK'),
                                                   ('New York', 27, SELECT id FROM Country WHERE code = 'US'),
                                                   ('Madrid', 30, SELECT id FROM Country WHERE code = 'ES'),
                                                   ('Seville', 40, SELECT id FROM Country WHERE code = 'ES');