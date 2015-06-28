ElasticM2M - Tomcat Docker Image
================================

# Supported tags and Dockerfile links

- [`8.0.22`, `8.0`, `latest` (*8.0/Dockerfile*)](https://github.com/elasticm2m/elasticm2m-docker/blob/master/tomcat/8.0/Dockerfile)

For more information about this Docker image, please check the `tomcat` folder in the [`elasticm2m/elasticm2m-docker` GitHub repo](https://github.com/elasticm2m/elasticm2m-docker).

# About this image
This image provides an [Apache Tomcat 8](https://tomcat.apache.org/) installation.  The image is based on [elasticm2m/java](https://registry.hub.docker.com/u/elasticm2m/java/) which provides an Ubuntu and Oracle Java 8 base.  

For security purposes all default web applications located at `$TOMCAT_HOME/webapps` have been removed.

# How to use this image
The Tomcat image by itself does not provide any useful web applications out of the box and is designed to host your custom web applications (WAR).  Two methods are available to get your web applications running with on Tomcat.

## Mounting a volume
The easiest way to integrate your WAR file with this image is to mount a local volume on your host which contains your WAR file.  The example command below shows how to get your application WAR running with this image.

```
docker run -v /path/to/application.war:/opt/tomcat/webapps/ROOT.war \
    -p 8080:8080 elasticm2m/tomcat:latest
```
After running this command you should be able to browse to your web application at `http://server-hostname:8080/` where `server-hostname` is the valid hostname of your application server.

## Extending this image
If you would prefer to distribute your application WAR as an indpendent docker image you can also use the `elasticm2m/tomcat` image as a base in your own `Dockerfile`.  The example `Dockerfile` below demonstrates this usage to package your application in a custom docker image.

```
FROM elasticm2m/tomcat:8
MAINTAINER ElasticM2M <elasticm2m@gmail.com>

WORKDIR $TOMCAT_HOME
COPY path/to/application.war webapps/ROOT.war
```

Extending the elasticm2m/tomcat image allows you to use the default `CMD` which starts the Tomcat container.  You do not need to redefine the `CMD` unless you would like to add some additional logic.  You can build and run your new Docker image using the following commands.  Replace `your-project` and `your-app` with values which are relevant to your project.

```
docker build -t your-project/your-app .
docker run -p 8080:8080 your-project/your-app
```
After running this command you should be able to browse to your web application at `http://server-hostname:8080/` where `server-hostname` is the valid hostname of your application server.
