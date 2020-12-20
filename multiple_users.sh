#! /bin/bash

for i in {1..50}
do 
        curl $(minikube service --url node-port)
done 
