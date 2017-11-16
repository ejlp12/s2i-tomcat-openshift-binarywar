FROM jboss-webserver-3/webserver31-tomcat7-openshift 

MAINTAINER Ejlp12 <ejlp12@gmail.com>

ENV NEXUSHOST 10.144.6.157
ENV NEXUSPORT 8600
ENV REPO releases
ENV GROUP id.co.astralife.app.aes
ENV EXTENSION war

RUN sed -i 's/#tomcat.util.http.parser.HttpParser.requestTargetAllow/tomcat.util.http.parser.HttpParser.requestTargetAllow/g' conf/catalina.properties
RUN set -x && \
    (curl -L -v "http://$NEXUSHOST:$NEXUSPORT/nexus/service/local/artifact/maven/redirect?r=$REPO&g=$GROUP&a=$ARTIFACT&v=$VERSION&e=$EXTENSION" -o /deployments/$WARFILE)
RUN echo "[ejlp12] Done..."
