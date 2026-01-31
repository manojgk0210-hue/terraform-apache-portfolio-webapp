🚀 Project Overview

This project automates the deployment of a web application on AWS using Infrastructure as Code (IaC) with Terraform.

What this project does:

Creates an AWS EC2 instance

Configures Security Groups (HTTP & SSH)

Installs Apache Web Server

Clones a Portfolio website from GitHub

Deploys the website to /var/www/html


⚙️ Prerequisites

Before you begin, make sure you have:

AWS Account

IAM User with EC2 permissions

Terraform installed

AWS credentials configured (env vars or aws configure)

Initialize Terraform

```bash
terraform init
```

Preview the plan

``` terraform plan```

Apply the configuration

``` terraform apply ```

Access the website

```http://<EC2_PUBLIC_IP>```

