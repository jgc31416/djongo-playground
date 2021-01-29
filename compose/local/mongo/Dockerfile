from mongo:latest
RUN apt update &&\
    apt install -y wget unzip
RUN wget -q https://github.com/huynhsamha/quick-mongo-atlas-datasets/archive/master.zip &&\
    unzip master.zip

COPY ./compose/local/mongo/start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh
ENTRYPOINT ["start.sh"]
