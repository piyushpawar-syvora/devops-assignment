## 📋 Prerequisites

Before you begin, ensure you have the following installed and configured:

- **Terraform CLI**: The command-line interface for managing infrastructure.
- **AWS CLI**: The command-line interface for AWS.
- **AWS Credentials**: Your AWS access keys must be configured for the AWS CLI, as Terraform uses the same configuration to authenticate.

**Verification:**  
Run the following command to ensure your default profile is set up:

```bash
aws configure
```

##  Deployment Guide (Getting Started)

Follow these steps to initialize, plan, and apply the infrastructure.

### Step 1: Initialize the Project
This downloads the necessary provider plugins (e.g., the AWS provider) and prepares the working directory.

```bash
terraform init
```

---

### Step 2: Review the Plan
Always inspect the plan to see exactly what actions Terraform will perform before applying any changes to your cloud environment.

```bash
terraform plan
```

**Review:**  
Check the output summary to ensure the number of resources to be added aligns with expectations, for example:

Plan: X to add, 0 to change, 0 to destroy

---

### Step 3: Apply the Configuration
This executes the plan and provisions the resources in your AWS account.

```bash
terraform apply
```

**Confirmation:**  
You will be prompted to manually type `yes` to confirm the deployment.

---

### Step 4: Check Outputs
After a successful deployment, retrieve any defined output variables (like public IPs, VPC IDs, or cluster names).

```bash
terraform output
```

---

## 🧹 Cleanup (Destroying Infrastructure)
To tear down all the provisioned resources and prevent unexpected charges, use the destroy command.

```bash
terraform destroy
```

**Confirmation:**  
You will be prompted to manually type `yes` to confirm the destruction of resources.