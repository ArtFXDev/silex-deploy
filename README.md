# silex-deploy
Silex docker-compose and nginx deployment repos

# Temporary install:

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
   
   
  127.0.0.1 docs.preprod.silex.artfx.fr
  
  
  127.0.0.1 front.preprod.silex.artfx.fr
  
  
  127.0.0.1 kitsu.preprod.silex.artfx.fr
  
  
  127.0.0.1 events.preprod.silex.artfx.fr
   
