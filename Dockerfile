# ------------------------------------------------------------------------------
# Based on a work at https://github.com/docker/docker & https://github/kdelfour/supervisor-docker
# ------------------------------------------------------------------------------
# Pull base image.
FROM kdelfour/supervisor-docker
MAINTAINER Kevin Delfour <kevin@delfour.eu>

# ------------------------------------------------------------------------------
# Install base
RUN apt-get update
RUN apt-get install -y build-essential g++ curl libssl-dev apache2-utils git libxml2-dev sshfs make autoconf automake libtool gcc g++ gperf flex bison texinfo gawk ncurses-dev libexpat-dev python sed python-serial srecord bc wget llvm libclang1 libclang-dev mc vim

# ------------------------------------------------------------------------------
# Install sshd
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# ------------------------------------------------------------------------------
# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get install -y nodejs
    

# ------------------------------------------------------------------------------
# Install spiffy
WORKDIR /tmp/
RUN wget https://bintray.com/artifact/download/kireevco/generic/spiffy-linux-1.0.1.tar.gz && tar -zxf spiffy-linux-1.0.1.tar.gz && mv spiffy /usr/local/bin/ && chmod +rx /usr/local/bin/spiffy


# ------------------------------------------------------------------------------
# Install esp-open-sdk
WORKDIR /tmp/
RUN mkdir -p /opt/esp-open-sdk
RUN wget https://bintray.com/artifact/download/kireevco/generic/esp-open-sdk-linux-1.0.1.tar.gz && tar -zxf esp-open-sdk-linux-1.0.1.tar.gz -C /opt/esp-open-sdk
RUN chmod +rx /opt/esp-open-sdk/sdk/tools/gen_appbin.py


# ------------------------------------------------------------------------------
# Install Cloud9
RUN git clone https://github.com/c9/core.git /opt/cloud9
WORKDIR /opt/cloud9
RUN scripts/install-sdk.sh

# ------------------------------------------------------------------------------
# Install Additional npm Packages
ENV CXXFLAGS -I/usr/lib/llvm-3.4/include
RUN npm install clang_tool

# Tweak standlone.js conf
RUN sed -i -e 's_127.0.0.1_0.0.0.0_g' /opt/cloud9/configs/standalone.js 

# Add supervisord conf
ADD conf/sming.conf /etc/supervisor/conf.d/
ADD conf/sshd.conf /etc/supervisor/conf.d/

# ------------------------------------------------------------------------------
# Add volumes
RUN mkdir -p /root/workspace
VOLUME /root/workspace

# ------------------------------------------------------------------------------
# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# ------------------------------------------------------------------------------
# Clone Sming Core
RUN git clone https://github.com/anakod/Sming.git /opt/sming

# ------------------------------------------------------------------------------
# Clone Sming Examples
RUN git clone https://github.com/anakod/Sming.git /root/sming-examples




# ------------------------------------------------------------------------------
# Enviromnent settings
ENV ESP_HOME /opt/esp-open-sdk
ENV SMING_HOME /opt/sming/Sming

# ------------------------------------------------------------------------------
# Expose ports.
EXPOSE 22
EXPOSE 80
EXPOSE 3000

# ------------------------------------------------------------------------------
# Start supervisor, define default command.
CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]
