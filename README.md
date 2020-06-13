# jikan-packer-build
Short packer script that creates a finished dockerized jikan image setup for GPC that is ready to deploy. Based on this docker setup: https://github.com/zunjae/JikanDockerized
## Authentification with packer
Authentification for GPC with packer is described here: 
https://www.packer.io/docs/builders/googlecompute/#precedence-of-authentication-methods
## Build the image
After you have set up the credentials you can simply run this command from within the directory of the repo:

    packer build jikan_build.json
## Start the jikan server 
Once the image is deployed you can change to the jikan user with

    su jikan

The password will be 1.mal-api.

Then you should be able to start jikan with

    JikanDockerized/./run.sh




The jikan server will then be listening on port 9001 by default, test it with following command:

    curl http://localhost:9001/public/v3

## ToDo

 - Support different cloud providers
 - Startup Script?
 - Testing
 - Use Packer variables maybe
 - Better Documentation

 

