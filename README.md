# silex-deploy
Silex docker-compose and nginx deployment repos





## Creation of **zoudb** database

`docker ps` to list running containers.

Connect via sh to the "postgres:*-alpine" container.  
(`<CONTAINER ID>` is the id of "postgres:*-alpine")  
  
```
docker exec -it <CONTAINER ID> sh`
```

### Creation of **zoudb**

Create database **zoudb** (with user **postgres**)
```
su - postgres -c "createdb -T template0 -E UTF8 --owner postgres zoudb"
```

### Checking **zoudb**

Connect to postgres (go into postgres invite)
```
psql -U postgres
```

List databases: `\l`
Connect to zoudb: `\c zoudb`
List tables (dump): `\d`


## Init of **zoudb**

`docker ps` to list running containers.

Connect via sh to the "silex-zou-app" container.  
(`<CONTAINER ID>` is the id of "silex-zou-app")  
  
```
docker exec -it <CONTAINER ID> sh`
```

### Upgrade, init, create admin

```
zou upgrade-db
zou init-data
zou create-admin admin@example.com --password mysecretpassword
```
