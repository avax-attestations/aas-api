# AAS-API

An REST API exposing attestation data.

## API

The API uses [postgrest](https://postgrest.org/en/v12/) to expose a limited subset of the database though a REST API.

## Swagger-ui

postgrest generates an openAPI schema but does not bundle the swagger UI. For development a swagger UI can be started with a docker container `docker run -p 3001:8080 -e SWAGGER_JSON_URL=http://localhost:3000  swaggerapi/swagger-ui`, this assumes you have the postgrest server listening on port _3000_ and will serve the swagger UI on port _3001_.

## Database

The API uses the database schema from the [eas-indexing-service](https://github.com/avax-attestations/eas-indexing-service)
as a starting point. The API project maintains control over database migrations using the [migrate](https://github.com/golang-migrate/migrate/)
project.
