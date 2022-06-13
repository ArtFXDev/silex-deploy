# Silex deploy

![](https://img.shields.io/badge/Docker-309cef?style=for-the-badge&logo=docker&logoColor=white) ![](https://img.shields.io/badge/Nginx-009639?style=for-the-badge&logo=nginx&logoColor=white) ![](https://img.shields.io/badge/Postgresql-336791?style=for-the-badge&logo=postgresql&logoColor=white)

Silex `docker-compose` and Nginx deployment files.

## Introduction

The compose stack uses the following repositories:

- [silex-doc](https://github.com/ArtFXDev/silex-doc)
- [silex-front](https://github.com/ArtFXDev/silex-front)
- [zou](https://github.com/ArtFXDev/zou/tree/deploy_update) (ArtFXDev fork)
- [kitsu](https://github.com/ArtFXDev/kitsu) (ArtFXDev fork)
- [harvest-api](https://github.com/ArtFXDev/harvest-api)
- [harvest-ui](https://github.com/ArtFXDev/harvest-ui)

## Prerequisites

Make sure to create and modify the `env` files in `./env` (use `.example` files for a template):

- `./env/cgwire` CGWire (Zou, Zou db) related variables
- `./env/harvest` Harvest (UI, API) variables
- `./env/broker` Event broker variables

**-> The `.env` file describe global environment variables for the `docker-compose.yml` file.**

## Installation

To run the compose stack in detached mode:

```shell
$ docker-compose --env-file .env up -d
```

### 1) Zou PostgreSQL database setup

Run a `sh` shell in the `zou-db` container and create the database:

```shell
$ docker-compose exec zou-db sh
$ su - postgres -c "createdb -T template0 -E UTF8 --owner postgres zoudb"
```

Then test that the database was created successfully:

```shell
$ psql -U postgres
$ \l # List databases
$ \c zoudb # Switch database
$ \d # List tables
```

### 2) Initialize Zou database data and admin account

```shell
$ docker-compose exec zou-app sh
$ zou upgrade-db # Apply migrations
$ zou init-data # Initialize entities
$ zou create-admin admin@example.com --password mysecretpassword
$ exit
```

### Testing on local computer

To test the whole stack locally, modify your `host` file and add those urls:

```
127.0.0.1 docs.prod.silex.artfx.fr
127.0.0.1 front.prod.silex.artfx.fr
127.0.0.1 kitsu.prod.silex.artfx.fr
127.0.0.1 events.prod.silex.artfx.fr
```

## Update

To update and pull the latest images, use the following commands:

```shell
$ docker-compose pull
$ docker-compose --env-file .env up -d --build # Rebuild images
```

## Contributing

Pull requests and issues are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

[MIT](./LICENSE.md) [@ArtFX](https://artfx.school/)
