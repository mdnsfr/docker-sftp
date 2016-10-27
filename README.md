# docker-sftp
Simple quick SFTP docker image for ephemeral access

## Configuration

The configuration is done via ENV variables

- USERNAME : account login (default="sftp")
- PASSWORD : account password (default is no password)
- USERID : posix uid (default=1000)
- GROUPID : posix gid (default=1000)
- USERDIR : account home directory (default=/data)

## Usage

If you want to get an SFTP access to an existing volume /srv/code in dock "mydock", you should use following command:

```
docker run -it --rm -e "USERDIR=/srv/code" --volume-from mydock mdns/sftp
```

Here is an example with all options :

```
docker run -it --rm \
  -e "USERNAME=mylogin" \
  -e "PASSWORD=kadl3okZ9JEjez" \
  -e "USERID=1005" \
  -e "GROUPID=1020" \
  -e "USERDIR=/mnt" \
  mdns/sftp
```
