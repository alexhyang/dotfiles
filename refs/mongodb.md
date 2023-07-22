# MongoDB

This document contains notes about setting up and using MongoDB.

Contents:
:InsertToc

## MongoDB concepts in Relational Database terms
| MongoDB    | RDBMS    |
|------------|----------|
| database   | database |
| collection | table    |
| document   | record   |

## Set up MongoDB on local machine
```bash
# prepare
sudo apt install gnupg

# import public key
curl -fsSL https://pgp.mongodb.com/server-6.0.asc |
sudo gpg -o /usr/share/keyrings/mongodb-server-6.0.gpg --dearmor

# create list file for MongoDB
sudo touch /etc/apt/sources.list.d/mongodb-org-6.0.list
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" |
sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

# install MongoDB package and verify installation
sudo apt update; sudo apt install -y mongodb-org; mongod --version; mongosh --version

# create directory to store data
mkdir -p ~/data/db

# run mongo instance
sudo mongd --dbpath ~/data/db

# check mongodb PID
ps -e | grep 'mongod'
```

## Interact with MongoDB server
1.  connect to MongoDB server
    ```bash
    # connect to local default database
    mongosh

    # connect to remote Atlas database
    mongosh "mongodb+srv://<cluster_name>/<db_name>" --apiVersion 1 --username <username>
    ```

1.  Mongo Shell Common Commands
    ```sh
    ## Database and Collection
    db                      # show the current database
    show dbs                 # show all available databases
    use <database>          # select database

    db.createCollection()   # create collection in the current database
    db.getCollectionNames() # list collections in the current database
    db.<coll_name>.drop()   # remove collection, use with caution

    # CRUD
    db.<collection_name>.insertOne()  # insert a single document
    db.<collection_name>.insertMany() # insert multiple documents
    db.<coll_name>.find()             # query documents. list all documents with no query
    db.<coll_name>.updateOne()
    db.<coll_name>.updateMany()
    db.<coll_name>.deleteOne()
    db.<coll_name>.deleteMany()
    db.<coll_name>.renameCollection() # rename collection
    ```

1.  Import and Export
    ```bash
    # import JSON data into local database
    mongoimport --db <db_name> --collection <coll_name> --file <file.json>

    # import JSON data into Atlas database
    mongoimport --uri \
    mongodb+srv://<USERNAME>:<PASSWORD>@<CLUSTER_NAME>/<DATABASE> --collection <COLLECTION> --type json --file <FILENAME>
    ```

## References
*   [Install MongoDB Tutorial - WSL Documentation - Microsoft](https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-database#install-mongodb)
*   [Install MongoDB Community Edition on Ubuntu - MongoDB](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-ubuntu/)
*   [MongoDB Shell Commands - MongoDB](https://www.mongodb.com/docs/mongodb-shell/run-commands/)
*   [MongoDB database mannual - MongoDB](https://www.mongodb.com/docs/manual/)
*   [MongoDB Mongosh API - MongoDB](https://www.mongodb.com/docs/manual/reference/method/)
*   [Cheat Sheet - MongoDB](https://www.mongodb.com/developer/products/mongodb/cheat-sheet/#databases-and-collections)
*   [Connection String URI Format - MongoDB](https://www.mongodb.com/docs/manual/reference/connection-string/)
