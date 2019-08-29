# guestbook

```
tree
.
├── README.md
├── base
│   ├── guestbook-ui-deployment.yaml
│   ├── guestbook-ui-svc.yaml
│   └── kustomization.yaml
└── overlays
    ├── dev
    │   ├── kustomization.yaml
    │   └── replica_count.yaml
    └── prod
        ├── config
        │   └── guestbook-ui-secret.txt
        ├── kustomization.yaml
        └── replica_count.yaml

5 directories, 9 files
```

# kustomize

## version

```
kustomize version
Version: {KustomizeVersion:3.1.0 GitCommit:95f3303493fdea243ae83b767978092396169baf BuildDate:2019-07-26T19:21:45+01:00 GoOs:darwin GoArch:amd64}
```

## manual apply

```
kustomize build overlays/prod/ | kubectl -n test-ns apply -f -
secret/guestbook-ui-9dkh4fh6b4 created
service/guestbook-ui created
deployment.apps/guestbook-ui created
```

## manual delete

```
kkustomize build overlays/prod/ | kubectl -n test-ns delete -f -
secret "guestbook-ui-9dkh4fh6b4" deleted
service "guestbook-ui" deleted
deployment.apps "guestbook-ui" deleted
```

