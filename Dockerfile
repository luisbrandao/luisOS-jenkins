FROM registry.techsytes.com/luisos:latest
MAINTAINER Luis Alexandre Deschamps Brandão

RUN rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key && \
    yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && \
    yum-config-manager --add-repo https://pkg.jenkins.io/redhat-stable/jenkins.repo && \
    yum groupinstall -y "Development Tools" && \
    yum install -y sshpass ansible graphviz java-1.8.0-openjdk jenkins git initscripts make docker-ce-cli expect && \
    yum clean all && rm -rf /var/cache/yum

# Set jenkins to run in location (site.com/jenkins)
#RUN sed -i "s|JENKINS_ARGS=\"\"|JENKINS_ARGS=\"--prefix=/jenkins\"|g" /etc/sysconfig/jenkins
# Tell jvm to not sit on unused memory
RUN sed -i "s|JENKINS_JAVA_OPTIONS=\"-Djava.awt.headless=true\"|JENKINS_JAVA_OPTIONS=\"-Djava.awt.headless=true -XX:MinHeapFreeRatio=10 -XX:MaxHeapFreeRatio=20\"|g" /etc/sysconfig/jenkins

RUN systemctl enable jenkins.service

EXPOSE 8080
CMD ["/usr/sbin/init"]
