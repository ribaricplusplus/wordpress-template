#!/bin/bash

wpcount=$( grep -e wordpress -c /etc/passwd )
if [ $wpcount == 1 ]; then
    echo "User wordpress not found. Creating."
    useradd -p wordpress --groups sudo --no-create-home wordpress
    echo "User wordpress created."
else
    echo "User wordpress exists."
fi
