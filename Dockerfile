FROM python:3.9-alpine3.14

RUN apk update &&\
    apk add python3-dev mariadb-dev mariadb-connector-c-dev build-base

# RUN apk add --no-cache --virtual .build-deps py-pip musl-dev gcc

WORKDIR /app
COPY files files/
COPY manage.py requirements.txt ./
COPY mt_cloud mt_cloud/
COPY templates templates/
RUN pip install -r requirements.txt &&\
    apk add mariadb-client
    # apk del python3-dev mariadb-dev build-base &&\

# Now copy in our code, and run it
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
