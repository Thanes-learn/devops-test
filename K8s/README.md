Create namespace and apply manifests:
   kubectl apply -f 00-namespace.yaml
   kubectl apply -f 01-secret-mysql.yaml
   kubectl apply -f 02-configmap-mysql-init.yaml
   kubectl apply -f 03-pvc-mysql.yaml
   kubectl apply -f 04-mysql-deployment.yaml
   kubectl apply -f 05-mysql-service.yaml
   kubectl apply -f 06-web-deployment.yaml
   kubectl apply -f 07-web-service.yaml
   kubectl apply -f 08-ingress.yaml

