FROM alpine:3.7

ADD lib/musl-nscd /usr/src/musl-nscd
ADD lib/libnss-ato /usr/src/libnss-ato

RUN \
    apk add --no-cache openssh build-base bison flex && \
    ssh-keygen -A && \
    addgroup -g 1000 -S signup && \
    adduser -u 1000 -S signup -G signup -s /usr/local/bin/signup.sh && \
    cd /usr/src/musl-nscd && \
    ./configure && \
    make install && \
    cd /usr/src/libnss-ato && \
    make all && \
    make install && \
    apk del build-base bison flex

ADD usr/local/bin/signup.sh usr/local/bin/
ADD etc/nsswitch.conf /etc/
ADD etc/libnss-ato.conf /etc/
ADD etc/ssh/sshd_config /etc/ssh/
ADD etc/ssh/authorized_keys_command.sh /etc/ssh/

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D", "-f", "/etc/ssh/sshd_config"]
