#!/bin/bash

[ ! -e /etc/ssh/ssh_host_rsa_key ] && dpkg-reconfigure openssh-server

[ "$USERNAME" = "" ] && USERNAME=sftp
[ "$USERID" = "" ] && USERID=1000
[ "$GROUPID" = "" ] && GROUPID=1000
[ "$USERDIR" = "" ] && USERDIR=/data

echo "Creating user $USERNAME"
useradd $USERNAME

echo "Checking group $USERNAME"
groupmod -g "$GROUPID" "$USERNAME"

echo "Checking data directory $USERDIR"
[ ! -e "$USERDIR" ] && mkdir -p "$USERDIR" && chown "$USERID":"$GROUPID" "$USERDIR"

echo "Configuring user $USERNAME (uid=$USERID,gid=$GROUPID,dir=$USERDIR)"
usermod -u $USERID -o -g $GROUPID -d $USERDIR $USERNAME

[ "$PASSWORD" != "" ] &&
  echo "Setting $USERNAME password"
  usermod -p $(openssl passwd "$PASSWORD") "$USERNAME"


#internal-sftp

/usr/sbin/sshd -D
