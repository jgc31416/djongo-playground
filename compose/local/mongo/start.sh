#!/bin/bash
mongo -u debug -p debug --authenticationDatabase admin localhost/djongo --eval "db.runCommand( { listCollections: 1 } );"|grep posts
found=$?
if [[ $found -eq 1 ]]; then
  echo "Collections not found restoring"
  mongod --fork --logpath /dev/null --noauth
  mongorestore --host localhost --port 27017 --db djongo --dir /quick-mongo-atlas-datasets-master/dump/sample_training/
  pkill mongod
  echo "Example data ready"
  sleep 10
fi

docker-entrypoint.sh mongod
