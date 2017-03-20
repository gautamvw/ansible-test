# ansible-test
ansible playbook to install and run tomcat on non-default port

Main Components:
  Docker: The docker image will be created using the Dockerfile present in the repo.
          The initial docker image will be pulled from the repo 'gautamvw/ubuntu-ansible'. Base image has ansible, git, tomcat7
          installed from the repository.
          The build will fetch the Ansible playbooks from the GIT repo then call them with the inventory set to 'localhost'.
          
  Git:  All Ansible playbooks are checked into a 'public' GIT repo
  
  Ansible:  Ansible playbook deploys template files for Tomcat7 configuration like server.xml and tomcat-users.xml. Port number,
            admin username and admin password are variable declarations. The variables are defined in the site.yml, but can be
            passed to it from the 'ansible-playbook' call in the Dockerfile which will override site.yml entries.
            
P.S.: When ansible tries to start the tomcat service, it fails since the exit status of the command in non-zero. This is because the docker container during the build process is created with non-elevated privileges. Inspite of the error, tomcat runs fine on the container, hence ignoring the error for now.
When manually launching a container from this image, you can run it with '--cap-add SYS_PTRACE' flag:
e.g.: docker run --cap-add SYS_PTRACE -dit -p 45002:8080 image_id_or_name
