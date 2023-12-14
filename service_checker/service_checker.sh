#!/bin/bash

# Specify the services you want to monitor ("service1" "service2" "service3")
services=("alertmanager" "ntp" )

# Slack Webhook URL 
WEBHOOK_URL="https://hooks.slack.com/*****"


# Loop through the services and check their status
for service in "${services[@]}"; do

status=$(systemctl is-active $service)

    if [ "$status" = "active" ]; then

        echo "OK: $(date): $service is running" >> logs.txt

    elif [ "$status" = "inactive" ]; then

        echo "Not Acitve: $(date): $service was not running" >> logs.txt
        systemctl start $service
        echo "Error: $(date): $service was $status! It will be Active automatically." >> logs.txt
        MESSAGE2="$service was $status! It will be start automatically."
        curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"$MESSAGE2\"}" $WEBHOOK_URL
    else
        echo "Error: $(date): Unable to determine the status of $service" >> logs.txt
        MESSAGE3="Error: Unable to determine the status of $service! - Check the service name."
        curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"$MESSAGE3\"}" $WEBHOOK_URL
    fi
done

for service in "${services[@]}"; do

status2=$(systemctl is-active $service)

    if [ "$status2" = "active" ]; then
        echo "OK: $(date): $service is now running" >> logs.txt

    else
        echo "Error: $(date): Unable to start the $service please Check it ASAP!" >> logs.txt
        MESSAGE1="Error: Unable to start the $service please Check it ASAP!"
        curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"$MESSAGE1\"}" $WEBHOOK_URL

    fi
done
