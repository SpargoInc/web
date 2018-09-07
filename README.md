# Web
Docker container with CentOS 7 and Apache.

## Get this image
Pull the image from [Docker Hub](https://hub.docker.com/r/spargo/web/)

`docker pull spargo/web:latest`

## Hosting a static site
The image can host static content mounted to `/var/www/html`. 

`docker run -p 80:80 -d --name spargo_web -v /local/path:/var/www/html spargo/web:latest`