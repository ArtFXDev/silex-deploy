# silex-deploy
Silex docker-compose and nginx deployment repos

## Temporary install:

Created a folder containing the following repos:
  - silex-doc
  - silex-front
  - zou
  - kitsu
 
 Required:
  - Docker
  - locally created env file in silex-deploy folder
 
 All docker commands are run from silex-deploy folder.
 to run:
 
    `docker-compose up`
  
  To stop:
  
  ctrl+C
  
  To remove containers:
  
  
    `docker-compose down`
    
   to list images:
   
    `docker images`
   
   to remove an image:
   
    `docker image rm {IMAGE_ID}`
   
   To test locally, change the windows host file (C//Windows/System32/drivers/etc/hosts), and add:
   
```   
  127.0.0.1 docs.preprod.silex.artfx.fr
  127.0.0.1 front.preprod.silex.artfx.fr
  127.0.0.1 kitsu.preprod.silex.artfx.fr
  127.0.0.1 events.preprod.silex.artfx.fr
```

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
=======
