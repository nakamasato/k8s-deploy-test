#!/bin/bash

set -eu

echo -n New Password:
read -s password
kubectl patch secret -n argocd argocd-secret \
  -p '{"stringData": { "admin.password": "'$(htpasswd -bnBC 10 "" $password | tr -d ':\n')'"}}'
