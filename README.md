# pgsql-restore-ready-image
PostgreSQL restore Image, It will restore backup file as part of image build image, so you can quickly start your DB. 

Is intended to use as 'dev' postgres file not production. [restore-not-run.sh](restore-not-run.sh) was extracted from [postgres official repository](https://github.com/docker-library/postgres/blob/master/docker-entrypoint.sh).

# See
its base on https://medium.com/@diego.hordi/postgresql-restore-ready-docker-image-7001a54400e9

# Build
```
docker build -t <image-name:tag-name> . --build-arg FILE=<backup-file-name> --build-arg DBNAME=<database-name> --build-arg POSTGRES_PASSWORD=<postgres-password>
```

# Run 
```
docker run -d --name <container-name> -p 5432:5432 <image-name:tag-name>
```
