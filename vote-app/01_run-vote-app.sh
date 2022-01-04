#! /bin/bash
# # Autorun voteapp on localhost.
sh vote-namespaces.sh

# # Redis
kubectl apply -f vote-deploy-db-redis.yaml
kubectl apply -f vote-svc-redis.yaml

# #--- BEGINNING of CONNECTION TEST --- #
# Potential test of Redis connection.

# # Create POD
# kubectl run svc-test --image=nginx:alpine
# # Run SH on POD
# kubectl exec -it svc-test sh
# nc -v -z -w 5 redis-svc 6379
# kubectl delete pod svc-test
# # Guide for nc -v = verbose -z = 0/1 -w = timeout

# # ---------- Different method ---------

# kubectl create deployment svc-test --image=nginx:alpine
# kubectl exec svc-test-<POD_NAME> -- nc -v -z -w 5 redis-svc.database 6379
# kubectl delete deploy svc-test
# # --- END of CONNECTION TEST --- #

# # Postgres
kubectl apply -f vote-deploy-db-postgres.yaml
kubectl apply -f vote-svc-postgres.yaml

# # Worker
kubectl apply -f vote-deploy-worker.yaml

# # Vote app
kubectl apply -f vote-deploy-vote-panda.yaml

# # Vote service
kubectl apply -f vote-svc-vote.yaml

# # Result app
kubectl apply -f vote-deploy-result-panda.yaml

echo "===List all services==="
kubectl get svc -A
echo ""
