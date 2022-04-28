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




eval cd ${STEAMAPPDIR}/CommunityTool/ &&  echo "" | ./Setup.sh | awk '/Username: / {print "=====================================\n| Username: " $2 ", password: " $5 " |\n====================================="}'

eval  cd ${STEAMAPPDIR}/CommunityTool/MS  &&   ${STEAMAPPDIR}/CommunityTool/jre/bin/java -jar ${STEAMAPPDIR}/CommunityTool/MS/MS.jar >> ${STEAMAPPDIR}/MS_$(date +"%Y%m%d_%I%M%p").log 2>&1 &

eval  cd ${STEAMAPPDIR}/CommunityTool/DSC  &&   ${STEAMAPPDIR}/CommunityTool/DSC/DSC.sh >> ${STEAMAPPDIR}/DSC_$(date +"%Y%m%d_%I%M%p").log  2>&1   



#eval  cd ${STEAMAPPDIR}/TaskForceElite/Binaries/Linux && ${STEAMAPPDIR}/TaskForceElite/Binaries/Linux/TaskForceEliteServer-Linux-Shipping ServerDefaultMap -DSCIP 10.0.0.8 -DSCPort 1114 -QueryPort=27070 -Log -Port=7777 -RoundTime 900.0 -WarmupTime 30.0 -MaxScore 250.0 -InjuryTime 60.0 -TimeBetweenMatches 30.0 -SpawnProtectionTime 5.0 -MaxPlayers 26 -TimeOfDay 0 -MaxPoints 0 -SessionKey 25JJXWQVh1V1eXNvlNVca2Zdb0fmmEyE807z5BVZt6Q= -NumOfBots 10 -SaveChatLog 0 -EnableWordCensorship 0 -GoalTakenTime 300.0 -AllowSpectator 0 -BotDifficulty 1 -PSPTime 10.0 -MapVote 0 -MapInOrder 0 -GoalResetTime 180 -ServerName Z2RmZ2RmZw== -CommunitySecret 93f8dd355c09c81dcc9efbf0262b2f0a -CommunityPort 1111 -CommunityIP 131.213.254.79 -RoomId 20220426T042926.659607.0

#eval cd ${STEAMAPPDIR}/TaskForceElite/Binaries/Linux && ${STEAMAPPDIR}/TaskForceElite/Binaries/Linux/TaskForceEliteServer-Linux-Shipping


#eval script /dev/null
#eval chmod  777 ${STEAMAPPDIR}/TaskForceElite/Binaries/Linux/TaskForce.sh
#eval ${STEAMAPPDIR}/TaskForceElite/Binaries/Linux/TaskForce.sh


#eval screen -list
#cd ${STEAMAPPDIR}/TaskForceElite/Binaries/Linux && ${STEAMAPPDIR}/TaskForceElite/Binaries/Linux/TaskForceEliteServer-Linux-Shipping 
#DEBUGGING - remove later
#nc -zv 127.0.1.1 1113
#nc -zv 127.0.1.1 1112
#hostname

#hostname -I
#id

####DEBUGGING########
