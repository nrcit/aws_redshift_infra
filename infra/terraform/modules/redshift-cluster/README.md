# AWS Redshift Cluster with Secrets Manager Integration

This Terraform module provisions an **Amazon Redshift Cluster** and securely stores its master password in **AWS Secrets Manager**.  

## Resources Created

- **AWS Redshift Cluster**
  - Cluster identifier
  - Node type
  - Master username & password
  - Database name
  - Cluster type (single/multi-node)
  - Number of nodes (if multi-node)

- **Random Password**
  - Generates a 16-character random password with special characters for the Redshift master user.

- **AWS Secrets Manager**
  - Creates a secret (`redshift-master-password`) to securely store the generated Redshift master password.
  - Adds a secret version containing the generated password.