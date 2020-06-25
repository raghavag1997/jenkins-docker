FROM centos
RUN yum install -y wget && \
    yum install -y net-tools && \
    yum install -y java-11-openjdk.x86_64 && \
    wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo && \
    rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key && \
    yum install -y jenkins && \
    yum install -y git 
COPY docker.repo /etc/yum.repos.d/
RUN yum install -y docker-ce --nobest
ENTRYPOINT ["java","-jar","/usr/lib/jenkins/jenkins.war"] 
