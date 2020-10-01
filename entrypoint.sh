#! /bin/sh
until nc -z mysql 3306; do
echo "waiting on db"
sleep 2
done
sleep 2
python3 app.py