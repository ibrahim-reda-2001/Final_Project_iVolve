# Kubernetes Application Deployment 🚀

## Overview
Containerized application deployment using Kubernetes with:
- 5 replica deployment
- NGINX Ingress Controller
- ClusterIP service
- AWS LoadBalancer integration

## Architecture
```mermaid
graph LR
    A[External Users] --> B[Ingress LoadBalancer]
    B --> C[Ingress Controller]
    C --> D[ClusterIP Service]
    D --> E[Application Pods]
```
### Configuration Files
**1.Namespace**
```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: ivolve
```
**you can set as defult**
```bash
kubectl config set-context --current --namespace=ivolve 
kubectl config view --minify | grep namespace
```
**2. Deployment**
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ivolveapp
  namespace: ivolve
spec:
  replicas: 5
  template:
    spec:
      containers:
      - name: ivolve-app
        image: ibrahimelmsery1/ivolve-app
        ports:
        - containerPort: 8081
```
**3. Service**
```yaml
apiVersion: v1
kind: Service
metadata:
  name: ivolve-app-svc
  namespace: ivolve
spec:
  type: ClusterIP
  ports:
  - port: 80
    targetPort: 8081
```
**4. Ingress**
- Create target group in aws with port(30108) of nginx controller 
ingress-nginx-controller             LoadBalancer   10.109.144.126   <pending>     80:30164/TCP,443:30108/TCP   35m
- Create aws ALB(application loadd balancer) for this target group and get dns from LB
```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ivolve_ingress
  namespace: ivolve
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  ingressClassName: nginx
  rules:
  - host: ingress-173674326.us-east-1.elb.amazonaws.com
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: ivolve-app-svc
            port:
              number: 80
```
### Quick Start
```bash
# Create namespace
kubectl apply -f namespace.yaml

# Deploy components
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f ingress.yaml

# Verify
kubectl get all -n ivolve
kubectl get ingress -n ivolve
```
### How to install nginx controller
**1.install HELM**
```bash
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm
helm version
```
**2.Install nginx-controller**
```bash
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

helm install ingress-nginx ingress-nginx/ingress-nginx
```
### How to init Master node
```bash
 sudo kubeadm init --pod-network-cidr=10.244.0.0/16  #you shoud get token to apply it to worker 
 mkdir -p $HOME/.kube 
 sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config 
 sudo chown $(id -u):$(id -g) $HOME/.kube/config 
 kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
 ``` 
 **in this image you will see the token and how to run it**

 ![Master](https://github.com/ibrahim-reda-2001/Final_Project_iVolve/blob/master/Kubernetes/Screenshots/init-k8S.png)

 ### Images

 ![Ndes](https://github.com/ibrahim-reda-2001/Final_Project_iVolve/blob/master/Kubernetes/Screenshots/nodes.png)


![ingress1](https://github.com/ibrahim-reda-2001/Final_Project_iVolve/blob/master/Kubernetes/Screenshots/ing1.png)

![ingress2](https://github.com/ibrahim-reda-2001/Final_Project_iVolve/blob/master/Kubernetes/Screenshots/ing2.png)

![ingress3](https://github.com/ibrahim-reda-2001/Final_Project_iVolve/blob/master/Kubernetes/Screenshots/ing3.png)

![Loadbalncer](https://github.com/ibrahim-reda-2001/Final_Project_iVolve/blob/master/Kubernetes/Screenshots/Loadbalancer.png)


