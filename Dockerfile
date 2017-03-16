### download vanilla ubuntu image
FROM ubuntu

### Update apt-get
RUN apt-get -y update

### Install tomcat and git
RUN apt-get install -y tomcat7 tomcat7-admin git

### Clone repo
RUN git clone http://github.com/ansible/ansible.git /tmp/ansible

### Set variables for ansible
WORKDIR /tmp/ansible
ENV PATH /tmp/ansible/bin:/sbin:/usr/sbin:/usr/bin
ENV ANSIBLE_LIBRARY /tmp/ansible/library
ENV PYTHONPATH /tmp/ansible/lib:$PYTHON_PATH

### add playbooks to the image. This might be a git repo instead
ADD playbooks/ /etc/ansible/
ADD inventory /etc/ansible/hosts
WORKDIR /etc/ansible

### Run ansible using the site.yml playbook 
RUN ansible-playbook /etc/ansible/site.yml -c local
EXPOSE 22 8080