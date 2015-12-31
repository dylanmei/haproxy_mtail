haproxy-mtail
-------------

Docker-compose project for iterating on a [google/mtail](http://github.com/google/mtail) configuration for HAProxy.

## example

create and parse sample logs...

```
docker-compose up
curl -i http://${DOCKER_IP}:8080/
curl -i http://${DOCKER_IP}:3903/json
```

or run mtail directly against sample logs...

```
docker run --rm -v $(pwd):/etc/mtail -v $(pwd)/logs:/var/log dylanmei/mtail \
  -progs /etc/mtail \
  -logs /var/log/haproxy.log \
  -one_shot -one_shot_metrics \
  -v 3 -alsologtostderr
```
