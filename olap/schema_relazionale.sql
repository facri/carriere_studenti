--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.11
-- Dumped by pg_dump version 9.3.11
-- Started on 2016-03-24 09:25:34

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 8 (class 2615 OID 16545)
-- Name: AVA; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "AVA";


ALTER SCHEMA "AVA" OWNER TO postgres;

--
-- TOC entry 1 (class 3079 OID 11750)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2035 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = "AVA", pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 175 (class 1259 OID 16570)
-- Name: anno_accademico; Type: TABLE; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE TABLE anno_accademico (
    k_anno_accademico integer NOT NULL,
    anno_anno_accademico numeric,
    nome_anno_accademico text
);


ALTER TABLE "AVA".anno_accademico OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 16568)
-- Name: anno_accademico_k_anno_accademico_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE anno_accademico_k_anno_accademico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "AVA".anno_accademico_k_anno_accademico_seq OWNER TO postgres;

--
-- TOC entry 2036 (class 0 OID 0)
-- Dependencies: 174
-- Name: anno_accademico_k_anno_accademico_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE anno_accademico_k_anno_accademico_seq OWNED BY anno_accademico.k_anno_accademico;


--
-- TOC entry 183 (class 1259 OID 16616)
-- Name: corso; Type: TABLE; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE TABLE corso (
    k_corso integer NOT NULL,
    nome text,
    numero_cfu numeric,
    ssd text,
    codice_corso text
);


ALTER TABLE "AVA".corso OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 16596)
-- Name: corso_di_studi; Type: TABLE; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE TABLE corso_di_studi (
    k_corso_di_studi integer NOT NULL,
    nome_cds text,
    tipo_cds text,
    codice_ateneo text,
    nome_dipartimento text,
    ha_numero_programmato numeric,
    numero_programmato numeric,
    data_inizio_validita text,
    data_fine_validita text,
    codice_dipartimento text,
    codice_corso_di_studi text,
    durata_legale numeric
);


ALTER TABLE "AVA".corso_di_studi OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 16594)
-- Name: corso_di_studi_k_corso_di_studi_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE corso_di_studi_k_corso_di_studi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "AVA".corso_di_studi_k_corso_di_studi_seq OWNER TO postgres;

--
-- TOC entry 2037 (class 0 OID 0)
-- Dependencies: 178
-- Name: corso_di_studi_k_corso_di_studi_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE corso_di_studi_k_corso_di_studi_seq OWNED BY corso_di_studi.k_corso_di_studi;


--
-- TOC entry 182 (class 1259 OID 16614)
-- Name: corso_k_corso_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE corso_k_corso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "AVA".corso_k_corso_seq OWNER TO postgres;

--
-- TOC entry 2038 (class 0 OID 0)
-- Dependencies: 182
-- Name: corso_k_corso_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE corso_k_corso_seq OWNED BY corso.k_corso;


--
-- TOC entry 185 (class 1259 OID 16679)
-- Name: esami; Type: TABLE; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE TABLE esami (
    voto numeric,
    cfu_acquisiti numeric,
    k_tempo integer NOT NULL,
    k_studente integer NOT NULL,
    k_anno_accademico integer NOT NULL,
    k_corso_di_studi integer NOT NULL,
    k_corso integer NOT NULL
);


ALTER TABLE "AVA".esami OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16625)
-- Name: ingressi; Type: TABLE; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE TABLE ingressi (
    punteggio_test numeric,
    immatricolato numeric,
    k_tempo integer NOT NULL,
    k_studente integer NOT NULL,
    k_corso_di_studi integer NOT NULL,
    k_anno_accademico integer NOT NULL,
    k_tipo_immatricolazione integer NOT NULL
);


ALTER TABLE "AVA".ingressi OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16722)
-- Name: lauree; Type: TABLE; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE TABLE lauree (
    voto_laurea numeric,
    k_tempo integer NOT NULL,
    k_anno_accademico integer NOT NULL,
    k_studente integer NOT NULL,
    k_corso_di_studi integer NOT NULL
);


ALTER TABLE "AVA".lauree OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 16585)
-- Name: studente; Type: TABLE; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE TABLE studente (
    k_studente integer NOT NULL,
    matricola numeric,
    data_di_nascita text,
    voto_di_maturita numeric,
    nazione_diploma text,
    istituto_scuola_media_superiore text,
    tipo_scuola_media_superiore text,
    anno_solare_titolo_media_superiore text,
    cf text,
    cognome_studente text,
    nome_studente text,
    coorte numeric,
    provincia text,
    regione text,
    stato text,
    cittadinanza text,
    sesso text
);


ALTER TABLE "AVA".studente OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 16583)
-- Name: studente_k_studente_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE studente_k_studente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "AVA".studente_k_studente_seq OWNER TO postgres;

--
-- TOC entry 2039 (class 0 OID 0)
-- Dependencies: 176
-- Name: studente_k_studente_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE studente_k_studente_seq OWNED BY studente.k_studente;


--
-- TOC entry 173 (class 1259 OID 16559)
-- Name: tempo; Type: TABLE; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE TABLE tempo (
    k_tempo integer NOT NULL,
    giorno numeric,
    mese numeric,
    anno numeric
);


ALTER TABLE "AVA".tempo OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 16557)
-- Name: tempo_k_tempo_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE tempo_k_tempo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "AVA".tempo_k_tempo_seq OWNER TO postgres;

--
-- TOC entry 2040 (class 0 OID 0)
-- Dependencies: 172
-- Name: tempo_k_tempo_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE tempo_k_tempo_seq OWNED BY tempo.k_tempo;


--
-- TOC entry 181 (class 1259 OID 16607)
-- Name: tipo_immatricolazione; Type: TABLE; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_immatricolazione (
    k_tipo_immatricolazione integer NOT NULL
);


ALTER TABLE "AVA".tipo_immatricolazione OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 16605)
-- Name: tipo_immatricolazione_k_tipo_immatricolazione_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE tipo_immatricolazione_k_tipo_immatricolazione_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "AVA".tipo_immatricolazione_k_tipo_immatricolazione_seq OWNER TO postgres;

--
-- TOC entry 2041 (class 0 OID 0)
-- Dependencies: 180
-- Name: tipo_immatricolazione_k_tipo_immatricolazione_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE tipo_immatricolazione_k_tipo_immatricolazione_seq OWNED BY tipo_immatricolazione.k_tipo_immatricolazione;


--
-- TOC entry 1875 (class 2604 OID 16573)
-- Name: k_anno_accademico; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY anno_accademico ALTER COLUMN k_anno_accademico SET DEFAULT nextval('anno_accademico_k_anno_accademico_seq'::regclass);


--
-- TOC entry 1879 (class 2604 OID 16619)
-- Name: k_corso; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY corso ALTER COLUMN k_corso SET DEFAULT nextval('corso_k_corso_seq'::regclass);


--
-- TOC entry 1877 (class 2604 OID 16599)
-- Name: k_corso_di_studi; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY corso_di_studi ALTER COLUMN k_corso_di_studi SET DEFAULT nextval('corso_di_studi_k_corso_di_studi_seq'::regclass);


--
-- TOC entry 1876 (class 2604 OID 16588)
-- Name: k_studente; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY studente ALTER COLUMN k_studente SET DEFAULT nextval('studente_k_studente_seq'::regclass);


--
-- TOC entry 1874 (class 2604 OID 16562)
-- Name: k_tempo; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY tempo ALTER COLUMN k_tempo SET DEFAULT nextval('tempo_k_tempo_seq'::regclass);


--
-- TOC entry 1878 (class 2604 OID 16610)
-- Name: k_tipo_immatricolazione; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY tipo_immatricolazione ALTER COLUMN k_tipo_immatricolazione SET DEFAULT nextval('tipo_immatricolazione_k_tipo_immatricolazione_seq'::regclass);


--
-- TOC entry 1883 (class 2606 OID 16578)
-- Name: anno_accademico_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY anno_accademico
    ADD CONSTRAINT anno_accademico_pkey PRIMARY KEY (k_anno_accademico);


--
-- TOC entry 1887 (class 2606 OID 16604)
-- Name: corso_di_studi_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY corso_di_studi
    ADD CONSTRAINT corso_di_studi_pkey PRIMARY KEY (k_corso_di_studi);


--
-- TOC entry 1891 (class 2606 OID 16624)
-- Name: corso_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY corso
    ADD CONSTRAINT corso_pkey PRIMARY KEY (k_corso);


--
-- TOC entry 1897 (class 2606 OID 16632)
-- Name: ingressi_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_pkey PRIMARY KEY (k_tempo, k_studente, k_corso_di_studi, k_anno_accademico, k_tipo_immatricolazione);


--
-- TOC entry 1906 (class 2606 OID 16729)
-- Name: lauree_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT lauree_pkey PRIMARY KEY (k_tempo, k_anno_accademico, k_studente, k_corso_di_studi);


--
-- TOC entry 1885 (class 2606 OID 16593)
-- Name: studente_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY studente
    ADD CONSTRAINT studente_pkey PRIMARY KEY (k_studente);


--
-- TOC entry 1881 (class 2606 OID 16567)
-- Name: tempo_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tempo
    ADD CONSTRAINT tempo_pkey PRIMARY KEY (k_tempo);


--
-- TOC entry 1889 (class 2606 OID 16612)
-- Name: tipo_immatricolazione_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_immatricolazione
    ADD CONSTRAINT tipo_immatricolazione_pkey PRIMARY KEY (k_tipo_immatricolazione);


--
-- TOC entry 1898 (class 1259 OID 16703)
-- Name: fki_esami_k_anno_accademico_fkey; Type: INDEX; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_esami_k_anno_accademico_fkey ON esami USING btree (k_anno_accademico);


--
-- TOC entry 1899 (class 1259 OID 16709)
-- Name: fki_esami_k_corso_di_studi_fkey; Type: INDEX; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_esami_k_corso_di_studi_fkey ON esami USING btree (k_corso_di_studi);


--
-- TOC entry 1900 (class 1259 OID 16715)
-- Name: fki_esami_k_corso_fkey; Type: INDEX; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_esami_k_corso_fkey ON esami USING btree (k_corso);


--
-- TOC entry 1901 (class 1259 OID 16697)
-- Name: fki_esami_k_studente_fkey; Type: INDEX; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_esami_k_studente_fkey ON esami USING btree (k_studente);


--
-- TOC entry 1892 (class 1259 OID 16655)
-- Name: fki_ingressi_k_anno_accademico_fkey; Type: INDEX; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_ingressi_k_anno_accademico_fkey ON ingressi USING btree (k_anno_accademico);


--
-- TOC entry 1893 (class 1259 OID 16649)
-- Name: fki_ingressi_k_corso_di_studi_fkey; Type: INDEX; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_ingressi_k_corso_di_studi_fkey ON ingressi USING btree (k_corso_di_studi);


--
-- TOC entry 1894 (class 1259 OID 16638)
-- Name: fki_ingressi_k_studente_fkey; Type: INDEX; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_ingressi_k_studente_fkey ON ingressi USING btree (k_studente);


--
-- TOC entry 1895 (class 1259 OID 16661)
-- Name: fki_ingressi_k_tipo_immatricolazione_fkey; Type: INDEX; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_ingressi_k_tipo_immatricolazione_fkey ON ingressi USING btree (k_tipo_immatricolazione);


--
-- TOC entry 1902 (class 1259 OID 16740)
-- Name: fki_lauree_k_anno_accademico_fkey; Type: INDEX; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_lauree_k_anno_accademico_fkey ON lauree USING btree (k_anno_accademico);


--
-- TOC entry 1903 (class 1259 OID 16752)
-- Name: fki_lauree_k_corso_di_studi_fkey; Type: INDEX; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_lauree_k_corso_di_studi_fkey ON lauree USING btree (k_corso_di_studi);


--
-- TOC entry 1904 (class 1259 OID 16746)
-- Name: fki_lauree_k_studente_fkey; Type: INDEX; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_lauree_k_studente_fkey ON lauree USING btree (k_studente);


--
-- TOC entry 1914 (class 2606 OID 16698)
-- Name: esami_k_anno_accademico_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_k_anno_accademico_fkey FOREIGN KEY (k_anno_accademico) REFERENCES anno_accademico(k_anno_accademico);


--
-- TOC entry 1915 (class 2606 OID 16704)
-- Name: esami_k_corso_di_studi_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_k_corso_di_studi_fkey FOREIGN KEY (k_corso_di_studi) REFERENCES corso_di_studi(k_corso_di_studi);


--
-- TOC entry 1916 (class 2606 OID 16710)
-- Name: esami_k_corso_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_k_corso_fkey FOREIGN KEY (k_corso) REFERENCES corso(k_corso);


--
-- TOC entry 1913 (class 2606 OID 16692)
-- Name: esami_k_studente_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_k_studente_fkey FOREIGN KEY (k_studente) REFERENCES studente(k_studente);


--
-- TOC entry 1912 (class 2606 OID 16687)
-- Name: esami_k_tempo_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_k_tempo_fkey FOREIGN KEY (k_tempo) REFERENCES tempo(k_tempo);


--
-- TOC entry 1910 (class 2606 OID 16650)
-- Name: ingressi_k_anno_accademico_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_k_anno_accademico_fkey FOREIGN KEY (k_anno_accademico) REFERENCES anno_accademico(k_anno_accademico);


--
-- TOC entry 1909 (class 2606 OID 16644)
-- Name: ingressi_k_corso_di_studi_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_k_corso_di_studi_fkey FOREIGN KEY (k_corso_di_studi) REFERENCES corso_di_studi(k_corso_di_studi);


--
-- TOC entry 1907 (class 2606 OID 16633)
-- Name: ingressi_k_studente_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_k_studente_fkey FOREIGN KEY (k_studente) REFERENCES studente(k_studente);


--
-- TOC entry 1908 (class 2606 OID 16639)
-- Name: ingressi_k_tempo_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_k_tempo_fkey FOREIGN KEY (k_tempo) REFERENCES tempo(k_tempo);


--
-- TOC entry 1911 (class 2606 OID 16656)
-- Name: ingressi_k_tipo_immatricolazione_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_k_tipo_immatricolazione_fkey FOREIGN KEY (k_tipo_immatricolazione) REFERENCES tipo_immatricolazione(k_tipo_immatricolazione);


--
-- TOC entry 1918 (class 2606 OID 16735)
-- Name: lauree_k_anno_accademico_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT lauree_k_anno_accademico_fkey FOREIGN KEY (k_anno_accademico) REFERENCES anno_accademico(k_anno_accademico);


--
-- TOC entry 1920 (class 2606 OID 16747)
-- Name: lauree_k_corso_di_studi_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT lauree_k_corso_di_studi_fkey FOREIGN KEY (k_corso_di_studi) REFERENCES corso_di_studi(k_corso_di_studi);


--
-- TOC entry 1919 (class 2606 OID 16741)
-- Name: lauree_k_studente_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT lauree_k_studente_fkey FOREIGN KEY (k_studente) REFERENCES studente(k_studente);


--
-- TOC entry 1917 (class 2606 OID 16730)
-- Name: lauree_k_tempo_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT lauree_k_tempo_fkey FOREIGN KEY (k_tempo) REFERENCES tempo(k_tempo);


--
-- TOC entry 2034 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-03-24 09:25:35

--
-- PostgreSQL database dump complete
--

