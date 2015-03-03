# docker-ambari-agent

version 1.7.0

add **privileged** options to slove could not open session in docker container problem

[could not open session in docker container (Centos 6.5) #7040](https://github.com/docker/docker/issues/7040)

    docker run -d -p 2222:22 --privileged --name=my-node01 --hostname=node01.example.local --dns=127.0.0.1 -e SERF_JOIN_IP=<node_IP> -e AMBARI_SERVER_IP=<ambari_server_IP> fayehuang/ambari-agent
