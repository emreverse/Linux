#!/bin/bash

LOG_FILE=/opt/es_restart.log

e=
for (( i = 5; i >= 0; i-- )) ; do
    e='-e /'`date +\%R -d "-$i min"`'/p '$e
done
$(sed -n $e /var/log/elasticsearch/name.log | grep "primary shard is not active" > /opt/newfile)

value= cat /opt/newfile | wc -l
echo $value

###testing###
if [ $(cat /opt/newfile | wc -l) -gt 0 ]; then
	curl -X POST "http://MASTER_IP:9200/_cluster/reroute?retry_failed=true"
        echo -e "$(date -u)\t\t value $value is greather than zero, running proper command" >> $LOG_FILE
elif [ $(cat /opt/newfile | wc -l) -eq 0 ]; then
        echo -e "$(date -u)\t\t value $value is null, no need to restart servis" >> $LOG_FILE
else
        echo -e "$(date -u)\t\t an error ocurred while processing" >> $LOG_FILE
fi
###end of testing
