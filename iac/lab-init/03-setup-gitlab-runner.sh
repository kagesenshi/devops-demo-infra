#!/bin/bash

export KUBECONFIG=kubeconfig 

# Check if the token parameter is provided
if [ -z "$1" ]; then
  echo "Error: Token parameter is required."
  exit 1
fi

export KUBECONFIG=kubeconfig 

NS=gitlab-runner

helm repo add gitlab https://charts.gitlab.io

cat << EOF | helm install --create-namespace --namespace $NS -f - gitlab-runner gitlab/gitlab-runner
gitlabUrl: https://gitlab.com
runnerToken: $1
rbac:
  create: true
serviceAccount:
  create: true
EOF