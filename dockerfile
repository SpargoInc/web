FROM "centos:latest"

# Install Apache HTTPD
RUN yum -y install httpd; yum clean all; systemctl enable httpd.service

# Copy Apache configuration file
COPY ./apache/conf/httpd.conf /etc/httpd/conf/httpd.conf

# Copy www directory
#COPY ./apache/www /spargo/www
COPY ./apache/www /var/www/html

# Copy scripts
COPY ./app_entrypoint.sh /
COPY ./run.sh /

EXPOSE 80

WORKDIR /var/www/html

# ENTRYPOINT ["/app_entrypoint.sh"]
CMD ["/run.sh"]
