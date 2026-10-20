# Architecture Diagram — AWS Serverless REST API

## Lucid diagram

- **View:** https://lucid.app/lucidchart/d25496ce-f889-4f23-b76e-d0f648c0b38f/view
- **Edit:** https://lucid.app/lucidchart/d25496ce-f889-4f23-b76e-d0f648c0b38f/edit

## Lucid prompt (reusable)

```
Create an AWS serverless architecture diagram titled "AWS Serverless REST API".
Left to right: a Client connects over HTTPS to API Gateway (HTTP API); API Gateway
proxies to an AWS Lambda function (Python); Lambda reads/writes a DynamoDB table and
writes to CloudWatch Logs. Label the arrows (HTTPS, AWS_PROXY, GetItem/PutItem).
Clean, professional AWS-style colors.
```

## Mermaid source

```mermaid
flowchart LR
    Client([Client / Frontend])
    APIGW[API Gateway HTTP API]
    Lambda[AWS Lambda Python 3.12]
    DDB[(DynamoDB Table)]
    Logs[CloudWatch Logs]
    Client -->|HTTPS| APIGW
    APIGW -->|AWS_PROXY| Lambda
    Lambda -->|CRUD| DDB
    Lambda --> Logs
```
