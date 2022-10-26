#!/bin/bash -e

### ------------------------- Download Keycloak ------------------------- ###

cd /opt/jboss/

keycloakDistFile="/opt/jboss/keycloak_install_stage/downloads/$KEYCLOAK_DIST_FILE"
keycloakDistUrl="$KEYCLOAK_DIST_BASE$KEYCLOAK_DIST_FILE"

if [ -e $keycloakDistFile ];
then
    echo "Keycloak from downloads folder: $keycloakDistFile"
else
    echo "Keycloak from remote source: $keycloakDistUrl"
    keycloakDistFile = $keycloakDistUrl
fi

tar zxf ${keycloakDistFile}
mv /opt/jboss/keycloak-??.?.?* ${JBOSS_HOME}
rm ${keycloakDistFile}
chown -R jboss:0 ${JBOSS_HOME}
chmod -R g+rw ${JBOSS_HOME}

### ------------------------- Install Theme ------------------------- ###

mkdir -p /opt/jboss/keycloak/themes
cp -R /opt/jboss/keycloak_install_stage/themes/* /opt/jboss/keycloak/themes