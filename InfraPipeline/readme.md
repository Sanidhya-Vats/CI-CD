

---

# CI/CD Pipeline for Infrastructure Provisioning in Azure DevOps

This repository provides a set of YAML configuration files for setting up Continuous Integration and Continuous Deployment (CI/CD) pipelines in Azure DevOps. The `.pipeline` folder contains multiple YAML files that define different stages, steps, and jobs for deploying resources using **Terraform**.

This README explains how to link these YAML files to Azure DevOps and set up a CI/CD pipeline that automates infrastructure deployment.

## Features

- **Multi-stage pipeline**: Includes multiple stages like build, test, and deploy.
- **Modular design**: Multiple YAML files for specific pipeline steps (e.g., staging, jobs, or steps) that can be linked together.
- **Terraform automation**: Automates infrastructure provisioning using Terraform scripts.
- **Azure DevOps integration**: Simplifies integration with Azure DevOps and automates resource management on Azure.

## Folder Structure

```
InfraPipeline/
├── .pipeline/
│   ├── stages-pipeline.yml          # Multi-Stage Azure Pipeline configuration
│   ├── jobs-pipeline.yml         # Jobbed Azure Pipeline configuration
│   ├── steps-pipelines.yml        # Stepped Azure Pipeline configuration
│   └── README.md                   # Documentation for pipeline configurations
├── environments/dev               # Terraform configurations for infrastructure provisioning
└── modules/                       # Modular Terraform configurations for provisioning infrastructure
```

- **.pipeline/stages-pipeline.yml**: The YAML file that have multiple Stages for Testing , Planning and Deployment.
- **.pipeline/jobs-pipeline.yml**: The YAML file that have multiple Jobs .
- **.pipeline/steps-pipelines.yml **: The YAML file that have multiple Tasks .

Each YAML file is intended for different stages, steps, or jobs in your pipeline, allowing for modular and easy-to-manage pipeline configurations.

## Prerequisites

Before setting up your Azure DevOps pipeline, ensure you have the following prerequisites:

- **Azure DevOps Organization**: An Azure DevOps account and a project where you will configure the pipeline.
- **Azure Subscription**: Access to an active Azure subscription to provision resources.
- **Service Connection**: An Azure service connection configured in Azure DevOps to authenticate the pipeline with your Azure subscription.
- **Terraform**: Ensure Terraform is installed and configured for your infrastructure provisioning.
- **Git**: Installed to clone the repository.

## Setting Up the Azure DevOps Pipeline

### 1. Clone the Repository

Clone this repository to your local machine or directly within your Azure DevOps project.

```bash
git clone https://github.com/Sanidhya-Vats/CI-CD.git
cd CI-CD/InfraPipeline
```

### 2. Create a New Pipeline in Azure DevOps

- Navigate to your **Azure DevOps** project.
- Go to the **Pipelines** section.
- Click **New Pipeline** and select **Azure Repos Git** as the source.
- Choose the repository that contains the pipeline YAML files.
- When prompted for a pipeline configuration, select **YAML** and point it to the `.pipeline/stages-pipeline.yml` file.

### 3. Link the YAML Files

In Azure DevOps, the pipeline is structured using multiple stages YAML files for different steps or jobs. The main pipeline YAML (`stages-pipeline.yml`) 


### 4. Configure Service Connections and Variables

- **Service Connection**: Set up a service connection in Azure DevOps under **Project Settings > Service Connections** to enable Azure DevOps to authenticate with your Azure subscription. Make sure to reference this service connection in the yaml.

### 5. Commit and Push Changes

Once the YAML file is configured, commit the changes to your repository to trigger the pipeline.

```bash
git add .
git commit -m "Add Azure Pipeline configuration"
git push origin main
```

### 6. Monitor the Pipeline

After pushing the changes, go to the **Pipelines** section in Azure DevOps and monitor the pipeline's progress. Each stage defined in the YAML file will be executed, running the appropriate steps to provision your resources using Terraform.

## Contributing

We welcome contributions! If you have suggestions or improvements for the pipeline configurations, feel free to open a pull request.

### How to Contribute

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-name`).
3. Make your changes.
4. Commit your changes (`git commit -am 'Add new feature'`).
5. Push to the branch (`git push origin feature-name`).
6. Open a pull request.

## License

This repository is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

This README outlines how to set up, configure, and use multiple YAML files to create a modular Azure DevOps pipeline for deploying resources using Terraform. It also includes instructions for linking and managing each YAML file as part of a cohesive pipeline in Azure DevOps.
