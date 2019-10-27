#!/bin/bash
cnf_file=resources/database.cnf

if [ ! -f $cnf_file ]; then
  echo No such file $cnf_file
  exit 1
fi

declare -A connection

while IFS= read -r line; do
  IFS='=' read -ra config <<< "$line"
  if [ ! -z "$config" ]; then
    connection["${config}"]=${config[1]}
  fi
done < $cnf_file

host=${connection["host"]}
port=${connection["port"]}
database=${connection["database"]}
user=${connection["user"]}
password=${connection["password"]}

if [ -z "$host" ] || [ -z "$port" ] || [ -z "$database" ] || [ -z "$user" ] || [ -z "$password" ]; then
  echo Invalid config
  exit 1
fi

function create() {
  mysql -h"$host" -u "$user" -p"$password" -P"$port" -e "create database $database;"
}

function destroy() {
  mysql -h"$host" -u "$user" -p"$password" -P"$port" -e "drop database $database;"
}

$1
