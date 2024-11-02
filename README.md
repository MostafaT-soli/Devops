# DevOps Documentation

## Overview

This documentation covers the architecture and deployment of Azure Pipeline for a Python microservice application and automation deployment of the infrastructure on Azure cloud via Terraform.

---

## Terraform Deployment

### Terraform will deploy the following:

1. Resource Group: This will contain all the below resources.

2. AKS Cluster: This will host the microservice application.

3. Virtual Network and Subnet: For pod network communication.

4. Container Registry: To upload the containerized application.


### Terraform Deployment Requirements

* Terraform must be installed.
* Azure CLI (az command) must be installed and logged into Azure Cloud.

```bash
az login
```
* Create a `terraform.tfvars` file in your local repository and add an `ssh_key_path` variable referencing a  public key file.

### Terraform Commands Requirements

1. Go to the Terraform directory.

2. Run `terraform init` to download modules.

3. Run `terraform plan` to create a plan.

4. Run `terraform apply` to apply such plan.

---

## AKS prepration 

Once AKS is deployed , login into AKS and proceed with the following steps:

1. deploy nginx ingress controller 

`kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.12.0-beta.0/deploy/static/provider/cloud/deploy.yaml`
3. create a prod namespace
`kubectl create ns prod`
2. create a certfciate and add it to a secret for ingress 
```bash
openssl.exe req -x509 -nodes -days 365 -newkey rsa:2048 -keyout mykey.key -out mycert.crt -subj "/CN=micro.mostafa.com" -addext "subjectAltName = DNS:micro.mostafa.com,DNS:www.micro.mostafa.com"
kubectl create secret tls my-tls-secret --key mykey.key --cert mycert.crt -n prod
```
3. create an image pull secrete 
First loin inot the acr and show the crentials using az command 
```bash
az acr login --name <acr_name>
az acr credential show --name <acr_name>
```
Create a json file from the provided credntials as an example 
```{
  "auths": {
    "your-registry": {
      "username": "your-username",
      "password": "your-password",
      "email": "your-email",
      "auth": "base64-encoded-auth-info"
    }
  }
}
```