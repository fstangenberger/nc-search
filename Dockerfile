FROM docker.elastic.co/elasticsearch/elasticsearch:7.4.2

#https://www.elastic.co/guide/en/elasticsearch/plugins/current/ingest-attachment.html
RUN bin/elasticsearch-plugin install ingest-attachment

# remove x-pack because of license problems spamming log file with massive amounts of errors
RUN bin/elasticsearch-plugin remove x-pack --purge \
    &&  sed -i 's/^xpack/#xpack/' config/elasticsearch.yml
