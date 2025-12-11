
## 🚀 DevOps Challenge: Productionize an Application

This is a test of your skills in **Docker, Kubernetes (k8s), and DevOps**.

### Your Starting Point

You are given a basic application that is already working and can be started using `docker-compose`.

---

### Your Mission

Your task is to take this basic app and make it **production-ready** for deployment into a Kubernetes cluster.

### Key Requirements

* **Helm Chart:** Both parts of the application must be packaged and installable using a **Helm chart**.
* **Kubernetes Deployment:** The application must be configured to start and run successfully within the k8s cluster.
* **Network Accessibility:** The app must be accessible at the domain `https://target.example.com`.
    * **Note:** We know this domain won't actually resolve. However, your cluster configuration (e.g., an Ingress resource) must be set up correctly *as if* it would.

---

### CI/CD Pipeline Update

The repository also contains a CI/CD tool. You must **update the CI/CD pipeline** with the necessary steps to support this new deployment.

* **Goal:** The pipeline steps themselves do not need to be fully functional. The objective is to demonstrate a basic understanding of how to **structure and set up the pipeline** for this kind of deployment.



## Solution

I am using a **Mac M1**, and while building a Docker image, I encountered an architecture-related issue. To resolve this, I reconfigured the Dockerfile and created a new version named **`Dockerfile.m1`**.

### Build Docker Image on Mac M1

Use the following command to build the Docker image for the ARM64 architecture:

```bash
docker build --platform linux/arm64 -t devops-test-web:mac_m1 -f Dockerfile.m1 .
```

---

## CI/CD Pipelines

I initially created a **Bitbucket Pipeline** as I was more familiar with it. Later, I converted it into a **GitLab CI Pipeline** for deployment compatibility.

---

## Kubernetes & Helm Structure

- The **`k8s`** folder contains the required Kubernetes manifest files.
- The **`chart`** folder contains the Helm chart configuration.

---

## Deploy Using Kubernetes Manifests (Without Helm)

If you prefer applying Kubernetes manifests directly, use the following order:

```bash
kubectl apply -f 00-namespace.yaml
kubectl apply -f 01-secret-mysql.yaml
kubectl apply -f 02-configmap-mysql-init.yaml
kubectl apply -f 03-pvc-mysql.yaml
kubectl apply -f 04-mysql-deployment.yaml
kubectl apply -f 05-mysql-service.yaml
kubectl apply -f 06-web-deployment.yaml
kubectl apply -f 07-web-service.yaml
kubectl apply -f 08-ingress.yaml
```

---

## Deploy Using Helm

If you prefer Helm, use the following command:

```bash
helm upgrade --install devops-test ./chart -n devops-test --create-namespace
```