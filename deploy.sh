#!/usr/bin/env bash

set -e

deploy () {
kubectl apply -f deploy/
}

remove () {
kubectl delete -f deploy/
}

if [ "$1" == "deploy" ]; then
    echo "Deploying parity"

    deploy && 

    echo "Successfully deployed parity"
elif [ "$1" == "remove" ]; then
    echo "Removing parity"

    remove && 
        
    echo "Successfully removed parity"
fi
