FROM mtangaro/docker-galaxy

MAINTAINER ma.tangaro@ibbe.cnr.it

ENV container docker

COPY ["playbook.yaml","/"]

RUN echo "localhost" > /etc/ansible/hosts

RUN ansible-playbook /playbook.yaml

EXPOSE 21 22 80

CMD /etc/init.d/vmcontext start; /usr/bin/galaxy-startup; /usr/sbin/sshd -D
