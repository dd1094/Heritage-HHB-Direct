--
-- PostgreSQL database dump
--

-- Started on 2012-11-27 12:09:40 CET

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 1859 (class 1262 OID 16514)
-- Name: hhbdirect; Type: DATABASE; Schema: -; Owner: postgres
--

DROP DATABASE IF EXISTS hhbdirect;
CREATE DATABASE hhbdirect WITH TEMPLATE = template0 ENCODING = 'UTF8';


ALTER DATABASE hhbdirect OWNER TO postgres;

\connect hhbdirect

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 471 (class 2612 OID 24850)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO postgres;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 140 (class 1259 OID 16515)
-- Dependencies: 3
-- Name: dependre; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE dependre (
    num_client integer NOT NULL,
    date pg_catalog.date NOT NULL,
    num_agence integer
);


ALTER TABLE public.dependre OWNER TO postgres;

--
-- TOC entry 144 (class 1259 OID 16554)
-- Dependencies: 3
-- Name: agence; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE agence (
    num_agence integer NOT NULL,
    nom_agence character varying(50),
    adresse_agence character varying(192),
    tel_agence character(10)
);


ALTER TABLE public.agence OWNER TO postgres;

--
-- TOC entry 143 (class 1259 OID 16541)
-- Dependencies: 3
-- Name: client; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE client (
    num_client integer NOT NULL,
    nom_client character varying(30),
    prenom_client character varying(30),
    adresse_client character varying(192),
    identifiant_internet character varying(30),
    mdp_internet character varying(30)
);


ALTER TABLE public.client OWNER TO postgres;

--
-- TOC entry 146 (class 1259 OID 16644)
-- Dependencies: 3
-- Name: compte; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE compte (
    id_type smallint NOT NULL,
    num_compte integer NOT NULL,
    date_fermer pg_catalog.date,
    date_ouvrir pg_catalog.date NOT NULL,
    solde integer
);


ALTER TABLE public.compte OWNER TO postgres;

--
-- TOC entry 142 (class 1259 OID 16536)
-- Dependencies: 3
-- Name: date; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE date (
    date pg_catalog.date NOT NULL
);


ALTER TABLE public.date OWNER TO postgres;

--
-- TOC entry 148 (class 1259 OID 16684)
-- Dependencies: 3
-- Name: operation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE operation (
    id_operation bigint NOT NULL,
    num_compte integer NOT NULL,
    date pg_catalog.date NOT NULL,
    id_type smallint NOT NULL,
    id_type_vers smallint,
    num_compte_vers integer,
    designation character varying(50),
    type_operation character varying(20),
    carte_num bigint,
    chequier_num bigint,
    montant integer
);


ALTER TABLE public.operation OWNER TO postgres;



--
-- TOC entry 145 (class 1259 OID 16559)
-- Dependencies: 3
-- Name: remunerer; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE remunerer (
    date pg_catalog.date NOT NULL,
    date_de pg_catalog.date NOT NULL,
    id_type smallint NOT NULL,
    taux_interet integer
);


ALTER TABLE public.remunerer OWNER TO postgres;

--
-- TOC entry 141 (class 1259 OID 16523)
-- Dependencies: 3
-- Name: type_compte; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE type_compte (
    id_type smallint NOT NULL,
    designation character varying(50)
);


ALTER TABLE public.type_compte OWNER TO postgres;


CREATE TABLE carte (
    carte_num bigint NOT NULL,
    carte_code_secur smallint NOT NULL,
    date pg_catalog.date NOT NULL,
    num_client INTEGER NULL,
    id_type smallint,
    num_compte integer
);
ALTER TABLE public.carte OWNER TO postgres;

CREATE TABLE chequier (
    chequier_num bigint NOT NULL,
    chequier_activ boolean NOT NULL,
    chequier_ordre_destr boolean NOT NULL,
    date pg_catalog.date NOT NULL,
    num_compte INTEGER NULL,
    id_type smallint NOT NULL
);
ALTER TABLE public.chequier OWNER TO postgres;


CREATE TABLE cheque (
    cheque_num bigint NOT NULL,
    chequier_num bigint NOT NULL
);

--
-- TOC entry 1848 (class 0 OID 16515)
-- Dependencies: 140
-- Data for Name: dependre; Type: TABLE DATA; Schema: public; Owner: postgres
--


INSERT INTO dependre (num_client, date, num_agence) VALUES (1, '2012-10-27', 3);
INSERT INTO dependre (num_client, date, num_agence) VALUES (3, '2012-11-01', 1);
INSERT INTO dependre (num_client, date, num_agence) VALUES (3, '2012-11-03', NULL);
INSERT INTO dependre (num_client, date, num_agence) VALUES (2, '2012-11-02', 3);
INSERT INTO dependre (num_client, date, num_agence) VALUES (4, '2012-11-01', 2);
INSERT INTO dependre (num_client, date, num_agence) VALUES (5, '2012-11-02', NULL);


--
-- TOC entry 1852 (class 0 OID 16554)
-- Dependencies: 144
-- Data for Name: agence; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO agence (num_agence, nom_agence, adresse_agence, tel_agence) VALUES (1, 'CAEN Centre', '13 Rue St Pierre, 14000 CAEN', '0233456789');
INSERT INTO agence (num_agence, nom_agence, adresse_agence, tel_agence) VALUES (3, 'Lannion', '2 bis Rue de Brelevenez, 22300 LANNION', '0232564345');
INSERT INTO agence (num_agence, nom_agence, adresse_agence, tel_agence) VALUES (2, 'Nogent sur Marne', '12 Bd de Strasbourg, 94230 Nogent sur Marne', '0145232356');


--
-- TOC entry 1851 (class 0 OID 16541)
-- Dependencies: 143
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO client (num_client, nom_client, prenom_client, adresse_client, identifiant_internet, mdp_internet) VALUES (1, 'DUPONT', 'Pierre', '5 Rue du Port, 22300 LANNION', 'Pdupont', 'Pdupont');
INSERT INTO client (num_client, nom_client, prenom_client, adresse_client, identifiant_internet, mdp_internet) VALUES (2, 'DUPONT', 'Annie', '5 Rue du Port, 22300 LANNION', 'Adupont', 'Adupont');
INSERT INTO client (num_client, nom_client, prenom_client, adresse_client, identifiant_internet, mdp_internet) VALUES (3, 'DELAVAL', 'Jean', '12 Bd de l''Orne, 14234 OUISTREHAM', 'Jdelaval', 'Jdelaval');
INSERT INTO client (num_client, nom_client, prenom_client, adresse_client, identifiant_internet, mdp_internet) VALUES (4, 'HANOT', 'Eric', '13 Avenue de Neuilly, 94230 NOGENT SUR MARNE', 'Ehanot', 'Ehanot');
INSERT INTO client (num_client, nom_client, prenom_client, adresse_client, identifiant_internet, mdp_internet) VALUES (5, 'LEVY', 'Sarah', '1 Rue Neuve, 14110 CONDE SUR NOIREAU', 'Slevy', 'Slevy');


--
-- TOC entry 1854 (class 0 OID 16644)
-- Dependencies: 146
-- Data for Name: compte; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO compte (id_type, num_compte, date_fermer, date_ouvrir, solde) VALUES (1, 1, NULL, '2012-10-27', 1000);
INSERT INTO compte (id_type, num_compte, date_fermer, date_ouvrir, solde) VALUES (2, 1, NULL, '2012-11-01', 2000);
INSERT INTO compte (id_type, num_compte, date_fermer, date_ouvrir, solde) VALUES (1, 3, NULL, '2012-11-02', 3400);
INSERT INTO compte (id_type, num_compte, date_fermer, date_ouvrir, solde) VALUES (1, 4, NULL, '2012-11-01', 4000);
INSERT INTO compte (id_type, num_compte, date_fermer, date_ouvrir, solde) VALUES (1, 5, NULL, '2012-10-27', -1200);
INSERT INTO compte (id_type, num_compte, date_fermer, date_ouvrir, solde) VALUES (2, 5, NULL, '2012-10-27', 500);


--
-- TOC entry 1850 (class 0 OID 16536)
-- Dependencies: 142
-- Data for Name: date; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO date (date) VALUES ('2012-10-27');
INSERT INTO date (date) VALUES ('2012-11-01');
INSERT INTO date (date) VALUES ('2012-11-02');
INSERT INTO date (date) VALUES ('2012-11-03');
INSERT INTO date (date) VALUES ('2012-01-01');
INSERT INTO date (date) VALUES ('2012-12-31');
INSERT INTO date (date) VALUES ('2012-10-01');
INSERT INTO date (date) VALUES ('2012-09-01');
INSERT INTO date (date) VALUES ('2012-12-01');


--
-- TOC entry 1856 (class 0 OID 16684)
-- Dependencies: 148
-- Data for Name: operation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO operation (id_operation, num_compte, date, id_type, id_type_vers, num_compte_vers, designation, type_operation, montant, carte_num, chequier_num) VALUES (1, 1, '2012-10-27', 1, NULL, NULL, 'Ouverture compte', 'CREDIT', 100,1,NULL);
INSERT INTO operation (id_operation, num_compte, date, id_type, id_type_vers, num_compte_vers, designation, type_operation, montant, carte_num, chequier_num) VALUES (2, 1, '2012-11-01', 1, NULL, NULL, 'Versement', 'CREDIT', 900,NULL,2);
INSERT INTO operation (id_operation, num_compte, date, id_type, id_type_vers, num_compte_vers, designation, type_operation, montant, carte_num, chequier_num) VALUES (3, 1, '2012-11-01', 2, NULL, NULL, 'Versement Ouverture', 'CREDIT', 2000,1,NULL);
INSERT INTO operation (id_operation, num_compte, date, id_type, id_type_vers, num_compte_vers, designation, type_operation, montant, carte_num, chequier_num) VALUES (4, 3, '2012-11-02', 1, NULL, NULL, 'Paye Novembre', 'CREDIT', 5000,NULL,NULL);
INSERT INTO operation (id_operation, num_compte, date, id_type, id_type_vers, num_compte_vers, designation, type_operation, montant, carte_num, chequier_num) VALUES (5, 3, '2012-11-03', 1, NULL, NULL, 'Loyer Novembre', 'DEBIT', 1200, 2,NULL);
INSERT INTO operation (id_operation, num_compte, date, id_type, id_type_vers, num_compte_vers, designation, type_operation, montant, carte_num, chequier_num) VALUES (6, 3, '2012-11-03', 1, NULL, NULL, 'EDF', 'DEBIT', 400,NULL,2);




--
-- TOC entry 1853 (class 0 OID 16559)
-- Dependencies: 145
-- Data for Name: remunerer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO remunerer (date, date_de, id_type, taux_interet) VALUES ('2012-11-01', '2012-01-01', 2, 2);
INSERT INTO remunerer (date, date_de, id_type, taux_interet) VALUES ('2012-12-31', '2012-11-02', 2, 4);


--
-- TOC entry 1849 (class 0 OID 16523)
-- Dependencies: 141
-- Data for Name: type_compte; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO type_compte (id_type, designation) VALUES (1, 'Compte Courant');
INSERT INTO type_compte (id_type, designation) VALUES (2, 'Livret A');

INSERT INTO carte (carte_num, carte_code_secur, num_client, date, num_compte, id_type) VALUES (1, 1234,1,'2012-10-01',1, 1);
INSERT INTO carte (carte_num, carte_code_secur, num_client, date, num_compte, id_type) VALUES (2, 1234,2,'2012-10-01',1, 2);
INSERT INTO carte (carte_num, carte_code_secur, num_client, date, num_compte, id_type) VALUES (3, 1234,3,'2012-10-01',1, 2);


INSERT INTO chequier (chequier_num, chequier_activ, chequier_ordre_destr, num_compte, id_type, date) VALUES (1, TRUE,FALSE,1, 1,'2012-12-31');
INSERT INTO chequier (chequier_num, chequier_activ, chequier_ordre_destr, num_compte, id_type, date) VALUES (2, TRUE,FALSE,1, 2,'2012-12-31');
INSERT INTO chequier (chequier_num, chequier_activ, chequier_ordre_destr, num_compte, id_type, date) VALUES (3, TRUE,FALSE,1, 2,'2012-12-31');

INSERT INTO cheque (cheque_num,chequier_num) VALUES (1,1);
INSERT INTO cheque (cheque_num,chequier_num) VALUES (2,1);
INSERT INTO cheque (cheque_num,chequier_num) VALUES (3,2);
--
-- TOC entry 1806 (class 2606 OID 16519)
-- Dependencies: 140 140 140
-- Name: pk_dependre; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dependre
    ADD CONSTRAINT pk_dependre PRIMARY KEY (num_client, date);


--
-- TOC entry 1814 (class 2606 OID 16558)
-- Dependencies: 144 144
-- Name: pk_agence; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY agence
    ADD CONSTRAINT pk_agence PRIMARY KEY (num_agence);


--
-- TOC entry 1812 (class 2606 OID 16545)
-- Dependencies: 143 143
-- Name: pk_client; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY client
    ADD CONSTRAINT pk_client PRIMARY KEY (num_client);


--
-- TOC entry 1824 (class 2606 OID 16648)
-- Dependencies: 146 146 146
-- Name: pk_compte; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY compte
    ADD CONSTRAINT pk_compte PRIMARY KEY (id_type, num_compte);


--
-- TOC entry 1810 (class 2606 OID 16540)
-- Dependencies: 142 142
-- Name: pk_date; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY date
    ADD CONSTRAINT pk_date PRIMARY KEY (date);


--
-- TOC entry 1833 (class 2606 OID 16688)
-- Dependencies: 148 148
-- Name: pk_operation; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY operation
    ADD CONSTRAINT pk_operation PRIMARY KEY (id_operation);


--
-- TOC entry 1819 (class 2606 OID 16563)
-- Dependencies: 145 145 145 145
-- Name: pk_remunerer; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY remunerer
    ADD CONSTRAINT pk_remunerer PRIMARY KEY (date, date_de, id_type);


--
-- TOC entry 1808 (class 2606 OID 16527)
-- Dependencies: 141 141
-- Name: pk_type_compte; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY type_compte
    ADD CONSTRAINT pk_type_compte PRIMARY KEY (id_type);


--
-- TOC entry 1802 (class 1259 OID 16522)
-- Dependencies: 140
-- Name: i_fk_dependre_agence; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_dependre_agence ON dependre USING btree (num_agence);


--
-- TOC entry 1803 (class 1259 OID 16521)
-- Dependencies: 140
-- Name: i_fk_dependre_client; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_dependre_client ON dependre USING btree (num_client);


--
-- TOC entry 1804 (class 1259 OID 16520)
-- Dependencies: 140
-- Name: i_fk_dependre_date; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_dependre_date ON dependre USING btree (date);


--
-- TOC entry 1820 (class 1259 OID 16664)
-- Dependencies: 146
-- Name: i_fk_compte_date; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_compte_date ON compte USING btree (date_fermer);


--
-- TOC entry 1821 (class 1259 OID 16665)
-- Dependencies: 146
-- Name: i_fk_compte_date2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_compte_date2 ON compte USING btree (date_ouvrir);


--
-- TOC entry 1822 (class 1259 OID 16666)
-- Dependencies: 146
-- Name: i_fk_compte_type_compte; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_compte_type_compte ON compte USING btree (id_type);


--
-- TOC entry 1829 (class 1259 OID 16704)
-- Dependencies: 148 148
-- Name: i_fk_operation_compte; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_operation_compte ON operation USING btree (id_type, num_compte);


--
-- TOC entry 1830 (class 1259 OID 16705)
-- Dependencies: 148 148
-- Name: i_fk_operation_compte1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_operation_compte1 ON operation USING btree (id_type_vers, num_compte_vers);


--
-- TOC entry 1831 (class 1259 OID 16706)
-- Dependencies: 148
-- Name: i_fk_operation_date; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_operation_date ON operation USING btree (date);


--
-- TOC entry 1815 (class 1259 OID 16564)
-- Dependencies: 145
-- Name: i_fk_remunerer_date; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_remunerer_date ON remunerer USING btree (date);


--
-- TOC entry 1816 (class 1259 OID 16565)
-- Dependencies: 145
-- Name: i_fk_remunerer_date1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_remunerer_date1 ON remunerer USING btree (date_de);


--
-- TOC entry 1817 (class 1259 OID 16566)
-- Dependencies: 145
-- Name: i_fk_remunerer_type_compte; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_remunerer_type_compte ON remunerer USING btree (id_type);


--
-- TOC entry 1836 (class 2606 OID 16584)
-- Dependencies: 1813 144 140
-- Name: fk_dependre_agence; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dependre
    ADD CONSTRAINT fk_dependre_agence FOREIGN KEY (num_agence) REFERENCES agence(num_agence);


--
-- TOC entry 1835 (class 2606 OID 16579)
-- Dependencies: 143 140 1811
-- Name: fk_dependre_client; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dependre
    ADD CONSTRAINT fk_dependre_client FOREIGN KEY (num_client) REFERENCES client(num_client);


--
-- TOC entry 1834 (class 2606 OID 16574)
-- Dependencies: 142 140 1809
-- Name: fk_dependre_date; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dependre
    ADD CONSTRAINT fk_dependre_date FOREIGN KEY (date) REFERENCES date(date);


--
-- TOC entry 1840 (class 2606 OID 16649)
-- Dependencies: 142 146 1809
-- Name: fk_compte_date; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY compte
    ADD CONSTRAINT fk_compte_date FOREIGN KEY (date_fermer) REFERENCES date(date);


--
-- TOC entry 1841 (class 2606 OID 16654)
-- Dependencies: 1809 142 146
-- Name: fk_compte_date2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY compte
    ADD CONSTRAINT fk_compte_date2 FOREIGN KEY (date_ouvrir) REFERENCES date(date);


--
-- TOC entry 1842 (class 2606 OID 16659)
-- Dependencies: 146 1807 141
-- Name: fk_compte_type_compte; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY compte
    ADD CONSTRAINT fk_compte_type_compte FOREIGN KEY (id_type) REFERENCES type_compte(id_type);


--
-- TOC entry 1845 (class 2606 OID 16689)
-- Dependencies: 1823 148 148 146 146
-- Name: fk_operation_compte; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY operation
    ADD CONSTRAINT fk_operation_compte FOREIGN KEY (id_type, num_compte) REFERENCES compte(id_type, num_compte);


--
-- TOC entry 1846 (class 2606 OID 16694)
-- Dependencies: 146 148 148 146 1823
-- Name: fk_operation_compte1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY operation
    ADD CONSTRAINT fk_operation_compte1 FOREIGN KEY (id_type_vers, num_compte_vers) REFERENCES compte(id_type, num_compte);


--
-- TOC entry 1847 (class 2606 OID 16699)
-- Dependencies: 1809 148 142
-- Name: fk_operation_date; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY operation
    ADD CONSTRAINT fk_operation_date FOREIGN KEY (date) REFERENCES date(date);


--
-- TOC entry 1837 (class 2606 OID 16619)
-- Dependencies: 1809 145 142
-- Name: fk_remunerer_date; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY remunerer
    ADD CONSTRAINT fk_remunerer_date FOREIGN KEY (date) REFERENCES date(date);


--
-- TOC entry 1838 (class 2606 OID 16624)
-- Dependencies: 1809 145 142
-- Name: fk_remunerer_date1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY remunerer
    ADD CONSTRAINT fk_remunerer_date1 FOREIGN KEY (date_de) REFERENCES date(date);


--
-- TOC entry 1839 (class 2606 OID 16629)
-- Dependencies: 141 1807 145
-- Name: fk_remunerer_type_compte; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY remunerer
    ADD CONSTRAINT fk_remunerer_type_compte FOREIGN KEY (id_type) REFERENCES type_compte(id_type);


--
-- TOC entry 1861 (class 0 OID 0)
-- Dependencies: 3
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--


ALTER TABLE ONLY carte
ADD CONSTRAINT carte_num PRIMARY KEY(carte_num);
ALTER TABLE ONLY carte
ADD CONSTRAINT num_client FOREIGN KEY (num_client) REFERENCES client(num_client);
ALTER TABLE ONLY carte
ADD CONSTRAINT date FOREIGN KEY (date) REFERENCES date(date);
ALTER TABLE ONLY carte
ADD CONSTRAINT fk_chequier_compte FOREIGN KEY (id_type, num_compte) REFERENCES compte(id_type, num_compte);

ALTER TABLE ONLY chequier
ADD CONSTRAINT chequier_num PRIMARY KEY(chequier_num);
ALTER TABLE ONLY chequier
ADD CONSTRAINT fk_chequier_compte FOREIGN KEY (id_type, num_compte) REFERENCES compte(id_type, num_compte);
ALTER TABLE ONLY chequier
ADD CONSTRAINT date FOREIGN KEY (date) REFERENCES date(date);

ALTER TABLE ONLY cheque
ADD CONSTRAINT cheque_num PRIMARY KEY(cheque_num);
ALTER TABLE ONLY cheque
ADD CONSTRAINT chequier_num FOREIGN KEY (chequier_num) REFERENCES chequier(chequier_num);

ALTER TABLE ONLY operation
ADD CONSTRAINT chequier_num FOREIGN KEY (chequier_num) REFERENCES chequier(chequier_num);
ALTER TABLE ONLY operation
ADD CONSTRAINT carte_num FOREIGN KEY (carte_num) REFERENCES carte(carte_num);

ALTER TABLE ONLY operation
ADD CONSTRAINT ck_exclusivite CHECK(
    (chequier_num IS NULL AND carte_num IS NOT NULL)
    OR (chequier_num IS NOT NULL AND carte_num IS NULL)
    OR (chequier_num IS NULL AND carte_num IS NULL)
);


REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2012-11-27 12:09:40 CET

--
-- PostgreSQL database dump complete
--