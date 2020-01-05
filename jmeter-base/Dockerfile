FROM ubuntu:17.10
LABEL Description="This image is used to start the Apache JMeter Master Executable" Vendor="Collabnix" Version="1.0"
# Installig Pre-requisite Packages like wget & JRE
# COPY resources/sources.list /etc/apt/sources.list
RUN apt-get clean && \
    apt-get update && \
    apt-get -qy install \
        wget \
        default-jre-headless \
        telnet \
        iputils-ping \
        tzdata \
        locales \
        unzip \
        curl \
        python-pip \
        zip

RUN pip install python-swiftclient

# Installing jmeter
RUN  mkdir /jmeter
COPY resources/apache-jmeter-3.1.tgz /jmeter
RUN cd /jmeter && tar -xzf apache-jmeter-3.1.tgz && rm apache-jmeter-3.1.tgz
RUN mkdir /jmeter-plugins

COPY resources/JMeterPlugins-Standard-1.3.1.zip \
     resources/JMeterPlugins-Extras-1.3.1.zip \
     resources/JMeterPlugins-ExtrasLibs-1.3.1.zip \
     /jmeter-plugins/

RUN cd /jmeter-plugins && \
    unzip -o JMeterPlugins-Standard-1.3.1.zip -d /jmeter/apache-jmeter-3.1/ && \
    unzip -o JMeterPlugins-Extras-1.3.1.zip -d /jmeter/apache-jmeter-3.1/ && \
    unzip -o JMeterPlugins-ExtrasLibs-1.3.1.zip -d /jmeter/apache-jmeter-3.1/ && \
    rm -rf /jmeter-plugins

# Settingt Jmeter Home
ENV JMETER_HOME /jmeter/apache-jmeter-3.1/
# Timezone
RUN rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
# locale
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF8
RUN echo "export LANG=en_US.UTF8" >> /etc/profile
# Finally Adding Jmeter to the Path
ENV PATH $JMETER_HOME/bin:$PATH
