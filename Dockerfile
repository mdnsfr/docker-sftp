FROM ubuntu

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install openssh-server -y \
  && apt-get clean \
  && /bin/rm -v /etc/ssh/ssh_host_* \
  && mkdir /var/run/sshd
COPY sftp.sh /sftp.sh
COPY sshd_config /etc/ssh/
CMD /sftp.sh
