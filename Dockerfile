### download vanilla ubuntu image
FROM ubuntu

### Update apt-get
RUN apt-get -y update

### Install ansible, tomcat and git
RUN apt-get install -y tomcat7 tomcat7-admin git ansible

### Clone repo
RUN git clone https://gautamvw:3cc2bd2c4ad5a08fe393a28242607e76c4cdf97c@github.com/gautamvw/ansible-test.git /tmp/ansible

### Set variables for ansible
#ENV PATH /tmp/ansible/bin:/sbin:/usr/sbin:/usr/bin
#ENV ANSIBLE_LIBRARY /tmp/ansible/library
#ENV PYTHONPATH /tmp/ansible/lib:$PYTHON_PATH

### add playbooks to the image. This might be a git repo instead
#ADD playbooks/ /etc/ansible/
#ADD inventory /etc/ansible/hosts
#WORKDIR /etc/ansible

### Run ansible using the site.yml playbook 
WORKDIR /tmp/ansible
RUN ansible-playbook /tmp/ansible/site.yml -c local
EXPOSE 22 8080