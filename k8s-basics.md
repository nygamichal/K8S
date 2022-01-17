#! /bin/bash

# k8s configuration
minikube status
kubectl cluster-info
cat .kube/config 

# List all resources.
kubectl api-resources
# extended table
kubectl api-resources -o wide


# List resources, e.g.
kubectl get <resource_name> -o wide
kubectl get namespaces #kubectl get ns
kubectl get pods -A -o wide #list all PODs in all namespaces.
kubectl get nodes
kubectl get services #kubectl get svc
kubectl get deployment #kubectl get deploy -o yaml # show results in YAML format.

kubectl:
- get
- describe 
- delete
- create

# POD
kubectl <cmd> pod <POD_name>
- run
- describe
- logs
- exec

# Rollout
kubectl rollout undo deployment <name>


# ReplicaSets
kubectl describe rs
