FROM ubuntu:18.04


RUN apt-get update \
    && apt-get install -y \
    mongodb \
    vim \
    --no-install-recommends

RUN apt-get clean \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*

COPY mongodb.conf /etc/mongodb.conf

# Create the MongoDB data directory
RUN mkdir -p /data/db

# Expose port #37017 from the container to the host
EXPOSE 37017

#Start MongoDb
CMD ["mongod", "-f", "/etc/mongodb.conf"]

#attività da eseguire in modalità exec 
# use admin 
# db.createUser(
#     {
#         user: "admin",
#         pwd: "root",
#         roles: [
#           { role: "userAdminAnyDatabase", db: "admin" }
#         ]
#     }
#   )

#autenticazione
#mongo -u root --authenticationDatabase admin -p --port 37017

#creazione utente
# db.createUser(
#     {
#         user: "sstirati",
#         pwd: "root",
#         roles: [
#             { role: "readWrite", db: "ms-users" }
#         ]
#     }
# )