FROM openjdk:8-jre-alpine
ENV APP_FILE employee-1.0.jar
ENV APP_HOME /usr/apps
EXPOSE 8090
COPY target/$APP_FILE $APP_HOME/
WORKDIR $APP_HOME
ENTRYPOINT ["sh", "-c"]
CMD ["exec java -jar $APP_FILE"]