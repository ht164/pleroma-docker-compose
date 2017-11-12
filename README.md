pleroma-docker-compose
====

docker-compose and other files to run Pleroma using Docker.

## How to use

Clone or update Pleroma to web/pleroma directory.

    mkdir -p web/pleroma && cd web/pleroma
    git clone https://git.pleroma.social/pleroma/pleroma.git .

or

    cd web/pleroma
    git pull

Config config/dev.secret.exs and config/config.exs. See Pleroma's README or wiki.
Config dev.secret.exs as follows.

    config :pleroma, Pleroma.Repo,
      adapter: Ecto.Adapters.Postgres,
      username: "pleroma",
      password: "pleroma",
      database: "pleroma_dev",
      hostname: "db",
      pool_size: 10

Create upload files directory.

    mkdir -p web/uploads

Create database directory.

    mkdir -p db/postgres

Create containers.

    docker-compose build
    docker-compose up -d

Create databases.

    docker exec -it {container id of pleromadocker_web_1} /bin/sh
    mix ecto.create && mix ecto.migrate
    exit

Restart Web.

    docker-compose restart web

Access http://localhost:4000 .

## Update Pleroma

    cd web/pleroma
    git pull
    cd ../..
    docker-compose build
    docker-compose up -d

If Pleroma need to migrate database,

    docker exec -it {container id of pleromadocker_web_1} /bin/sh
    mix ecto.create && mix ecto.migrate
    exit
    docker-compose restart web

## Port conflict

If TCP port 4000 is already used(for example, the host running service using TCP/4000 such as Mastodon), change the port that Pleroma uses.

Config docker-compose.yml

    web:
      ...
      ports:
        - "{LISTENING PORT}:4000"

For example,

      ports:
        - "14000:4000"

You can access Pleroma by http://localhost:14000 .

## Licence

MIT
