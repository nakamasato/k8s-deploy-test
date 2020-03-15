# Argo CD

## Version

1.4.2

## Install on K8S

```
kubectl apply -f setup/namespace.yaml
kubectl apply -n argocd -f setup/install.yaml
```

setup/install.yaml is downloaded from https://raw.githubusercontent.com/argoproj/argo-cd/v1.4.2/manifests/install.yaml

## New Password

```
cd setup
set_new_passwd.sh
```

## Add repo

```
kubectl port-forward svc/argocd-server -n argocd 8080:80
```

### On your browser

1. Open https://localhost:8080/

    user: admin
    pass: argocd-server-xxxxx-xxxxx (pod name of argocd server by default)

1. Add repository using https https://github.com/nakamasato/k8s-deploy-test


### With cli

1. Install cli (https://argoproj.github.io/argo-cd/cli_installation/)   
   
    ```
    argocd version
    argocd: v1.4.2+48cced9
      BuildDate: 2020-01-24T01:07:43Z
      GitCommit: 48cced9d925b5bc94f6aa9fa4a8a19b2a59e128a
      GitTreeState: clean
      GoVersion: go1.12.6
      Compiler: gc
      Platform: darwin/amd64
    argocd-server: v1.4.2+48cced9
      BuildDate: 2020-01-24T01:07:03Z
      GitCommit: 48cced9d925b5bc94f6aa9fa4a8a19b2a59e128a
      GitTreeState: clean
      GoVersion: go1.12.6
      Compiler: gc
      Platform: linux/amd64
      Ksonnet Version: v0.13.1
      Kustomize Version: Version: {Version:kustomize/v3.2.1 GitCommit:d89b448c745937f0cf1936162f26a5aac688f840 BuildDate:2019-09-27T00:10:52Z GoOs:linux GoArch:amd64}
      Helm Version: v2.15.2
      Kubectl Version: v1.14.0
    ```
   
1. Login

    ```
    argocd login localhost:8080
    WARNING: server certificate had error: x509: certificate signed by unknown authority. Proceed insecurely (y/n)? y
    Username: admin
    Password: argocd-server-xxxxx-xxxxx (pod name of argocd server by default) 
    'admin' logged in successfully
    Context 'localhost:8080' updated
    ```

1. Add repo 

    ```    
    argocd repo add https://github.com/nakamasato/k8s-deploy-test.git
    repository 'https://github.com/nakamasato/k8s-deploy-test.git' added
    ```

1. List repos
    
    ```
    argocd repo list
    TYPE  NAME  REPO                                               INSECURE  LFS    CREDS  STATUS      MESSAGE
    git         https://github.com/nakamasato/k8s-deploy-test.git  false     false  false  Successful
    ```
    
    
## Create AppProject and Application for namespace

1. Create `namespace` AppProject to manage namespaces.

    ```
    kubectl apply -f project/namespace/project.yaml
    appproject.argoproj.io/namespace created
    ```
        
1. Create `namespace` Application to manage manespaces.
    
    ```
    kubectl apply -f project/namespace/app-namespace.yaml
    application.argoproj.io/namespace created
    ```

1. Check the namespace

    ```
    kubectl get namespace
    NAME              STATUS   AGE
    kube-system       Active   78m
    default           Active   78m
    kube-public       Active   78m
    kube-node-lease   Active   78m
    argocd            Active   72m
    test-ns           Active   16s
    ```

## Create AppProject and Application for `guestbook`

1. Create `test` AppProject

    ```
    kubectl apply -f project/test/project.yaml
    appproject.argoproj.io/test created
    ```

1. Create `guestbook` Application


    ```
    kubectl apply -f project/test/app-guestbook.yaml
    application.argoproj.io/guestbook created
    ```

1. Check the application

    ```
    kubectl get pod -n test-ns
    NAME                            READY   STATUS    RESTARTS   AGE
    guestbook-ui-65b878495d-4wcn8   1/1     Running   0          86s
    guestbook-ui-65b878495d-jfqph   1/1     Running   0          86s
    guestbook-ui-65b878495d-dx4kz   1/1     Running   0          86s
    ```

# Kustomize

https://github.com/kubernetes-sigs/kustomize/blob/master/docs/INSTALL.md
