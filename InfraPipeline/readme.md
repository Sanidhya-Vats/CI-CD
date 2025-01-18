# CI/CD Pipeline for Terraform Deployment

This README explains the CI/CD pipeline designed for running Terraform commands on Azure infrastructure. The pipeline automates the initialization, planning, manual validation, and application of Terraform configurations in Azure.

## Pipeline Overview

The pipeline consists of the following stages:

1. **Terraform Init**: Initializes the Terraform configuration and backend.
2. **Terraform Plan**: Generates an execution plan for Terraform.
3. **Manual Validation**: Provides manual approval before applying Terraform changes.
4. **Terraform Apply**: Applies the changes as per the Terraform plan.

## Prerequisites

Before using this pipeline, ensure the following prerequisites are met:

### 1. **Azure DevOps Setup**
   - **Service Connection**: A service connection to Azure (ARM) must be created in Azure DevOps for authentication:
     - Go to **Project Settings > Service Connections**.
     - Add a new **Azure Resource Manager** connection with service principal or managed identity authentication.
     - Name the connection (in this case, `Petroleum-pipeline`).

### 2. **Azure Resources for Terraform Backend**
   - Terraform stores its state in an **Azure Storage Account**. Ensure the following resources are created:
     - **Resource Group**: For the storage account (e.g., `pipeline-rg`).
     - **Storage Account**: Used for storing the state files (e.g., `pipelinesg`).
     - **Storage Container**: To hold the `.tfstate` files (e.g., `pipelinecn`).
   - These resources should be referenced correctly in the pipeline.

### 3. **Terraform Version**
   - The pipeline installs and uses the latest version of Terraform. Make sure that the specified version is compatible with your Terraform configurations.

### 4. **Manual Validation Setup**
   - The manual validation step is included to ensure human intervention before applying the Terraform plan.
   - You can configure this step by specifying the email addresses of users who will approve or validate the changes:
     - Make sure that the email addresses specified in the `notifyUsers` and `approvers` fields are correct.

### 5. **Environment Details**
   - The pipeline references a specific **Azure environment** via the service connection (`Petroleum-pipeline`). Ensure that the service connection is set up correctly and has the necessary permissions to manage Azure resources.
   - If you are deploying to a different cloud provider, update the `environmentServiceNameAzureRM` or add an equivalent service connection (e.g., `environmentServiceNameGCP` for Google Cloud Platform).

## Steps to Use

### 1. **Clone the Repository**
   Clone the repository to your local machine to modify the YAML pipeline and configuration files as needed.

### 2. **Modify the Trigger and Pool Details**
   The pipeline is configured to run on a specific branch (`dev`) and an agent pool (`Agent-Cool`). Adjust these settings based on your project’s requirements:
   - **Trigger**: Specify the branch or branches that will trigger the pipeline.
   - **Pool**: Choose the appropriate agent pool for your pipeline based on the environment where the Terraform tasks will be executed.

   Example:
   ```yaml
   trigger:
     - your-branch-name
   pool: your-pool-name
   ```

### 3. **Create an Azure Service Connection**
   - Create a service connection in Azure DevOps that allows the pipeline to authenticate and manage Azure resources.
   - Name this service connection `Petroleum-pipeline`, or adjust the name in the YAML pipeline as per your setup.

### 4. **Ensure Terraform Backend Configuration**
   Ensure the backend configuration is properly set up in your Azure environment:
   - Resource Group: `pipeline-rg`
   - Storage Account: `pipelinesg`
   - Container Name: `pipelinecn`

   These resources store the Terraform state file (`pipeline.terraform.tfstate`). Adjust the names as needed if your setup differs.

### 5. **Manual Validation Setup**
   - The manual validation step requires specifying users who will approve the Terraform apply action.
   - Ensure that the email addresses in the `notifyUsers` and `approvers` fields are correct and active.

### 6. **Run the Pipeline**
   - Once all configurations are complete, push changes to the specified branch or manually trigger the pipeline from the Azure DevOps interface.
   - The pipeline will execute the Terraform commands in sequence, providing a manual approval stage before applying the changes.

## Key Notes

- Ensure that the **Azure service connection** is configured correctly, and the storage account/container for the backend exists.
- You can modify the pipeline stages to include additional validation, testing, or deployment steps as per your project needs.
- The `ManualValidation` task adds a layer of security to prevent accidental changes without human oversight.
- Always review the Terraform plan before applying changes to production environments.

By following these steps and prerequisites, you can efficiently use this pipeline for managing Terraform deployments in Azure.