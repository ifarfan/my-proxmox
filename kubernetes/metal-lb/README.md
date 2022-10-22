# Metal-LB

```shell
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.5/config/manifests/metallb-native.yaml
sleep 60
kubectl apply -f metallb-ip-pool.yml
```
