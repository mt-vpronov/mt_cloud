# mt_cloud

deploy steps:
1. git pull
2. Если удалена база:
    docker exec -ti mt_cloud_db mysql -p
    # create database mt_cloud
    docker exec -ti mt_cloud_web sh
    # python manage.py migrate
