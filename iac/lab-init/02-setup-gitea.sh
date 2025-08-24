#!/bin/bash

ansible-playbook 02-setup-gitea.yml --ask-vault-password -i inventory
