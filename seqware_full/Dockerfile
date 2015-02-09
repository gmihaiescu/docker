# SeqWare 
#
# VERSION               1.1.0-alpha.6 
#
# Setup prerequities to run seqware-bag in order to setup SeqWare 

FROM ubuntu:12.04
MAINTAINER Denis Yuen <denis.yuen@oicr.on.ca>

# use ansible to create our dockerfile, see http://www.ansible.com/2014/02/12/installing-and-building-docker-with-ansible
RUN apt-get -y update ;\
    apt-get install -y python-yaml python-jinja2 git wget;\
    git clone http://github.com/ansible/ansible.git /tmp/ansible
WORKDIR /tmp/ansible
# get a specific version of ansible , add sudo to seqware, create a working directory
RUN git checkout v1.6.10 ;
ENV PATH /tmp/ansible/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV ANSIBLE_LIBRARY /tmp/ansible/library
ENV PYTHONPATH /tmp/ansible/lib:$PYTHON_PATH
# setup seqware 
WORKDIR /root 
RUN git clone https://github.com/SeqWare/seqware-bag.git
ADD inventory /etc/ansible/hosts
WORKDIR /root/seqware-bag 
RUN git checkout 807cbd968c39a1c151e6890ac2d47c9b872a5e21
ENV HOSTNAME master
# continue with the readme run ansible and create an image
