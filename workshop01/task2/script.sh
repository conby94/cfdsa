# create the network 
docker network create mynet

# create vol
docker volume create myvol

# create the database
# do not port bind, use the vol, run inside mynet
docker run -d -v myvol:/var/lib/mysql --network=mynet --name=mydb

# create app
docker run -d -p 8080:3000 \
    -e DB_HOST=mydb \
    -e DB_USER=root \
    -e DB_PASSWORD=changeit \
    --network mynet \
    --name myapp \
    stackupiss/northwind-app:v1
