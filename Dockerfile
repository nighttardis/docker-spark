FROM openjdk:14-alpine

RUN apk --update --no-cache add wget tar bash python3 gcc python3-dev musl-dev && \
 wget http://mirror.olnevhost.net/pub/apache/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz && \
 tar -xzf spark-2.4.4-bin-hadoop2.7.tgz && \
 mv spark-2.4.4-bin-hadoop2.7 /spark && \
 rm spark-2.4.4-bin-hadoop2.7.tgz && \
 if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi && \
 python3 -m ensurepip && \
 rm -r /usr/lib/python*/ensurepip && \
 pip3 install --no-cache --upgrade pip setuptools wheel pyspark numpy && \
 if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi

COPY scripts/* /
RUN chmod +x /start-master.sh && chmod +x /start-worker.sh