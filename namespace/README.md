# Namespace

## Description

Once you set up ArgoCD's `AppProject` and `Application` for namespace following [Create AppProject and Application for namespace
](../argocd#create-appproject-and-application-for-namespace), all you need to do to add a new namespace is to create a yaml file in this directory.
When it's pushed to `master` branch, where ArgoCD is monitoring, it'll automatically be created.

## Namespaces

- `test-ns` 
- `dev`
- `prod`
