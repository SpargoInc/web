FROM "centos:latest"

# Install Apache HTTPD
RUN yum -y install httpd; yum clean all; systemctl enable httpd.service

# Copy Apache configuration file
COPY ./apache/conf/httpd.conf /etc/httpd/conf/httpd.conf

# Copy www directory
#COPY ./apache/www /spargo/www
COPY ./apache/www /var/www/html

# Copy scripts
COPY --chown=1001 ./scripts /spargo

EXPOSE 80

WORKDIR /var/www/html

# ENTRYPOINT ["/spargo/app_entrypoint.sh"]
CMD ["/spargo/run.sh"]
