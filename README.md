# What is Task Force Elite?

Tip of the Spear: Task Force Elite is a causal competitive multiplayer game, inspired by the FPS games of the last 20 years. 
Task Force Elite is a modern team-based FPS tailored to 6v6 to 8v8 competitive gaming where both rookies and veterans go toe to toe.

[Task Force Elite](https://www.redspear.net/games/fps)

# How to use this image

## Installation & First run

Our First run will take some time to complete , we will:

 - Install Docker
 - Install Docker Compose
 - Install and start TFE Dedicated Server

[Demonstration Video](https://youtu.be/ATpLDUX20vY)

### Install Docker
```
## For other installation methods , please check [https://docs.docker.com/engine/install/ubuntu/](https://docs.docker.com/engine/install/ubuntu/)

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

```   
  
### Install Docker Compose 
```
## For other installation methods, please check [https://docs.docker.com/compose/install/](https://docs.docker.com/compose/install/)

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

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

#Download Latest Docker Compose
curl -O https://raw.githubusercontent.com/enda2020/tfe_server/main/docker-compose.yml

#Download and Start Container

sudo docker-compose up -d --force-recreate

# See Installation/Startup Progress

sudo docker logs tfe_server -f
 
```

:red_circle: Initial Server Admin Credentials will be created on the first run, you will find them at ~/tfe/tfe-data/ServerTool_Credential.txt :red_circle:

```
cat ~/tfe/tfe-data/ServerTool_Credential.txt

```


## Docker Compose

```

version: '3.9'

services:
  tfe_dedicated_server:
    image: enda2020/tfe_server
    container_name: tfe_server
    restart: unless-stopped
    network_mode: "host"
    tty: true
    volumes:
      - ./tfe-data:/home/tfe/tfe-dedicated/

```

## Server Logs

GameServer, Master Server(MS) and Dedicated Server (DSC) logs are stored in a single location

```
cd ~/tfe/tfe-data/TaskForceElite/Saved/Logs

```

## Useeful Docker Commands


Stop the container
```
sudo docker-comnpose down
```

Start the container / TFE Server 
```
sudo docker-compose up -d --force-recreate
```

# Credits / Links

[CM2Walki/Squad](https://github.com/CM2Walki/Squad)

[Steam Based Game Servers with Docker](https://youtu.be/g1zt44X2xZo)

[Kattoor/tfe.sh](https://gist.github.com/Kattoor/7485c1ad3bfd6255f099d02b8b0f8d2d)
