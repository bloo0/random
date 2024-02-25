
# Infrastructure


## Deploy the base resources needed for the infrastructure
### S3 Bucket
Utilizing an S3 remote backend for Terraform enhances security, collaboration, and management of your infrastructure. It leverages the scalability, reliability, and security features of AWS S3, making it an ideal choice for storing Terraform state files.

#### Deploy Steps:
1. Navigate to infra directory:
```bash
cd infra/backend-bucket
```

2. Deploy bucket:
```bash
terraform init
terraform plan
terraform apply
```

### IAM
Creating an IAM role for accessing an S3 remote backend for Terraform is a best practice that enhances security, facilitates secure access management, supports compliance and auditing requirements, and enables secure, automated workflows within AWS.

#### Deploy Steps:
1. Navigate to iam directory:
```bash
cd infra/iam
```

2. Deploy iam role:
```bash
terraform init
terraform plan
terraform apply
```


## Develop Terraform Modules
Creating Terraform modules is a foundational practice in infrastructure as code (IaC) for several compelling reasons. Modules in Terraform allow you to organize, reuse, share, and encapsulate code in a way that enhances the manageability, scalability, and maintainability of your infrastructure.

Modules are a key part of leveraging Terraform effectively. They promote code reuse, simplify infrastructure management, ensure consistency, and support best practices in infrastructure as code. By using modules, you can build more manageable, scalable, and secure infrastructure in a way that saves time and reduces the potential for errors.

**Developed the following modules:**
- VPC Network
- ECR
- EKS



## Deploy AWS Resources in order:

### VPC
#### Deploy Steps:
1. Navigate to VPC directory:
```bash
cd infra/prd/vpc
```

2. Update necessary inputs via terraform.tfvars

3. Deploy VPC:
```bash
terraform init
terraform plan
terraform apply
```

### ECR
#### Deploy Steps:
1. Navigate to ECR directory:
```bash
cd infra/prd/resources
```

2. Update necessary inputs via terraform.tfvars

3. Deploy VPC:
```bash
terraform init
terraform plan
terraform apply
```

### EKS
#### Deploy Steps:
1. Navigate to ELS directory:
```bash
cd infra/prd/cluster
```

2. Update necessary inputs via terraform.tfvars

3. Deploy VPC:
```bash
terraform init
terraform plan
terraform apply
```

## Deploy application
Any changes in the **app** directory and commits to **master** branch will trigger Github Actions. 

Using GitHub Actions for CI/CD offers several compelling advantages for automating your development and deployment workflows. It us a powerful, flexible, and integrated solution for automating CI/CD workflows. Its deep integration with GitHub, combined with the broad support for languages, platforms, and community-contributed actions, makes it an excellent choice for teams looking to streamline their development and deployment processes.

Current workflows will do the following:
1. Build the app and create a container image.
2. Push the container image to ECR.
3. Deploy to EKS Cluster


## IMPROVEMENT / TRADE OFFS
#### IaC: Migrate to AWS CDK

Here's why you might opt for AWS CDK over Terraform:
### 1. Programming Language Flexibility

- **AWS CDK**: Allows you to define your cloud infrastructure using familiar programming languages such as TypeScript, Python, Java, and C#. This can make the transition to IaC easier for teams already proficient in these languages, allowing for more complex logic, reusable components, and leveraging existing libraries and tools.
- **Terraform**: Uses its own domain-specific language, HCL (HashiCorp Configuration Language). While HCL is designed to be readable and easy to write, teams not familiar with it will have a learning curve. It doesn't allow the use of conventional programming languages directly, which might limit the ability to apply traditional software development practices and tools.

### 2. Integration with AWS Services

- **AWS CDK**: Being an AWS-native tool, CDK is often quicker to support new AWS features and services. It's deeply integrated into the AWS ecosystem, offering a smoother experience for AWS-centric infrastructure setups. CDK applications can directly utilize AWS best practices, and the AWS Construct Library provides high-level components that pre-configure cloud resources with sensible defaults.
- **Terraform**: While Terraform provides comprehensive support for AWS, there can be a delay in supporting the latest AWS features compared to CDK. Terraform's provider model is extensible and supports multiple cloud providers, but this broad focus might sometimes result in a lag for the newest service features or integrations.

### 3. State Management

- **AWS CDK**: The state of your infrastructure is managed by AWS CloudFormation under the hood, which means you're leveraging AWS's native deployment and state tracking mechanism. This can simplify operations for teams already familiar with CloudFormation but might introduce complexity for those new to it.
- **Terraform**: Manages its own state and offers flexible back-end options for state storage, including local files, cloud storage, or Terraform Cloud. This allows for more control over state management and sharing but requires careful handling to avoid state conflicts and ensure security.

### 4. Deployment and Drift Detection

- **AWS CDK**: Since it uses CloudFormation, CDK benefits from CloudFormation's deployment capabilities and drift detection features. This can be particularly useful for detecting and managing changes that occur outside of the IaC process.
- **Terraform**: Also offers drift detection capabilities and can plan and apply infrastructure changes in a predictable manner. Terraform's state management plays a crucial role in tracking and applying changes.

### 5. Ecosystem and Community

- **AWS CDK**: While growing rapidly, the community around CDK is smaller compared to Terraform. However, being an AWS product, it has strong documentation and support directly from AWS, making it a reliable choice for AWS-focused projects.
- **Terraform**: Has a large and active community, extensive documentation, and a wide range of third-party tools, integrations, and providers. This can be a significant advantage for cross-cloud or multi-cloud environments and for finding solutions to common problems.



#### Use Helm Charts
While plain YAML files can be sufficient for simple applications or those new to Kubernetes, Helm charts offer a more scalable, manageable, and efficient approach for deploying and managing applications as they grow in complexity. Helm's approach to package management, templating, and release management provides significant advantages in real-world Kubernetes environments. Here's why Helm charts are often preferred:

**Template Management**: Helm charts allow you to use templating for your Kubernetes manifests. This means you can define a template for your resources and then use values to customize those resources for different environments (development, staging, production, etc.). Templating reduces duplication and simplifies the management of configurations that vary between deployments.

**Package Management**: Helm is essentially a package manager for Kubernetes. It allows you to package your Kubernetes resources into a single chart. This chart can then be versioned, shared, and reused. This approach is much more efficient than managing individual YAML files, especially as the complexity of your application grows.

**Release Management**: Helm tracks a versioned history of deployments, making it easier to roll back to an earlier deployment version if something goes wrong. This is a significant advantage over using raw YAML files, where you would have to manually manage and apply previous versions of your files to achieve the same result.

**Customization and Reusability**: Helm charts are highly customizable through values.yaml files, which allow you to define variables for different deployment environments or instances. This makes it easy to reuse charts across different projects or environments by simply changing the values file, rather than modifying the core template.

**Community and Ecosystem**: Helm benefits from a strong community and ecosystem. There are thousands of ready-to-use Helm charts available for common applications and infrastructure components. This can significantly reduce the time and effort required to get your application running on Kubernetes.

**Validation**: Helm provides tools to lint and validate charts before deployment. This helps catch issues early in the development process, reducing the risk of deploying misconfigured resources to your Kubernetes cluster.



#### Why use self-managed nodes
It's a strategic choice that need more control and customization over our Kubernetes environment. While EKS offers managed node groups, which simplify the process of running Kubernetes by automating tasks such as updates and scaling, there are several reasons why opt for self-managed nodes:

1. **Customization**: Self-managed nodes offer more flexibility in terms of the underlying EC2 instances. You have the freedom to choose from a wider range of instance types, sizes, and configurations. This is particularly useful for workloads that require specific CPU, GPU, or memory configurations not supported by the managed node groups.

2. **Control Over Updates and Upgrades**: With self-managed nodes, you have finer control over the timing and application of updates and upgrades to the Kubernetes software and the operating system of the nodes. This can be critical for environments where applications have strict compatibility requirements or where changes need to be coordinated closely to ensure zero downtime.

3. **Integration with Existing Infrastructure**: If your organization already has a well-established infrastructure and processes for managing EC2 instances, including custom AMIs (Amazon Machine Images), networking setups, or security configurations, self-managed nodes can seamlessly integrate into these processes without the need for significant changes.

4. **Cost Optimization**: Self-managed nodes can potentially offer cost savings in certain scenarios. For example, you can utilize Spot Instances more aggressively or tailor the instance types and sizes to the specific needs of your workloads more precisely than with managed node groups, leading to more efficient resource utilization and cost savings.

5. **Advanced Networking**: Self-managed nodes allow for more complex networking configurations, including the use of custom VPCs (Virtual Private Clouds), specific subnet selections, and direct control over the networking interfaces and security groups applied to each node.

6. **Compliance and Security**: For organizations with stringent compliance and security requirements, self-managed nodes provide the ability to implement custom security configurations, patches, and compliance checks. This level of control is essential in highly regulated industries or for workloads that handle sensitive data.

7. **Use of Custom AMIs**: Self-managed nodes allow you to use custom AMIs that might include specific security hardening, pre-installed software, or configuration settings required by your organization. This level of customization is not available with managed node groups.

While self-managed nodes offer these advantages, they also come with the responsibility of managing, scaling, and securing the nodes yourself. This includes tasks like monitoring for and applying security patches, manually scaling the number of nodes, and troubleshooting node issues. For organizations with the expertise and infrastructure to handle these tasks, self-managed nodes can provide the necessary flexibility and control over their Kubernetes environments.
