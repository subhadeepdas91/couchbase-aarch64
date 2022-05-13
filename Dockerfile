FROM amazonlinux:2
RUN yum -y install wget shadow-utils ncurses-compat-libs tar
RUN wget -cv https://packages.couchbase.com/releases/7.1.0/couchbase-server-enterprise-7.1.0-amzn2.aarch64.rpm && \
    rpm -i couchbase-server-enterprise-7.1.0-amzn2.aarch64.rpm && \
    rm couchbase-server-enterprise-7.1.0-amzn2.aarch64.rpm

WORKDIR /opt/couchbase/var/lib/couchbase
VOLUME [ "/opt/couchbase/var/lib/couchbase/data" ]
EXPOSE 8091-8094
EXPOSE 11210
ENTRYPOINT ["/opt/couchbase/bin/couchbase-server"]
CMD ["--", "-noinput"]