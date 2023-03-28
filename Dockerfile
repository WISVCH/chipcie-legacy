FROM wisvch/nginx
# Change the config file to serve index for urls
USER root
RUN sed -i -r '/server \{.*/a\    absolute_redirect off;' /etc/nginx/conf.d/default.conf
RUN sed -i -r 's/server_name.*/server_name  "~^(?<year>\\d{4})\\.(?<domain>.+)$";/g' /etc/nginx/conf.d/default.conf
RUN sed -i -r '/index.htm;/a\        location ~ /(home|preliminaries|scoreboard-preliminaries|schedule|system|registration|rules|problems|scoreboard|organisation|contact)$ { if ($year = 2020) { rewrite ^.*$ /index.html last; } }' /etc/nginx/conf.d/default.conf
RUN sed -i -r '1,/root   \/srv;/s//root   \/srv\/$year;/' /etc/nginx/conf.d/default.conf
# Serve sample/code files as plain text, instead of downloading them
RUN sed -i -r '/location \/.*/a\        location ~ \\.(in|out|c|cpp|java|pas|py)$ { types {} default_type text/plain; }' /etc/nginx/conf.d/default.conf
USER 100
COPY --link 2001.bapc.eu /srv/2001
COPY --link 2002.nwerc.eu /srv/2002
COPY --link 2005.bapc.eu /srv/2005
COPY --link 2008.bapc.eu /srv/2008
COPY --link 2012.nwerc.eu /srv/2012
COPY --link 2013.nwerc.eu /srv/2013
COPY --link 2016.bapc.eu /srv/2016
COPY --link 2020.bapc.eu /srv/2020
