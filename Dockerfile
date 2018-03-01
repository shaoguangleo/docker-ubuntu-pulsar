FROM shaoguangleo/ubuntu-pgplot:latest
MAINTAINER [Guo Shaoguang] <sgguo@shao.ac.cn>

LABEL version="0.1"
LABEL description="Ubuntu Pulsar Image"

COPY src/tempo-2017.07.29.tar.gz /tmp/
COPY src/fftw-3.3.3.tar.gz /tmp/

WORKDIR /usr/local/

RUN cd /tmp/\
    && tar zxvf tempo-2017.07.29.tar.gz \
    && cd /tmp/tempo \
    && ./prepare  \
    && ./configure --prefix=/usr/local/tempo \
    && make  \
    && make install \
    && cp -rv clock ephem tzpar util /usr/local/tempo \
    && cp tempo.hlp /usr/local/tempo \
    && cp obsys.dat /usr/local/tempo \
    && echo "export PATH=$PATH:/usr/local/tempo/bin" >> ~/.bashrc \
    && echo "export TEMPO=/usr/local/tempo" >> ~/.bashrc \
    && echo "export CLKDIR=/usr/local/tempo/clock" >> ~/.bashrc \
    && echo "export PARDIR=/usr/local/tempo/tzpar" >> ~/.bashrc \
    && echo "export EPHDIR=/usr/local/tempo/ephem" >> ~/.bashrc \
    && echo "export OBSYS=/usr/local/tempo/obsys.dat" >> ~/.bashrc \
    && cd /tmp \
    && tar zxvf fftw-3.3.3.tar.gz \
    && cd /tmp/fftw-3.3.3 \
    && ./configure --enable-shared --enable-threads --enable-float\
    && make -j 2\
    && make install\
    && make clean\
    && ./configure --enable-shared --enable-threads --enable-long-double\
    && make -j 4\
    && make install\
    && make clean\
    && ./configure --enable-sse2\
    && make -j 4\
    && make install\
    && make clean\
    && rm -rf /tmp/*tar.gz
