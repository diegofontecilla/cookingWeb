FROM jenkins/jenkins:lts

ENV CASC_JENKINS_CONFIG=/usr/share/jenkins/casc_configs
COPY --chown=jenkins:jenkins "jenkins_casc.yml" "${CASC_JENKINS_CONFIG}/jenkins.yaml"

COPY --chown=jenkins:jenkins "plugins.txt" "/usr/share/jenkins/plugins.txt"

USER root

RUN apt-get update \
      && apt-get install -y sudo \
      && rm -rf /var/lib/apt/lists/*
RUN apt-get -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get update
RUN apt-get -y install docker-ce
RUN docker run hello-world
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

RUN chown -R jenkins /var/jenkins_home
USER jenkins:jenkins

COPY . /home/cookingwebapp

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt
