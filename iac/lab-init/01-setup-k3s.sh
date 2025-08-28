#!/bin/bash -x

ansible-playbook 01-setup-k3s.yml --ask-vault-password -i inventory

for I in `ls fetch`;do
    cat fetch/$I/etc/rancher/k3s/k3s.yaml|sed "s|127.0.0.1|$I|g" > kubeconfig
    echo "kubeconfig saved to $PWD/kubeconfig"
done
