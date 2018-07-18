FROM jenkins:latest
USER root
RUN yum update && yum install -y sudo git supervisor
RUN curl -sSL https://get.docker.com/ | sh
# Make sure jenkins user has docker privileges
RUN usermod -aG docker jenkins
FROM tomcat:8
# Take the war and copy to webapps of tomcat
COPY target/*.war /usr/local/tomcat/webapps/
