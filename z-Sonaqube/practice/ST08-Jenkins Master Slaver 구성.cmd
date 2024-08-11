https://u-it.tistory.com/366

(윈두)
1. jenkins-node1 Docker 서버 실행
    docker run --privileged --name jenkins-node1 -itd -p 30022:22 -e container=docker -v /sys/fs/cgroup:/sys/fs/cgroup --cgroupns=host edowon0623/docker:latest /usr/sbin/init

    1.1 Docker 서버에 JDK 설치
        clear명령
        # yum install -y ncurses git

    1.2 설치 가능한 jdk 검색
    # yum list java*jdk-devel

    1.3 11버전 설치
    # yum install -y java-11-openjdk-devel.x86_64



(jenkins-server로 로그인)
docker exec -it jenkins-server bash

2. 현재 가지고 있는 node1서버의 패스워드 key값 복사
   2.1 jenkins-node1
        ssh-keygen

    2.2 ssh-copy-id root@172.17.0.7
        (윈도우) docker network inspect bridge
        "Containers": {
                "2440ca83c27ce3e839a819d1aeaba3a0dad88a3b8554c5fa54fe2317d38ed692": {
                    "Name": "jenkins-node1",
                    "EndpointID": "635ec732c13149fe5ad84415ee7a755bc502b6446559c49aecf95dc8491058e0",
                    "MacAddress": "02:42:ac:11:00:07",
                    "IPv4Address": "172.17.0.7/16",
                    "IPv6Address": ""
                },

        (jenkins-server 로그인)
        $ ssh-keygen
        Generating public/private rsa key pair.
        Enter file in which to save the key (/var/jenkins_home/.ssh/id_rsa):
        /var/jenkins_home/.ssh/id_rsa already exists.
        Overwrite (y/n)? y
        Enter passphrase (empty for no passphrase):
        Enter same passphrase again:
        Your identification has been saved in /var/jenkins_home/.ssh/id_rsa
        Your public key has been saved in /var/jenkins_home/.ssh/id_rsa.pub
        The key fingerprint is:
        SHA256:wfeBYciJq8fAmBPOT/4cZsEHt7Z1Q2SSaGfv1e7ED6o jenkins@d3f4302cce75
        The key's randomart image is:
        +---[RSA 3072]----+
        |       o ++oo    |
        |  .   o.B.+=.    |
        | o = . =o+oo.  . |
        |  * + + +o..+.. .|
        |   = + +So o.o o |
        |    + * .   . . +|
        |     * .     . +.|
        |      o     .   o|
        |          E.     |
        +----[SHA256]-----+
        $
        $ ssh-copy-id root@172.17.0.7
        /usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/var/jenkins_home/.ssh/id_rsa.pub"
        /usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
        /usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
        root@172.17.0.7's password:

        Number of key(s) added: 1

        Now try logging into the machine, with:   "ssh 'root@172.17.0.7'"
        and check to make sure that only the key(s) you wanted were added.

        $
        $ ssh root@172.17.0.7




3. Jenkins에서 Node 등록
   1. node관리 이동
   Jenkins관리 - Nodes and Clouds

