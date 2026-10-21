# AWS Serverless REST API (Terraform)

> Production-grade, modular serverless CRUD API on AWS — API Gateway + Lambda + DynamoDB — with CI security scanning and dev/prod environments.
> **Author:** Muhammad Ahmad · **IaC:** Terraform (modular) · **Cloud:** AWS

![Terraform CI](https://github.com/AhmadMughal-DS/aws-serverless-rest-api-terraform/actions/workflows/terraform.yml/badge.svg)
![Terraform](https://img.shields.io/badge/Terraform-1.6%2B-7B42BC?logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-API%20Gateway%20%7C%20Lambda%20%7C%20DynamoDB-FF9900?logo=amazonaws&logoColor=white)
![Security](https://img.shields.io/badge/scanned-tfsec%20%7C%20checkov-success)
![License](https://img.shields.io/badge/License-MIT-green)

---

## 🏗️ Architecture

> 🎨 **Interactive diagram (industry-standard icons):** [open in Lucid — page 2](https://lucid.app/lucidchart/3da75ce3-ea66-4296-81b3-00d20a60435b/edit)

```mermaid
flowchart LR
    Client([Client / Frontend])
    APIGW[API Gateway<br/>HTTP API]
    Lambda[AWS Lambda<br/>Python 3.12 · X-Ray]
    DDB[(DynamoDB<br/>PITR · encrypted)]
    Logs[CloudWatch Logs]

    Client -->|HTTPS| APIGW
    APIGW -->|AWS_PROXY| Lambda
    Lambda -->|CRUD| DDB
    Lambda --> Logs
    APIGW -.access logs.-> Logs
```

## 📦 Module layout

```
terraform/
├── backend.tf            # remote state (bootstrap notes)
├── main.tf               # packages Lambda + calls the api module
├── variables.tf          # typed, validated inputs
├── environments/{dev,prod}.tfvars
└── modules/api/          # DynamoDB, Lambda, IAM, API Gateway, logging
```

## ✨ Production features

- **DynamoDB** — point-in-time recovery, server-side encryption, prod deletion protection.
- **Lambda** — **X-Ray** active tracing, least-privilege IAM (table + logs + xray only).
- **API Gateway** — **access logging** to CloudWatch and **throttling** (burst 100 / rate 50).
- **CI** — GitHub Actions runs `fmt`, `validate`, **TFLint**, **tfsec**, **Checkov** on every PR.

## 🔌 API routes

| Method | Path | Action |
|--------|------|--------|
| `GET` | `/items` | List items |
| `POST` | `/items` | Create an item |
| `GET` | `/items/{id}` | Get one item |
| `DELETE` | `/items/{id}` | Delete an item |

## 🚀 Deploy

```bash
cd terraform
terraform init
terraform apply -var-file=environments/dev.tfvars   # or prod.tfvars
```

## 🧹 Clean up

```bash
terraform destroy -var-file=environments/dev.tfvars
```

## 💰 Cost note

DynamoDB on-demand + Lambda + API Gateway are pay-per-use — idle cost ≈ **$0**.

---

*Built and maintained by **Muhammad Ahmad**.*
