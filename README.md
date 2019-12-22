# README

## Running

```
make
```

## Docker

```
docker-compose build
docker-compose up
```

This fires up `web` (rails server) dependent on `database` and
`webpack_dev_server`. `web` talks to `database` on the `back` internal
network. `web` is also exposed on the `web` bridge accessible by other
docker-compose as the external network `real-code-submission-blog_web`.
This is what is being used by the docker-compose in the
https://github.com/saramic/real-code-challenge-blog project.

**Note:** the `webpack_dev_server` container is currently running
`webpack` as otherwise the fingerprint on packs does not match up.
