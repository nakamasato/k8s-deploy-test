# guestbook

```
tree
.
├── README.md
├── guestbook-ui-deployment.yaml
└── guestbook-ui-svc.yaml

0 directories, 3 files
```

# Deploy with Argo CD

## 1. With Yaml file

Please refer to [Create AppProject and Application for guestbook](../argocd#create-appproject-and-application-for-guestbook)

## 1. With CLI command (Not recommended)

### Create an app

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

### Delete the app

```
argocd app delete guestbook
```
