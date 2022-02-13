# Kubernetes
Main catalog of repository contains raw files which were used during course.

# Vote App
File **run-vote-app.sh** inside catalog **vote-app/** contains guidelines how to run application to vote between cats and dogs locally on k8s.

**TIP:** Website addresses in case of using vagrant file from branch K8S of gitrepo panda_vagrant:
https://github.com/nygamichal/panda_vagrant/blob/K8S/Vagrantfile

Voting website address: http://192.168.33.33:31000/

Results website address: http://192.168.33.33:8080/

# Materials
# LinuxAcademy / A Cloud Guru
Kubernetes QuickStart<br>
https://lucid.app/lucidchart/3de4e35d-c25a-46d6-a17e-04dbd2612859/view?page=0_0#

Kubernetes Essentials<br>
https://lucid.app/lucidchart/6d5625be-9ef9-411d-8bea-888de55db5cf/view?page=Q3TolGze47sv#

# Theory
Kubelet is separate system service dedicated for Kubernetes which handles running containers on a node.
* `sudo systemctl status kubelet`

---------------------
# Minikube
* `minikube start/stop`
* `minikube status`
* `minikube dashboard`
* `minikube ip`
* `minikube addons list` ## List addons for minikube
* `minikube addons enable ingress` ## Enable ingress

# k8s configuration
* `kubectl cluster-info`
* `cat .kube/config `

# List all resources.
* `kubectl api-resources`
# extended table
* `kubectl api-resources -o wide`

kubectl apply -f <yaml_file>.yaml
kubectl delete -f <yaml_file>.yaml

# List resources, e.g.
* `kubectl get <resource_name> -o wide`
* `kubectl get namespaces` #kubectl get ns
* `kubectl get pods -A -o wide` #kubectl get po | ###list all PODs in all namespaces.
* `kubectl get nodes`
* `kubectl get services` #kubectl get svc
* `kubectl get deployment` #kubectl get deploy -o yaml # show results in YAML format.

kubectl:
- get 
- describe 
- delete
- create

# POD
* `kubectl create -f pod_file_name.yaml`
* `kubectl run pod <POD_name>`
* `kubectl describe pod <POD_name>`
* `kubectl logs -f <POD_name>`| ### logs -f -c <container> <pod_name> ##-c and name of container in case of a few containers inside one pod.
* `kubectl exec -it <pod_name> sh`
* `kubectl edit pod <POD_NAME>` ### changes in pod will be done immediately
* `kubectl get pod -Labc` ## List pods with label "abc" 


# ReplicaSet
* `kubectl get replicaset`
* `kubectl get rs -A ## all ns`
* `kubectl get rs -w ## watch`
* `kubectl describe rs`
* `kubectl scale rs <rs_name> --replicas=4` ##scale out actual rs into 4
* `kubectl delete rs <rs_name>`
* `kubectl autoscale rs <rs_name> --max=4 --cpu-percent=20` ## autoscale rs to 4 when cpu usage reach 60% usage
## Generate usage on pod
## exec -it sh into pod and then -> dd if=/dev/zero of=/dev/null &

* `kubectl get hpa` ##hpa - horizontal pod autoscaler

NAME               REFERENCE                     TARGETS         MINPODS   MAXPODS   REPLICAS   AGE<br>
<rs_name>          ReplicaSet/<rs_name>          <unknown>/20%   1         4         1          56s

# Ingress
* `kubectl get ingress`
* `kubectl describe ing <ing_name>`
* `kubectl annotate ing <ing_name> nginx.ingress.kubernetes.io/auth-url=https://httpbin.org/basic-auth/rick/M0rty`

# Rollout 
  Rollout move actual deploy to previous correctly working one, before the changes.
* `kubectl rollout undo deployment <name>`
* `kubectl rollout history deploy/<name>` 

