# OCTO EVENTS

Octo Events is an application that listens to Github Events via webhooks and expose by an api for later user.

## Technologies

```
  Database: Postgresql
  Ruby: 3.1.2
  Rails: 7.0.4
```

## Table of content

- [Configuring a webhook integration](#webhook-integration)
  - [Github Integration](#github-integration)
- [Running local](#running-local)
  - [Requirements](#requirements)
  - [Enviroments](#enviroments)
- [Tests and Coverage](#tests-and-coverage)

## Webhook Integration

### Github Integration

To capture events from a especific repo on github, you should access the settings from repo.

1. Click on Webhooks option
2. Click on Add webhook
3. Fill **Payload URL** with domain app and use a basic auth same as example:

   if your app settings is:

   ```
   Domain: mydomain.com
   API User: xxx
   API Password: xxx
   ```

   Fill **Payload URL** with:

   ```
    https://xxx:xxx@mydomain.com/api/v1/events/webhook
   ```

   To learn more about authentication, see [Enviroments](#enviroments)

4. Change content type to `application/json`
5. Click on Save.

## Running local

### Requirements

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/)

### Enviroments

| Variable          | Description                                                             |
| ----------------- | ----------------------------------------------------------------------- |
| DATABASE_HOSTNAME | database address                                                        |
| DATABASE_USERNAME | database user                                                           |
| DATABASE_PASSWORD | database password                                                       |
| WEBHOOK_DOMAIN    | Domain of the service that will be responsible for sending the webhooks |
| USER              | User used in authentication                                             |
| PASSWORD          | Password used in authentication                                         |

# Running

Start containers:

```sh
docker-compose up
```

# Development

Build containers:

```sh
docker-compose build
```

Access an container

```sh
docker-compose run --rm app bash
```

## Tests and Coverage

Connect to container

```sh
docker-compose run --rm app bash
```

Run command:

```sh
rspec
```

If you need to check test coverage:

```sh
RAILS_ENV=test rspec
```

After the command, open the file coverage/index.html

## API Docs

Start containers:

```sh
docker-compose up
```

Open: [http://localhost:3000/api-docs](http://localhost:3000/api-docs)
