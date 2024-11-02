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

---

### Terraform Deployment Requirements

* Terraform must be installed.
* Azure CLI (az command) must be installed and logged into Azure Cloud.

```bash
az login
```
* Create a terraform.tfvars on your local repo and add a `ssh_key_path` variable refrancing the public key file

### Terrafrom commands requienmnts 

1. Go to the terrafrom directory 

2. `terrafrom init` to downlaod modules 

3. `terrafrom plan` to create a plan 

4. `terrafrom apply` to apply such plan 