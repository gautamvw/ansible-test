### download vanilla ubuntu image
#FROM ubuntu
FROM gautamvw/ubuntu-ansible:ansible-tomcat

### Update apt-get
RUN apt-get -y update

### Install ansible, tomcat and git
#RUN apt-get install -y tomcat7 tomcat7-admin git ansible

### Clone repo
#ARG CACHE_DATE=2016-01-01
RUN git clone https://github.com/gautamvw/ansible-test.git /tmp/ansible

### Set variables for ansible
#ENV PATH /tmp/ansible/bin:/sbin:/usr/sbin:/usr/bin
#ENV ANSIBLE_LIBRARY /tmp/ansible/library
#ENV PYTHONPATH /tmp/ansible/lib:$PYTHON_PATH

### add playbooks to the image. This might be a git repo instead
#ADD inventory /etc/ansible/hosts
#WORKDIR /etc/ansible

### Run ansible using the site.yml playbook 
#ADD playbooks/ /tmp/ansible/
WORKDIR /tmp/ansible
RUN ansible-playbook /tmp/ansible/site.yml -c local
EXPOSE 22 8080