FROM postgres:latest
ARG FILE
ARG DBNAME
ARG POSTGRES_PASSWORD=postgres
ENV FILE ${FILE}
ENV DBNAME ${DBNAME}
ENV POSTGRES_PASSWORD ${POSTGRES_PASSWORD}
VOLUME /tmp

COPY ${FILE} /tmp/${FILE}

COPY restore_database.sh /docker-entrypoint-initdb.d/restore_database.sh
RUN sed -i 's/\r$//g' /docker-entrypoint-initdb.d/restore_database.sh
RUN chmod 777 /docker-entrypoint-initdb.d/restore_database.sh

COPY restore-not-run.sh /restore-not-run.sh
RUN chmod 777 /restore-not-run.sh

RUN /bin/bash /restore-not-run.sh postgres

EXPOSE 5432
