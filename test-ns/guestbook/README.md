# guestbook

```
tree
.
├── README.md
├── guestbook-ui-deployment.yaml
└── guestbook-ui-svc.yaml

0 directories, 3 files
```


# Argo CD

## create an application

```
argocd app create guestbook \
  --repo https://github.com/nakamasato/k8s-deploy-test.git \
  --path test-ns/guestbook/ \
  --dest-server https://kubernetes.default.svc \
  --dest-namespace test-ns \
  --auto-prune \
  --sync-policy automated
application 'guestbook' created
```

## delete the app

```
argocd app delete guestbook
```