#!/bin/bash

export KUBECONFIG=kubeconfig

kubectl create ns argocd
kubectl apply -f manifest/argocd/install.yml -n argocd
kubectl apply -f manifest/argocd/nodeport.yml -n argocd
