#This Dockerfile builds Apache JMeter Master Executable based on jmeter-base

FROM jmeter-base:v1.0.1

LABEL Description="This image is used to start the Apache JMeter Server Executable" Vendor="Collabnix" Version="1.0"

# Ports required for JMeter Slaves/Server
EXPOSE 1099 50000

COPY resources/jmeter-server.sh /jmeter-server.sh

RUN mkdir /workspace

ENTRYPOINT ["/jmeter-server.sh"]

# Application to be executed to start the JMeter container
