FROM "centos:latest"

# Install Apache HTTPD
RUN yum -y install httpd; yum clean all; systemctl enable httpd.service

# Copy Apache configuration file
COPY ./apache/conf/httpd.conf /etc/httpd/conf/httpd.conf

# Copy www directory
COPY ./apache/www /var/www/html

# Copy scripts
COPY ./scripts/run.sh /spargo/run.sh
RUN chmod 555 /spargo/run.sh

WORKDIR /var/www/html
EXPOSE 80

ENTRYPOINT ["/spargo/run.sh"]