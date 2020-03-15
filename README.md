# k8s-deploy-test

# k8s in Local

https://github.com/rancher/k3d

```
> k3d create --name dev --api-port 6551 --publish 8081:80
INFO[0000] Created cluster network with ID 65f9aa1ae56b3a3053785241a2e6388ca75832fbb6833abe0e4eec11c537d564
INFO[0000] Created docker volume  k3d-dev-images
INFO[0000] Creating cluster [dev]
INFO[0000] Creating server using docker.io/rancher/k3s:v1.17.2-k3s1...
INFO[0000] Pulling image docker.io/rancher/k3s:v1.17.2-k3s1...
INFO[0013] SUCCESS: created cluster [dev]
INFO[0013] You can now use the cluster with:

export KUBECONFIG="$(k3d get-kubeconfig --name='dev')"
kubectl cluster-info
> export KUBECONFIG="$(k3d get-kubeconfig --name='dev')"

>  kubectl cluster-info
Kubernetes master is running at https://localhost:6551
CoreDNS is running at https://localhost:6551/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
Metrics-server is running at https://localhost:6551/api/v1/namespaces/kube-system/services/https:metrics-server:/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
```



# CD

## ArgoCD

https://argoproj.github.io/argo-cd/

### Install

https://github.com/argoproj/argo-cd/releases/tag/v1.4.2

Form more detail, see [argocd](argocd)

# CI

## Github Actions

Run guestbook on k3s


# Directory Structure


```
± tree -L 2
.
├── README.md
├── apps
│   ├── guestbook
│   └── guestbook-kustomize
├── argocd
│   ├── README.md
│   ├── project
│   └── setup
└── namespace
    ├── README.md
    ├── dev.yaml
    ├── prod.yaml
    └── test-ns.yaml
```
