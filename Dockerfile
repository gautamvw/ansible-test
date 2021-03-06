### download vanilla ubuntu image
FROM gautamvw/ubuntu-ansible:ansible-tomcat

### Clone repo
RUN git clone https://github.com/gautamvw/ansible-test.git /tmp/ansible

### Set variables for ansible
#ENV PATH /tmp/ansible/bin:/sbin:/usr/sbin:/usr/bin

### Run ansible using the site.yml playbook 
WORKDIR /tmp/ansible
RUN ansible-playbook /tmp/ansible/site.yml -c local
EXPOSE 22 8080