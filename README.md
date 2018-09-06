# Web
Docker container with CentOS 7 and Apache.

## Get this image
Pull the image from [Docker Hub]()

`docker pull spargo/web:latest`

## Hosting a static site
The image can host static content mounted to `/var/www/html`. 

`docker run -v /local/path:/var/www/html spargo/web:latest`