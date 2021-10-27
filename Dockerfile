FROM python:3.9-alpine3.14

RUN apk update &&\
    apk add python3-dev mariadb-dev mariadb-connector-c-dev build-base

WORKDIR /app
COPY upload_app upload_app/
COPY manage.py requirements.txt ./
COPY mt_cloud mt_cloud/
# COPY templates templates/
RUN pip install -r requirements.txt &&\
    apk add mariadb-client

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
