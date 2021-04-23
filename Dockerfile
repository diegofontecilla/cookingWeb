FROM jenkins/jenkins:lts

ENV CASC_JENKINS_CONFIG=/usr/share/jenkins/casc_configs
COPY --chown=jenkins:jenkins "jenkins_casc.yml" "${CASC_JENKINS_CONFIG}/jenkins.yaml"

COPY --chown=jenkins:jenkins "plugins.txt" "/usr/share/jenkins/plugins.txt"

USER root

RUN apt-get update -qq \
    && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common \
    && apt-get install -y sudo \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
RUN apt-get update  -qq \
    && apt-get install docker-ce=17.12.1~ce-0~debian -y
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

RUN chown -R jenkins /var/jenkins_home
USER jenkins:jenkins

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt

WORKDIR /var/jenkins_home/app
COPY /app /var/jenkins_home/app

