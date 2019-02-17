#!/bin/bash
brew update
brew install mariadb
mysql.server start
mysql -u root -e "CREATE OR REPLACE DATABASE DHBWsoccer"
for i in `seq 1 10`; do
    echo "Executing $i/10..."
    mysql -u root DHBWsoccer < "./IMPORT/IMPORT$i.sql"
done    
curl parrot.live