# API Application Deployment

This project contains Terraform scripts for deploying a simple API application to AWS Fargate with VPC and API Gateway configurations.

## Architecture

The architecture includes the following components:

- **VPC**: A Virtual Private Cloud with public and private subnets.
- **API Gateway**: Acts as the entry point for the API, configured with a private link.
- **AWS Fargate**: Hosts the containerized API application.
- **IAM Roles**: Provides necessary permissions for the services.
- **CloudWatch**: Monitors logs and metrics for the application.

## Folder Structure

Below is the folder structure of the project:

```
terraform-fargate-apigw-privatelink/
├── infra/
│   ├── main.tf                # Main Terraform configuration file
│   ├── variables.tf           # Input variables for the Terraform configuration
│   ├── outputs.tf             # Output values from the Terraform deployment
│   ├── providers.tf           # Provider configurations for Terraform
│   ├── modules/               # Reusable Terraform modules
│   │   ├── vpc/               # Module for VPC configuration
│   │   │   ├── main.tf        # VPC module main configuration
│   │   │   ├── variables.tf   # VPC module input variables
│   │   │   └── outputs.tf     # VPC module output values
│   │   ├── apigateway/        # Module for API Gateway configuration
│   │   │   ├── main.tf        # API Gateway module main configuration
│   │   │   ├── variables.tf   # API Gateway module input variables
│   │   │   └── outputs.tf     # API Gateway module output values
│   │   ├── fargate/           # Module for AWS Fargate configuration
│   │   │   ├── main.tf        # Fargate module main configuration
│   │   │   ├── variables.tf   # Fargate module input variables
│   │   │   └── outputs.tf     # Fargate module output values
│   └── terraform.tfstate.d/   # Directory for storing Terraform state files locally
├── README.md                  # Project documentation
├── LICENSE                    # License file
└── .gitignore                 # Git ignore file
```

> **Note**: Storing the Terraform state file locally (`terraform.tfstate.d/`) is suitable for testing or small-scale projects. For production environments, consider using a remote backend like AWS S3 with DynamoDB for state locking to ensure better scalability and collaboration.

## Project Structure

- `infra/`: Contains all Terraform configurations.
- `infra/modules/`: Contains reusable modules for VPC, API Gateway, and Fargate.

## Getting Started

### Prerequisites

- Terraform installed
- AWS account with appropriate permissions
- AWS CLI configured with your credentials

### Deploying the Infrastructure

1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/terraform-fargate-apigw-privatelink.git
   ```
2. Navigate to the `infra` directory:
   ```bash
   cd terraform-fargate-apigw-privatelink/infra
   ```
3. Initialize the Terraform configuration:
   ```bash
   terraform init
   ```
4. Review the execution plan:
   ```bash
   terraform plan
   ```
5. Deploy the infrastructure:
   ```bash
   terraform apply
   ```

### Cleanup

To remove the deployed infrastructure, run:
```bash
terraform destroy
```

## Notes

- Ensure that your AWS credentials are properly configured before running the Terraform commands.
- Review the `variables.tf` file to customize the deployment parameters as needed.
- Monitor the application using AWS CloudWatch for logs and metrics.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.