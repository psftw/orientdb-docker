FROM java:7-jre

ENV ORIENTDB_VERSION 2.0.5

RUN curl -sSL -o orientdb.tar.gz "http://www.orientechnologies.com/download.php?email=unknown@unknown.com&file=orientdb-community-$ORIENTDB_VERSION.tar.gz&os=linux" && \
	tar -C /opt -xf orientdb.tar.gz && rm orientdb.tar.gz && \
	ln -s /opt/orientdb-community-$ORIENTDB_VERSION /opt/orientdb && \
	rm -rf /opt/orientdb/databases/*

ADD orientdb-server-config.xml /opt/orientdb/config/orientdb-server-config.xml

EXPOSE 2424
EXPOSE 2480

CMD ["/opt/orientdb/bin/server.sh"]
