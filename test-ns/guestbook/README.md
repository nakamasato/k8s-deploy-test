# guestbook

```
.
├── README.md
├── base
│   ├── guestbook-ui-deploymyaml
│   ├── guestbook-ui-sealedsecyaml
│   ├── guestbook-ui-yaml
│   └── kustomizatyaml
└── overlays
    ├── dev
    │   ├── kustomization.yaml
    │   └── replica_count.yaml
    └── prod
        ├── kustomization.yaml
        └── replica_count.yaml

4 directories, 8 files
```

# kustomize

```
kustomize version
Version: {KustomizeVersion:3.1.0 GitCommit:95f3303493fdea243ae83b767978092396169baf BuildDate:2019-07-26T19:21:45+01:00 GoOs:darwin GoArch:amd64}
```


# kamus



```
kamus-cli encrypt \
  --secret <data> \
  --service-account kamus-example-sa \
  --namespace test-ns \
  --kamus-url http://127.0.0.1:9999 \
  --allow-insecure-url
Encrypted data:
<encrypted data>
```


```:kamus-secret.yaml
apiVersion: "soluto.com/v1alpha1"
kind: KamusSecret
metadata:
  name: test-kamus-secret
  namespace: test-ns
type: TlsSecret
data:
  key: <encrypted data>
serviceAccount: kamus-example-sa
```


# sealedsecret

- SealedSecret requires to have the same name and namespace. DO NOT use prefix for kustomize, otherwise you need to provide the name to be actually used for secret.
- Currently, there's no way to use secretGenerator because it generates secret with hash value, which is not predictable when executing `kubeseal`.


```
kubeseal --format yaml <guestbook-ui-secret.yaml >guestbook-ui-sealedsecret.yaml
```