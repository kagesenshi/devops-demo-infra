#!/bin/bash

export KUBECONFIG=kubeconfig 

# Check if the token parameter is provided
if [ -z "$1" ]; then
  echo "Error: Token parameter is required."
  exit 1
fi

export KUBECONFIG=kubeconfig 

NS=gitea-runner

kubectl create ns gitea-runner

cat << EOF | kubectl apply -n $NS -f -
apiVersion: v1
kind: Secret
type: Opaque
metadata:
  name: runner-secret
stringData:
  token: $1
EOF

kubectl apply -n $NS -f gitea-runner-dind.yaml
