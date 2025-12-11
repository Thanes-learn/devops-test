### Prepare Minikube K8S Cluster

minikube start --addons=ingress,ingress-dns --driver=qemu --network=socket_vmnet
sudo mkdir -v /etc/resolver
./script.sh
cat /etc/resolver/example.com
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
sudo launchctl enable system/com.apple.mDNSResponder.reloaded
sudo launchctl disable system/com.apple.mDNSResponder.reloaded
scutil --dns
kubectl edit configmap coredns -n kube-system **Add this line before Kind word, Use minikube IP**
    example.com:53 {
            errors
            cache 30
            forward . 192.168.105.15 
    }
### Testing 
dscacheutil -q host -a name target.example.com
curl target.example.com
### Transfer Images from Local to minikube cluster
minikube image load devops-test-web:mac_m1
minikube image load mysql:latest
### Deploy the application using kubernetes manifests
kubectl apply -f K8s/00-namespace.yaml
kubectl apply -f K8s/
kubect get ingress -A
dscacheutil -q host -a name target.example.com
ping target.example.com
curl target.example.com
### Uninstall application using Kubernetes manifests
kubectl delete -f K8s/
### Open another terminal and run minikube tunnel for externel access 
sudo minikube tunnel
### Install application using HELM
kubectl create ns sample
helm install myapp ./chart -n sample
### Uninstall application using HELM
helm uninstall myapp -n sample #uninstall 