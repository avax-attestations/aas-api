# AAS-API

An REST API exposing attestation data.

## API

The API uses [postgrest](https://postgrest.org/en/v12/) to expose a limited subset of the database though a REST API.

## Database

The API uses the database schema from the [eas-indexing-service](https://github.com/avax-attestations/eas-indexing-service)
as a starting point. The API project maintains control over database migrations using the [migrate](https://github.com/golang-migrate/migrate/)
project.
