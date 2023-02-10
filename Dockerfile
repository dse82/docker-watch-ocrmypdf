FROM jbarlow83/ocrmypdf:latest

RUN apt-get update && \
    apt-get install inotify-tools curl unzip man-db -y && \
    apt-get clean  && rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

RUN curl https://rclone.org/install.sh | bash

COPY ./watch.sh /
RUN chmod +x /watch.sh
ENTRYPOINT [ "/watch.sh" ]
