--
-- Name: Attestation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS public."Attestation" (
    id text NOT NULL,
    data text NOT NULL,
    "decodedDataJson" text DEFAULT ''::text NOT NULL,
    recipient text NOT NULL,
    attester text NOT NULL,
    "time" integer NOT NULL,
    "timeCreated" integer NOT NULL,
    "expirationTime" integer NOT NULL,
    "revocationTime" integer NOT NULL,
    "refUID" text NOT NULL,
    revocable boolean NOT NULL,
    revoked boolean NOT NULL,
    txid text NOT NULL,
    "schemaId" text NOT NULL,
    "ipfsHash" text NOT NULL,
    "isOffchain" boolean NOT NULL
);

--
-- Name: EnsName; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS public."EnsName" (
    id text NOT NULL,
    name text NOT NULL,
    "timestamp" integer NOT NULL
);

--
-- Name: OffchainRevocation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS public."OffchainRevocation" (
    id text NOT NULL,
    "from" text NOT NULL,
    uid text NOT NULL,
    txid text NOT NULL,
    "timestamp" integer NOT NULL
);

--
-- Name: Schema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS public."Schema" (
    id text NOT NULL,
    schema text NOT NULL,
    creator text NOT NULL,
    resolver text NOT NULL,
    revocable boolean NOT NULL,
    index text NOT NULL,
    txid text NOT NULL,
    "time" integer NOT NULL
);

--
-- Name: SchemaName; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS public."SchemaName" (
    id text NOT NULL,
    "schemaId" text NOT NULL,
    "attesterAddress" text NOT NULL,
    name text NOT NULL,
    "time" integer NOT NULL,
    "isCreator" boolean NOT NULL
);

--
-- Name: ServiceStat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS public."ServiceStat" (
    name text NOT NULL,
    value text NOT NULL
);


--
-- Name: Timestamp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS public."Timestamp" (
    id text NOT NULL,
    "from" text NOT NULL,
    txid text NOT NULL,
    tree text DEFAULT ''::text NOT NULL,
    "timestamp" integer NOT NULL
);

--
-- Name: Attestation Attestation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Attestation"
    ADD CONSTRAINT "Attestation_pkey" PRIMARY KEY (id);

--
-- Name: EnsName EnsName_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EnsName"
    ADD CONSTRAINT "EnsName_pkey" PRIMARY KEY (id);

--
-- Name: OffchainRevocation OffchainRevocation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OffchainRevocation"
    ADD CONSTRAINT "OffchainRevocation_pkey" PRIMARY KEY (id);

--
-- Name: SchemaName SchemaName_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SchemaName"
    ADD CONSTRAINT "SchemaName_pkey" PRIMARY KEY (id);


--
-- Name: Schema Schema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Schema"
    ADD CONSTRAINT "Schema_pkey" PRIMARY KEY (id);


--
-- Name: ServiceStat ServiceStat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ServiceStat"
    ADD CONSTRAINT "ServiceStat_pkey" PRIMARY KEY (name);


--
-- Name: Timestamp Timestamp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Timestamp"
    ADD CONSTRAINT "Timestamp_pkey" PRIMARY KEY (id);


--
-- Name: Attestation Attestation_schemaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Attestation"
    ADD CONSTRAINT "Attestation_schemaId_fkey" FOREIGN KEY ("schemaId") REFERENCES public."Schema"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: SchemaName SchemaName_schemaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SchemaName"
    ADD CONSTRAINT "SchemaName_schemaId_fkey" FOREIGN KEY ("schemaId") REFERENCES public."Schema"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
