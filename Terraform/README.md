# Jenkins Infrastructure on AWS with Terraform

This Terraform project provisions infrastructure for a Jenkins master and slave setup on AWS. It creates a VPC, public subnet, and EC2 instances with necessary networking components.

## Features

- **Secure State Management**: Uses AWS S3 for remote state storage and DynamoDB for state locking
- **Networking**: Creates a VPC with a public subnet and Internet Gateway
- **Compute**: Provisions EC2 instances for Jenkins master and slave
- **Security**: Implements security groups with restricted access
- **Scalability**: Easily adjustable instance count via variables

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (>=1.0.0)
- AWS CLI configured with credentials
- Existing AWS Key Pair for EC2 instance access
- Pre-created S3 bucket (`ibra-terraform-s3`) for remote state
- Pre-created DynamoDB table (`terraform-locks`) for state locking

## Architecture
AWS Region: us-east-1
``` bash
+---------------------+
| VPC |
| +---------------+ |
| | Public Subnet | |
| | +-----------+ | |
| | | Jenkins | | |
| | | Master | | |
| | +-----------+ | |
| | +-----------+ | |
| | | Jenkins | | |
| | | Slave | | |
| | +-----------+ | |
| +---------------+ |
+---------------------+
```

## Usage

1. **Clone the repository**
   ```bash
   git clone https://github.com/ibrahim-reda-2001/Final_Project_iVolve.git
   cd Terraform
   git init 
   git plan -auto-aprove
   ```
2. **Structure**
```bash
├── modules
│   ├── compute
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── network
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
```
### Photo
![init terrfaform](https://github.com/ibrahim-reda-2001/Final_Project_iVolve/blob/master/Terraform/screenshots/init.png)
![apply terraform](https://github.com/ibrahim-reda-2001/Final_Project_iVolve/blob/master/Terraform/screenshots/apply.png)
![dynmodb](https://github.com/ibrahim-reda-2001/Final_Project_iVolve/blob/master/Terraform/screenshots/dynmodb.png)
![ec2](https://github.com/ibrahim-reda-2001/Final_Project_iVolve/blob/master/Terraform/screenshots/ec2.png)
![vpc](https://github.com/ibrahim-reda-2001/Final_Project_iVolve/blob/master/Terraform/screenshots/IGW.png)
![structure](/screenshots/infrastructure.png)


