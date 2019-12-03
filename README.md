# cloud-platform-myruby-app

## 

## Build the docker image

###  Using this guide <a id="using-this-guide"></a>

\`cd cloud-platform-myruby-app

To the left, you will see the top-level navigation items.

docker build -t myruby-app .\`

* **Concepts**: High-level articles, e.g. “What is Kubernetes?”
* **Tasks**: Articles covering specific “how to” topics, e.g. “How to deploy an application”
* **Reference**: Information such as Cloud Platform processes, and links to external documentation resources
* **Getting Help**: How to get help if you can’t find what you need in this guide

## Deploy the docker image locally

Click these to expand the corresponding section of the guide.

`docker run -d --name myruby-app-deploy -p 4567:4567 myruby-app`

Currently, the vast majority of the information in the guide is in the “Tasks” section.

-d run the docker image at the background

--name Set a name for the container instead of a random name

-p publish a container port to the host

You will see the app running on [http://localhost:4567](http://localhost:4567)

## Execute into the container

\`docker container exec -it myruby-app-deploy sh

Will execute into the container and run shell

## See the docker logs

`docker container logs myruby-app-deploy`

`[2019-10-24 16:21:44] INFO WEBrick 1.4.2 [2019-10-24 16:21:44] INFO ruby 2.5.7 (2019-10-01) [x86_64-linux-musl] == Sinatra (v2.0.5) has taken the stage on 4567 for development with backup from WEBrick [2019-10-24 16:21:44] INFO WEBrick::HTTPServer#start: pid=1 port=4567 172.17.0.1 - - [24/Oct/2019:16:21:54 +0000] "GET / HTTP/1.1" 200 40 0.0042 172.17.0.1 - - [24/Oct/2019:16:21:54 UTC] "GET / HTTP/1.1" 200 40`

