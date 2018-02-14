FROM php:5.6

RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN cd /opt && \
    git clone https://github.com/brendangregg/FlameGraph.git && \
    ls FlameGraph && \
    ln -s /opt/FlameGraph/flamegraph.pl /usr/local/bin/flamegraph.pl && \
    chmod u+x /usr/local/bin/flamegraph.pl

ADD flamegraph.sh /opt
ADD xhprof-sample-to-flamegraph-stacks /opt

ENTRYPOINT ["/opt/flamegraph.sh"]
