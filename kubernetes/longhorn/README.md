# Longhorn

#### Pre-requisites:
**Note**: Not needed for `k3os`!!!
See [https://longhorn.io/docs/1.3.2/deploy/install/#installing-open-iscsi](https://longhorn.io/docs/1.3.2/deploy/install/#installing-open-iscsi)
```shell
# csi
kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/v1.3.2/deploy/prerequisite/longhorn-iscsi-installation.yaml
```

#### Installation:
See [https://longhorn.io/docs/1.3.2/deploy/install/](https://longhorn.io/docs/1.3.2/deploy/install/)
```shell
# via "kubectl"
kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/v1.3.2/deploy/longhorn.yaml

# via "helm"
helm repo add longhorn https://charts.longhorn.io
helm repo update
helm install longhorn longhorn/longhorn --namespace longhorn-system --create-namespace
kubectl -n longhorn-system get pod
```
