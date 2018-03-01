FROM shaoguangleo/ubuntu-tempo:latest
MAINTAINER [Guo Shaoguang] <sgguo@shao.ac.cn>

LABEL version="0.1"
LABEL description="Ubuntu Pulsar Image"

COPY src/presto_v2.1.tar.gz /usr/local/presto/
COPY src/presto_v2.1.tar.gz /tmp/

WORKDIR /usr/local/

RUN cd /tmp/\
    && cd /usr/local/presto/ \
    && tar zxvf presto_v2.1.tar.gz \
    && export PRESTO=/usr/local/presto \
    && echo "export PRESTO=/usr/local/presto" >> ~/.bashrc \
    && echo "export PATH=$PATH:/usr/local/presto/bin" >> ~/.bashrc \
    && echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/presto/lib" >> ~/.bashrc \
    && cd presto/src \
    && make makewisdom \
    && make prep \
    && make \
    && make mpi \
    && make clean \
    && rm -rf /tmp/*tar.gz /usr/local/presto/*.tar.gz
