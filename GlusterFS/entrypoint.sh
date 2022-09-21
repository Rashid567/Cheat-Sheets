#!/bin/bash

if [ -z "$(ls -A /path/to/dir)" ]; then
  echo "Volume initialization..."
  cp -r /etc/glusterfs_bkp/* /etc/glusterfs/
  cp -r /var/lib/glusterd_bkp/* /var/lib/glusterd/
  echo "Volume initialization -- COMPLETED"
fi


systemctl enable glusterd

# Hand off to CMD
exec "$@"
