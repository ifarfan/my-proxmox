# Monitoring

Installing `Grafana` and `Prometheus`

See [https://docs.technotim.live/posts/kube-grafana-prometheus/](https://docs.technotim.live/posts/kube-grafana-prometheus/)

```shell
# Fetch helm repo
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# Create secret
kubectl create namespace monitoring
kubectl create secret generic grafana-admin-credentials --from-literal=admin-password='XXXXXXXXXXXX' --from-literal=admin-user='XXXXXXXXXXXX' -n monitoring

# Verify secret
kubectl describe secret -n monitoring grafana-admin-credentials
kubectl get secret -n monitoring grafana-admin-credentials -o jsonpath="{.data.admin-user}" | base64 --decode
kubectl get secret -n monitoring grafana-admin-credentials -o jsonpath="{.data.admin-password}" | base64 --decode

# Install helm chart
helm install -n monitoring prometheus prometheus-community/kube-prometheus-stack -f values.yaml
```
