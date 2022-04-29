# What is Task Force Elite?

Tip of the Spear: Task Force Elite is a causal competitive multiplayer game, inspired by the FPS games of the last 20 years. 
Task Force Elite is a modern team-based FPS tailored to 6v6 to 8v8 competitive gaming where both rookies and veterans go toe to toe.


# How to use this image

## First run

Our First run will take some time to complete , we will:

 - Install Docker
 - Install and start TFE dedicated server
 
### Install Docker
```
## For other installation methods , please check https://docs.docker.com/engine/install/ubuntu/
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```   
  

### Install and start TFE dedicated server

Here we will start our container and it will take care of below:

 - Download and Install steamcmd
 - Download latest TFE server
 - Get Initial Admin Tool password
 - Start up the Server processes

```
# prepare tfe server run directory in users home
mkdir -p ~/tfe/tfe-data && cd ~/tfe

#download and start container 
sudo docker run --net=host -t -v ~/tfe/tfe-data:/home/tfe/tfe-dedicated/ --name tfe _server enda2020/tfe_server:latest

#to see process 
sudo docker container attach tfe_server
```

:red_circle: Initial Server Admin Credentials will be printed on the screen, please make note of them! :red_circle:

## Server Logs

GameServer, Master Server(MS) and Dedicated Server (DSC) logs are stored in a single location

```
cd ~/tfe/tfe-data/TaskForceElite/Saved/Logs

```

## Useful Docker Commands

Get Container ID using docker ps
```
sudo docker ps
```

Stop the container
```
sudo docker stop CONTAINER_ID
```

Restart the container / TFE Server 
```
sudo docker restart CONTAINER_ID
```



