#!/bin/bash

# wait for staring dnsmasq
while :
do
  NAMESERVER_STATUS=$(service dnsmasq status)
  if [[ $NAMESERVER_STATUS =~ "running" ]]; then
    break
  else
    sleep 1
  fi
done
sleep 1

# refs: http://docs.hortonworks.com/HDPDocuments/Ambari-1.7.0.0/AMBARI_DOC_SUITE/index.html#Item11.2
if [ ${AMBARI_SERVER_IP} ]; then
  AMBARI_SERVER_HOSTNAME=$(host $AMBARI_SERVER_IP | cut -d' ' -f 5 | head -c -2)
  sed -i s/^.*hostname=.*/hostname=$AMBARI_SERVER_HOSTNAME/g /etc/ambari-agent/conf/ambari-agent.ini   
  exec ambari-agent restart
else
  exit 1
fi
