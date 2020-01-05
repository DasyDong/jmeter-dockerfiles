#This Dockerfile builds Apache JMeter Master Executable based on jmeter-base

FROM jmeter-base:v1.0.1

LABEL Description="This image is used to start the Apache JMeter Master Executable" Vendor="Collabnix" Version="1.0"
#Port 60000 required for JMeter Master
EXPOSE 60000

COPY resources/jmeter-master.sh /jmeter-master.sh

RUN mkdir /workspace

ENTRYPOINT ["/jmeter-master.sh"]
