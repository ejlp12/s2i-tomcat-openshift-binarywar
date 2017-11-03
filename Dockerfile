FROM jboss-webserver-3/webserver31-tomcat7-openshift 

MAINTAINER Ejlp12 <ejlp12@gmail.com>

ENV NEXUSHOST 10.144.6.157
ENV NEXUSPORT 8600
ENV REPO releases
ENV GROUP id.co.astralife.app.eas
ENV ARTIFACT Web
ENV VERSION 2.10.1-RELEASE
ENV EXTENSION war
ENV WARFILE iplus-web.war

RUN curl -v http://$NEXUSHOST:$NEXUSPORT/nexus/service/local/artifact/maven/redirect?r=$REPO&g=$GROUP&a=$ARTIFACT&v=$VERSION&e=$EXTENSION" -o /deployments/$WARFILE


CMD $STI_SCRIPTS_PATH/usage