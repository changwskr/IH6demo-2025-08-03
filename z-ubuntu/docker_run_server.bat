
docker run --privileged --name docker-server -itd -p 10022:22 -p 8082:8080 -e container=docker -v /sys/fs/cgroup:/sys/fs/cgroup edowon0623/docker:latest /usr/sbin/init
echo "root/P@ssw0rd"