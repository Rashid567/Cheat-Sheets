FROM debian:11.5

RUN apt-get update \
    && apt-get install -y \
      init=1.60 \
      systemd=247.3-7+deb11u1 \
      glusterfs-server=9.2-1 \
    && apt-get clean all

# Back up the default/base configuration. The target directories get
# overwritten with the directories from the host which are initially
# empty.
RUN mkdir -p /etc/glusterfs_bkp /var/lib/glusterd_bkp && \
    cp -r /etc/glusterfs/* /etc/glusterfs_bkp && \
    cp -r /var/lib/glusterd/* /var/lib/glusterd_bkp


COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh  \
    && mkdir -p /data/glusterfs

EXPOSE 24007

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/sbin/init"]
