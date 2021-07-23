FROM openjdk:11-jre-alpine
VOLUME ["/tmp", "/tmp/config", "/tmp/logs"] 
#FROM java:8
ENV APP_FILE childcare-0.0.1-SNAPSHOT.jar
ENV APP_HOME /usr/apps
EXPOSE 8081
COPY target/$APP_FILE $APP_HOME/
WORKDIR $APP_HOME
#ENTRYPOINT ["sh", "-c"]
#CMD ["exec java -Xms16m -Xmx32m -XX:MaxMetaspaceSize=48m -XX:CompressedClassSpaceSize=8m -Xss256k -Xmn8m -XX:InitialCodeCacheSize=4m -XX:ReservedCodeCacheSize=8m -XX:MaxDirectMemorySize=16m -jar $APP_FILE"]
ENV JAVA_OPTS "-Xms32m -Xmx96m -XX:MaxMetaspaceSize=128m -XX:CompressedClassSpaceSize=16m -Xss512k -Xmn16m -XX:InitialCodeCacheSize=8m -XX:ReservedCodeCacheSize=16m -XX:MaxDirectMemorySize=32m"
ENTRYPOINT exec java $JAVA_OPTS -jar $APP_FILE
