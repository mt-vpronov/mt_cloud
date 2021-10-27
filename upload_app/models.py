from django.db import models
from datetime import datetime, timedelta


def default_delete_at():
    return datetime.now() + timedelta(days=3)


class Document(models.Model):
    id = models.AutoField(primary_key=True)
    docfile = models.FileField(upload_to='documents/%Y/%m/%d')
    delete_at = models.DateTimeField(default=default_delete_at, db_index=True)