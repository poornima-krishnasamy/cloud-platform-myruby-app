# cloud-platform-myruby-app

## Build the docker image

`cd cloud-platform-myruby-app

docker build -t myruby-app .`

## Deploy the docker image locally

`docker run -d --name myruby-app-deploy -p 4567:4567 myruby-app`

-d run the docker image at the background

--name Set a name for the container instead of a random name

-p publish a container port to the host

You will see the app running on http://localhost:4567

## Execute into the container

`docker container exec -it myruby-app-deploy sh

Will execute into the container and run shell

## See the docker logs

`docker container logs myruby-app-deploy`

`[2019-10-24 16:21:44] INFO  WEBrick 1.4.2
[2019-10-24 16:21:44] INFO  ruby 2.5.7 (2019-10-01) [x86_64-linux-musl]
== Sinatra (v2.0.5) has taken the stage on 4567 for development with backup from WEBrick
[2019-10-24 16:21:44] INFO  WEBrick::HTTPServer#start: pid=1 port=4567
172.17.0.1 - - [24/Oct/2019:16:21:54 +0000] "GET / HTTP/1.1" 200 40 0.0042
172.17.0.1 - - [24/Oct/2019:16:21:54 UTC] "GET / HTTP/1.1" 200 40`




