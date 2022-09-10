# k3os Cluster

Create `k3os` stack of **3** servers and **6** agents on `proxmox` cluster

#### Terraform provisioning
```shell
# Set environment variables
export PM_API_URL="https://192.168.136.11:8006/api2/json"
export PM_USER="root@pam"
export PM_PASS="my-super-duper-password-goes-here"

# To launch stack
terraform init
terraform plan
terraform apply -auto-approve

# To destroy stack
terraform destroy -auto-approve
```

#### Fetch `kube-config` file from primary `server`
```shell
scp rancher@192.168.136.30:/etc/rancher/k3s/k3s.yaml ~/.kube/config
```

#### Label agent nodes as `workers`
```shell
kubectl label nodes k3os-agent-00 kubernetes.io/role=worker
kubectl label nodes k3os-agent-01 kubernetes.io/role=worker
kubectl label nodes k3os-agent-02 kubernetes.io/role=worker
kubectl label nodes k3os-agent-03 kubernetes.io/role=worker
kubectl label nodes k3os-agent-04 kubernetes.io/role=worker
kubectl label nodes k3os-agent-05 kubernetes.io/role=worker
```

#### Install metallb

```shell
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.5/config/manifests/metallb-native.yaml
kubectl apply -f https://raw.githubusercontent.com/ifarfan/metallb-ip-pool.yml
```
