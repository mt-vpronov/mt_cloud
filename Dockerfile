FROM mt_cloud_web_base:202202211354

WORKDIR /app
COPY upload_app upload_app/
COPY static static/
COPY manage.py ./
COPY mt_cloud mt_cloud/
# COPY templates templates/
RUN pip install -r requirements.txt &&\
    apk add mariadb-client

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
