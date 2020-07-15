#!/bin/bash
IFS=$'\n'
source secrets.txt
source options.txt
file=input.txt
lines=$(cat ${file})
for line in ${lines}; do
   curl -X $METHOD --retry 5 "https://$API_KEY:$API_SECRET@$STORE_NAME.myshopify.com/admin/api/$API_VERSION/$RESOURCE/${line}.json"
done
IFS=""
exit ${?}