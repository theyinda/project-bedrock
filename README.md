# Project Bedrock - InnovateMart EKS Infrastructure

## Architecture
- VPC: project-bedrock-vpc (us-east-1)
- EKS: project-bedrock-cluster (v1.34)
- RDS: MySQL + PostgreSQL in private subnets
- DynamoDB: Carts and Orders tables
- S3 + Lambda: Asset processing pipeline
- CloudWatch: Centralized logging

## Prerequisites
- AWS CLI configured
- terraform >= 1.3.0
- kubectl
- helm
- eksctl

## Deployment

### 1. Deploy Infrastructure
Push to main branch — GitHub Actions runs terraform apply automatically.

Or manually:
```bash
cd terraform
terraform init
terraform plan
terraform apply
```

### 2. Configure kubectl
```bash
aws eks update-kubeconfig --region us-east-1 --name project-bedrock-cluster
```

### 3. Deploy Application
```bash
kubectl apply -f kubernetes/manifests/
```

### 4. Get Application URL
```bash
kubectl get ingress -n retail-app
```

## CI/CD Pipeline
- Pull Request → terraform plan posted as PR comment
- Merge to main → terraform apply runs automatically

## Retail Store URL
After deployment, get the ALB URL:
```bash
kubectl get ingress -n retail-app -o jsonpath='{.items[0].status.loadBalancer.ingress[0].hostname}'
```
