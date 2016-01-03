haproxy-mtail
-------------

Docker-compose project for iterating on a [google/mtail](http://github.com/google/mtail) configuration for HAProxy.

## example

create and parse sample logs:

```
docker-compose up
curl -i http://${DOCKER_IP}:8080/
```

mtail has several metrics endpoints:

```
curl -i http://${DOCKER_IP}:3903/json
curl -i http://${DOCKER_IP}:3903/varz
curl -i http://${DOCKER_IP}:3903/metrics
```

query the a prometheus monitor:

```
open "http://${DOCKER_IP}:9090/graph#%5B%7B%22range_input%22%3A%2230m%22%2C%22end_input%22%3A%22%22%2C%22step_input%22%3A%22%22%2C%22stacked%22%3A%22%22%2C%22expr%22%3A%22rate(haproxy_backend_http_response_wait_milliseconds_sum%7Bbackend%3D~%5C%22webapp%5C%22%7D%5B1m%5D)%20%2F%20rate(haproxy_backend_response_count%7Bbackend%3D~%5C%22webapp%5C%22%7D%5B1m%5D)%22%2C%22tab%22%3A0%7D%5D"
```

## one-shot

run mtail directly against sample logs:

```
docker run --rm -v $(pwd):/etc/mtail -v $(pwd)/logs:/var/log dylanmei/mtail \
  -progs /etc/mtail \
  -logs /var/log/haproxy.log \
  -one_shot -one_shot_metrics \
  -v 3 -alsologtostderr
```

