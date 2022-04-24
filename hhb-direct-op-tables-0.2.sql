\connect hhbdirect

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

CREATE TABLE carte (
    carte_num bigint NOT NULL,
    carte_code_secur smallint NOT NULL,
    date pg_catalog.date NOT NULL,
    num_client INTEGER NULL,
    id_type smallint,
    num_compte integer
);
ALTER TABLE public.carte OWNER TO postgres;

