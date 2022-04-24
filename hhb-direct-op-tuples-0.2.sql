\connect hhbdirect

INSERT INTO operation (id_operation, num_compte, date, id_type, id_type_vers, num_compte_vers, designation, type_operation, montant, carte_num, chequier_num) VALUES (1, 1, '2012-10-27', 1, NULL, NULL, 'Ouverture compte', 'CREDIT', 100,1,NULL);
INSERT INTO operation (id_operation, num_compte, date, id_type, id_type_vers, num_compte_vers, designation, type_operation, montant, carte_num, chequier_num) VALUES (2, 1, '2012-11-01', 1, NULL, NULL, 'Versement', 'CREDIT', 900,NULL,2);
INSERT INTO operation (id_operation, num_compte, date, id_type, id_type_vers, num_compte_vers, designation, type_operation, montant, carte_num, chequier_num) VALUES (3, 1, '2012-11-01', 2, NULL, NULL, 'Versement Ouverture', 'CREDIT', 2000,1,NULL);
INSERT INTO operation (id_operation, num_compte, date, id_type, id_type_vers, num_compte_vers, designation, type_operation, montant, carte_num, chequier_num) VALUES (4, 3, '2012-11-02', 1, NULL, NULL, 'Paye Novembre', 'CREDIT', 5000,NULL,NULL);
INSERT INTO operation (id_operation, num_compte, date, id_type, id_type_vers, num_compte_vers, designation, type_operation, montant, carte_num, chequier_num) VALUES (5, 3, '2012-11-03', 1, NULL, NULL, 'Loyer Novembre', 'DEBIT', 1200, 2,NULL);
INSERT INTO operation (id_operation, num_compte, date, id_type, id_type_vers, num_compte_vers, designation, type_operation, montant, carte_num, chequier_num) VALUES (6, 3, '2012-11-03', 1, NULL, NULL, 'EDF', 'DEBIT', 400,NULL,2);
