#!/bin/bash
if [ ! -z "$STEAM_BETA_BRANCH" ]
then
	echo "Loading Steam Beta Branch"
	bash "${STEAMCMDDIR}/steamcmd.sh" +force_install_dir "${STEAMAPPDIR}" \
					+login anonymous \
					+app_update "${STEAM_BETA_APP}" \
					-beta "${STEAM_BETA_BRANCH}" \
					-betapassword "${STEAM_BETA_PASSWORD}" \
					+quit
else
	echo "Loading Steam Release Branch"
	bash "${STEAMCMDDIR}/steamcmd.sh" +force_install_dir "${STEAMAPPDIR}" \
					+login anonymous \
					+app_update "${STEAMAPPID}" \
					+quit
fi




 


## Create Log dir if it doesnt exist already, on first startup this directory does not exists.
eval mkdir -p  ${LOGDIR}



echo "Running Setup.sh...."

eval cd ${STEAMAPPDIR}/CommunityTool/ &&  echo "" | ./Setup.sh | awk '/Username: / {print "=====================================\n| Username: " $2 ", password: " $5 " |\n====================================="}'


echo  "Setup script complete! , Return code is $?"


echo  "Updating DSC ServerConfig.txt to 127.0.0.1..."

eval ls -ltr ${STEAMAPPDIR}/CommunityTool/DSC

eval cd ${STEAMAPPDIR}/CommunityTool/DSC && cat ServerConfig.txt | jq --arg variable "127.0.0.1" '.masterServerIP = $variable'  > ServerConfig2.txt && mv ServerConfig2.txt ServerConfig.txt

echo "DSC Server IP updated...." && cat ${STEAMAPPDIR}/CommunityTool/DSC/ServerConfig.txt


echo "Starting Master Server...."
eval  cd ${STEAMAPPDIR}/CommunityTool/MS  &&   ${STEAMAPPDIR}/CommunityTool/jre/bin/java -jar ${STEAMAPPDIR}/CommunityTool/MS/MS.jar >> ${LOGDIR}/MS_$(date +"%Y.%m.%d-%I.%M.%p").log 2>&1  &

echo " Master Server Started, Return code is $?"

echo "Starting DSC...."

eval  cd ${STEAMAPPDIR}/CommunityTool/DSC  &&   ${STEAMAPPDIR}/CommunityTool/DSC/DSC.sh >> ${LOGDIR}/DSC_$(date +"%Y.%m.%d-%I.%M.%p").log  2>&1  &

echo "DSC started, Return code is $?"

wait

