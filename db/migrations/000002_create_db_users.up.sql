CREATE ROLE web_anon NOLOGIN;
GRANT USAGE ON SCHEMA public TO web_anon;
GRANT SELECT ON public."Attestation" TO web_anon;
GRANT SELECT ON public."Schema" TO web_anon;
GRANT SELECT ON public."SchemaName" TO web_anon;

ALTER ROLE authenticator SET pgrst.db_aggregates_enabled = 'true';
GRANT web_anon TO authenticator;

ALTER ROLE authenticator SET statement_timeout TO '10s';
ALTER ROLE web_anon SET statement_timeout TO '1s';
