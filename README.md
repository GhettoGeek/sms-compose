# SMS Compose

A set of Dockerfiles and a [docker-compose][docker-compose] yml file
to facilitate the running of the VIP SMS tool.

Requires docker-compose 1.3 or higher.

## Running

Create a `.env` file with the following values set appropriately:

```
ACCESS_KEY_ID
SECRET_ACCESS_KEY
ENVIRONMENT
QUEUE_PREFIX
DB_PREFIX
CIVIC_API_KEY
CIVIC_API_ELECTION_ID
CIVIC_API_OFFICIAL_ONLY
TWILIO_SID
TWILIO_TOKEN
TWILIO_NUMBER
PROCS
ROUTINES
LOGGLY_TOKEN
NEWRELIC_TOKEN
```

Build the projects: `docker-compose build`.

Then run them: `docker-compose up`.

You can simulate a user sending a text message to the SMS tool by
sending a message to the running web app. Check the output of
`docker ps` to find the exposed port for the web app and make a POST
request like the following:

```sh
curl -X POST -d "From=+15555555555" -d "Body=HELP" -d "AccountSid=AC7..." http://localdocker:32775
```

> This assumes that the docker host is aliased as `localdocker`, but
> if you're running on Linux, this can probably just be
> `localhost`. Be sure to set the same Twilio AccountSid as in the
> .env file. And use a real phone number so you can receive the
> message(s).

[docker-compose]: http://docs.docker.com/compose/

## Running development versions

Create the .env file as above. When building or running, set the
`COMPOSE_FILE` environment variable to docker-compose.dev.yml:

```sh
COMPOSE_FILE=docker-compose.dev.yml docker-compose build
COMPOSE_FILE=docker-compose.dev.yml docker-compose up
```
