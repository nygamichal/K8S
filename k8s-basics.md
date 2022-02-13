#! /bin/bash

# Minikube
minikube start/stop
minikube status
minikube dashboard

# k8s configuration
kubectl cluster-info
cat .kube/config 

### List all resources.
kubectl api-resources
### extended table
kubectl api-resources -o wide

kubectl apply -f <yaml_file>.yaml
kubectl delete -f <yaml_file>.yaml

### List resources, e.g.
kubectl get <resource_name> -o wide
kubectl get namespaces #kubectl get ns
kubectl get pods -A -o wide #kubectl get po | ###list all PODs in all namespaces.
kubectl get nodes
kubectl get services #kubectl get svc
kubectl get deployment #kubectl get deploy -o yaml # show results in YAML format.

kubectl:
- get 
- describe 
- delete
- create

### POD
kubectl create -f pod_file_name.yaml 
kubectl run pod <POD_name>
kubectl describe pod <POD_name>
kubectl logs -f <POD_name>| ### logs -f -c <container> <pod_name> ##-c and name of container in case of a few containers inside one pod.
kubectl exec -it <pod_name> sh
kubectl edit pod <POD_NAME> ### changes in pod will be done immediately 
kubectl get pod -Labc ## List pods with label "abc" 


### ReplicaSet
kubectl get replicaset
kubectl get rs -A ## all ns
kubectl get rs -w ## watch
kubectl describe rs
kubectl scale rs <rs_name> --replicas=4 ##scale out actual rs into 4
kubectl delete rs <rs_name>
kubectl autoscale rs <rs_name> --max=4 --cpu-percent=20 ## autoscale rs to 4 when cpu usage reach 60% usage
## Generate usage on pod
## exec -it sh into pod and then -> dd if=/dev/zero of=/dev/null &

kubectl get hpa ##hpa - horizontal pod autoscaler

NAME               REFERENCE                     TARGETS         MINPODS   MAXPODS   REPLICAS   AGE
<rs_name>          ReplicaSet/<rs_name>          <unknown>/20%   1         4         1          56s



### Rollout
kubectl rollout undo deployment <name>

