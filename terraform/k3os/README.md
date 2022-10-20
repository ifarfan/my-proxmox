# k3os Cluster

Create `k3os` stack of **3** servers and **6** agents on `proxmox` cluster

Ensure `terraform.tfvars` is symlink-ed to the copy on `terraform\`

#### Terraform provisioning
```shell
# To launch stack
terraform init
terraform plan -compact-warnings
terraform apply -auto-approve

# To destroy stack
terraform destroy -auto-approve -compact-warnings
```

#### Run `ansible` provisioning on 1st boot
This takes some time (`10+ mins`), go do laundry or dinner in the meantime
```shell
cd ../ansible
ansible-playbook -i inventories/k3os k3os-initialize.yml
```

#### Fetch `kube-config` file from primary `server`
```shell
scp rancher@192.168.136.41:/etc/rancher/k3s/k3s.yaml ~/.kube/config
```

#### Label agent nodes as `workers`
```shell
kubectl label nodes k3os-agent-01 kubernetes.io/role=worker
kubectl label nodes k3os-agent-02 kubernetes.io/role=worker
kubectl label nodes k3os-agent-03 kubernetes.io/role=worker

kubectl label nodes k3os-data-01 kubernetes.io/role=data
kubectl label nodes k3os-data-02 kubernetes.io/role=data
kubectl label nodes k3os-data-03 kubernetes.io/role=data
```

#### Install metal-lb

```shell
cd ../kubernetes/metal-lb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.5/config/manifests/metallb-native.yaml
sleep 60
kubectl apply -f metallb-ip-pool.yml
```
