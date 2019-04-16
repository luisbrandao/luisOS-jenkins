FROM registry.techsytes.com/luisos:latest
MAINTAINER Luis Alexandre Deschamps Brandão

RUN rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key && \
    yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && \
    yum-config-manager --add-repo https://pkg.jenkins.io/redhat-stable/jenkins.repo && \
    yum install -y graphviz java-1.8.0-openjdk jenkins git initscripts make docker-ce-cli && \
    yum clean all && rm -rf /var/cache/yum

#RUN sed -i "s|JENKINS_ARGS=\"\"|JENKINS_ARGS=\"--prefix=/jenkins\"|g" /etc/sysconfig/jenkins

RUN systemctl enable jenkins.service

EXPOSE 8080
CMD ["/usr/sbin/init"]
