CREATE ROLE web_anon NOLOGIN;
GRANT USAGE ON SCHEMA public TO web_anon;
GRANT SELECT ON public."Attestation" TO web_anon;
GRANT SELECT ON public."Schema" TO web_anon;
GRANT SELECT ON public."SchemaName" TO web_anon;

CREATE ROLE authenticator NOINHERIT LOGIN PASSWORD 'mysecretpassword';  -- TODO: Move password out.
GRANT web_anon TO authenticator;
