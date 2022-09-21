## GlusterFS

### Volumes Creation
Enter in GlusterFS container
```
docker exec -ti glusterfs bash
```

Crete Volume
```
gluster volume create "${VOLUME_NAME}" "${HOST}":/data/glusterfs/"${VOLUME_NAME}"
```

Start Volume
```
gluster volume start "${VOLUME_NAME}"
```

Disable ctime param. Python GfAPI doesn't work with this param.
Do it for each volume!!!
```
gluster volume set "${VOLUME_NAME}" ctime off
```

GlusterFS must have access to all files in volume dir
otherwise "Permission error" occurs
```
sudo chown -R 1000:1000 /opt/docker/gluster/data
```


### Debug
``` 
gluster volume status
```

```
gluster volume info
```

```
systemctl status glusterd.service
```

```
systemctl start glusterd.service
```


### Connect to volume from local PC

Install glusterfs-client
```
apt update && apt -y install glusterfs-client
```

Mount
```
sudo mount -t glusterfs "${HOST}:/${VOLUME_NAME}" "${MOUNT_PATH}"
```

UnMount
```
sudo umount "${MOUNT_PATH}"
```
