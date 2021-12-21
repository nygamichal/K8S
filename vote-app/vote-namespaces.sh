#! /bin/bash
# Create namespaces inside k8s and name them: "vote", "result", "database"
kubectl create namespace vote 
kubectl create ns result
kubectl create ns database
# List all namespaces
echo ""
echo "===List all namespaces==="
kubectl get ns -A
echo ""