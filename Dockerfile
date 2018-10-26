FROM "centos:latest"

# Install Apache HTTPD
RUN yum -y install httpd; yum clean all; systemctl enable httpd.service

# Copy Apache configuration file
COPY ./httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf
COPY ./httpd/conf.d/spargo_*.conf /etc/httpd/conf.d/

# Copy www directory
COPY ./httpd/www /spargo/www

# Copy scripts
COPY ./scripts/run.sh /spargo/run.sh
RUN chmod 555 /spargo/run.sh

WORKDIR /spargo/www
EXPOSE 80

ENTRYPOINT ["/spargo/run.sh"]