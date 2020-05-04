FROM jenkins/jenkins:lts

ENV CASC_JENKINS_CONFIG=/usr/share/jenkins/casc_configs
COPY --chown=jenkins:jenkins "jenkins_casc.yml" "${CASC_JENKINS_CONFIG}/jenkins.yaml"

COPY --chown=jenkins:jenkins "plugins.txt" "/usr/share/jenkins/plugins.txt"

USER root

RUN apt-get update \
      && apt-get install -y sudo \
      && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

RUN chown -R jenkins /var/jenkins_home
USER jenkins:jenkins

COPY . /home/cookingwebapp

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt
