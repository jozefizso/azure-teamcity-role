#!/bin/sh

# ---------------------------------------------------------------------
# TeamCity server start/stop script
# ---------------------------------------------------------------------
# Environment variables:
#
# TEAMCITY_SERVER_MEM_OPTS   server memory options (JVM options)
#
# TEAMCITY_DATA_PATH         path to TeamCity data directory
#
# ---------------------------------------------------------------------

#AZURE_TOMCAT7_CMDLINE='-Dport.http=%HTTP_PLATFORM_PORT% -Djava.util.logging.config.file="D:\Program Files (x86)\apache-tomcat-7.0.50\conf\logging.properties" -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager -Dsite.logdir="d:/home/LogFiles/" -Dsite.tempdir="d:\home\site\workdir" -classpath "D:\Program Files (x86)\apache-tomcat-7.0.50\bin\bootstrap.jar;D:\Program Files (x86)\apache-tomcat-7.0.50\bin\tomcat-juli.jar" -Dcatalina.base="D:\Program Files (x86)\apache-tomcat-7.0.50" -Djava.io.tmpdir="d:\home\site\workdir" org.apache.catalina.startup.Bootstrap'

if [ "$TEAMCITY_SERVER_MEM_OPTS" = "" ]; then
  TEAMCITY_SERVER_MEM_OPTS="-Xms750m -Xmx750m -XX:MaxPermSize=270m"
fi

AZURE_WORKDIR="$HOME\\site\\workdir"
TEAMCITY_LOG_PATH="$TEAMCITY_DATA_PATH/logs"

mkdir $TEAMCITY_LOG_PATH 2>/dev/null


AZURE_TOMCAT7_CMDLINE="-Dport.http=%HTTP_PLATFORM_PORT% "\
                      "-Djava.util.logging.config.file=\"$TEAMCITY_DATA_PATH/conf/logging.properties\" "\
                      "-Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager "\
                      "-Dsite.logdir=\"$TEAMCITY_LOG_PATH\" "\
                      "-Dsite.tempdir=\"$AZURE_WORKDIR\" "\
                      "-classpath \"$AZURE_TOMCAT7_HOME\\bin\\bootstrap.jar;$AZURE_TOMCAT7_HOME\\bin\\tomcat-juli.jar\" "\
                      "-Dcatalina.base=\"$AZURE_TOMCAT7_HOME\" "\
                      "-Djava.io.tmpdir=\"$AZURE_WORKDIR\" "\
                      "-server $TEAMCITY_SERVER_MEM_OPTS "\
                      "-Dlog4j.configuration=\"file:$TEAMCITY_DATA_PATH/conf/teamcity-server-log4j.xml\" "\
                      "-Dteamcity_logs=\"$TEAMCITY_DATA_PATH/logs/\" "\
                      "-Djava.awt.headless=true "\
                      "org.apache.catalina.startup.Bootstrap"

export AZURE_TOMCAT7_CMDLINE

exit 0
