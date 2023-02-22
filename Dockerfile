FROM docker.io/library/amazonlinux:2

# Install Python 3.11
# Adapted from https://devopsmania.com/how-to-install-python3-on-amazon-linux-2/

RUN yum update -y
RUN yum groupinstall "Development Tools" -y
RUN yum install openssl-devel libffi-devel bzip2-devel wget -y
RUN wget https://www.python.org/ftp/python/3.11.2/Python-3.11.2.tgz
RUN tar xzf Python-3.11.2.tgz && cd Python-3.11.2
RUN ./configure --enable-optimizations
RUN nproc && make -j $(nproc)
RUN sudo make altinstall

