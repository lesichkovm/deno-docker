# Deno in a Docker Container

Example Deno web server running in a docker container

1. Build image
```
docker build -t deno .
```

2. Run container
```
docker run -d -p 32452:80 --name deno deno
```

3 View:

localhost:32452

4. Inspect
```
docker exec -it deno bash
```
