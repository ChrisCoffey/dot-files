#!/usr/bin/env bash
# usage watch [command] [period]

while :; do
    clear
    date
    bash -c "$1"
    sleep ${2:-1}
done
