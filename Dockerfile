FROM docker:dind

RUN apk add --update --upgrade --no-cache \
    bash \
    python3-dev \
    gcc \
    musl-dev \
    linux-headers \
    dynamips \
    ubridge \
    vpcs \
    libvirt-daemon \
    qemu-img \
    qemu-system-x86_64 \
    x11vnc \
    xvfb
    && apk add --no-cache gosu libguestfs --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    && pip3 install --no-cache-dir --upgrade pip \
    && pip3 install --no-cache-dir gns3-server
    
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD /usr/bin/gns3server
