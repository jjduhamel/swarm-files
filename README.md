# Swarm Files

This is a collection of docker services that have been useful at some point.

You can deploy the services like this:

```bash
$ docker -H <url> stack deploy -c <service>/docker-compose.yml <service>
```

* ''apache'' Simple Apache server.
* ''elk'' Elasticsearch db with Kibana frontend.
