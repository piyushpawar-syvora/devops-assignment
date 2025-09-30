# 3-Tier Node.js Application Deployment on Kubernetes

This repository contains Kubernetes manifests to deploy a 3-tier Node.js application (Frontend → Backend → PostgreSQL).

---

## Prerequisites

* Kubernetes cluster (Minikube/Kind/other)
* `kubectl` CLI installed
* Docker

---

## Deployment Steps

1. **Clone the repo**

   ```bash
   git clone https://github.com/Syvora-Training/devops-training-assignment-1.git
   cd devops-training-assignment-1
   ```

2. **Create a namespace**

   ```bash
   kubectl create namespace three-tier-app
   ```

3. **Apply ConfigMap and Secret**

   ```bash
   kubectl apply -f db-configmap.yaml -n three-tier-app
   kubectl apply -f db-secret.yaml -n three-tier-app
   ```

4. **Deploy PostgreSQL**

   ```bash
   kubectl apply -f postgres-deployment.yaml -n three-tier-app
   ```

5. **Deploy Backend**

   ```bash
   kubectl apply -f app-deployment.yaml -n three-tier-app
   ```

6. **Access the application**

   If using Minikube:

     ```bash
     minikube service frontend -n three-tier-app
     ```

