#! /bin/bash
# # @ @ @ Port-forward @ @ @ #
# # socat is potentially required for port-forward
# yum update && yum install -y socat


# # Please remember to replace <POD_NAME> with full name of result POD.
# kubectl port-forward --address 0.0.0.0 pod/result-<POD_NAME> -n result 8080:80
POD_RESULT_NAME=$(kubectl get pods -A --no-headers=true -o custom-columns=result:.metadata.name | grep result)
kubectl port-forward --address 0.0.0.0 pod/$POD_RESULT_NAME -n result 8080:80
