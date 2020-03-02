# k8s-deploy-test

# Overview


```
± tree -L 2
.
├── README.md
├── argocd
│   ├── README.md
│   ├── argcocd-v1.2.0-rc2-bebit.yaml
│   ├── argcocd-v1.2.0-rc2.yaml
│   ├── namespace.yaml
│   ├── route53-change-batch-dev-eks-cluster.json
│   ├── sealed-secrets.yaml
│   ├── set_new_passwd.sh
│   └── update_route53.sh
├── kamus
│   ├── Chart.yaml
│   ├── OWNERS
│   ├── README.md
│   ├── templates
│   └── values.yaml
└── test-ns
    ├── guestbook
    ├── guestbook-kustomize
    └── guestbook-kustomize-with-secret
```


# install argo

-> `argocd`


# create app under test-ns namespace

## guestbook


## guestbook with kustomize


## guestbook with kustomize and secret


## Github Actions

Run guestbook on k3s
