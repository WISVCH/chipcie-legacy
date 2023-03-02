FROM wisvch/nginx
# Change the config file to serve index for urls
USER root
RUN sed -i -r '/server \{.*/a\    absolute_redirect off;' /etc/nginx/conf.d/default.conf
RUN sed -i -r 's/server_name.*/server_name  "~^(?<year>\\d{4})\\.(?<domain>.+)$";/g' /etc/nginx/conf.d/default.conf
RUN sed -i -r '1,/root   \/srv;/s//root   \/srv\/$year;/' /etc/nginx/conf.d/default.conf
USER 100
COPY 2001.bapc.eu /srv/2001
COPY 2002.nwerc.eu /srv/2002
COPY 2005.bapc.eu /srv/2005
COPY 2008.bapc.eu /srv/2008
COPY 2012.nwerc.eu /srv/2012
COPY 2013.nwerc.eu /srv/2013
COPY 2016.bapc.eu /srv/2016
