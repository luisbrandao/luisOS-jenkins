FROM luisos:latest
MAINTAINER Luis Alexandre Deschamps Brandão

RUN rpm -Uvh https://rpm.nodesource.com/pub_8.x/el/7/x86_64/nodesource-release-el7-1.noarch.rpm && \
    wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo && \
    yum install -y java-1.8.0-openjdk jenkins git initscripts && \
    yum clean all && rm -rf /var/cache/yum

RUN systemctl enable jenkins.service

EXPOSE 8080
EXPOSE 22
CMD ["/usr/sbin/init"]
