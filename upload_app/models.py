from django.db import models
from django.utils import timezone as tz


def next_day_dt(n=3):
    return tz.localtime(tz.now()) + tz.timedelta(days=n)


class Document(models.Model):
    id = models.AutoField(primary_key=True)
    docfile = models.FileField(upload_to='documents/%Y/%m/%d')
    delete_at = models.DateTimeField(default=next_day_dt, db_index=True)
