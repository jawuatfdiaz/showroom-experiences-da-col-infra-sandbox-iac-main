Welcome to the Template Sandbox IaC Repository
==============================================

![Showroom Experience Logo](https://chat.openai.com/link_to_logo_image)

Introduction
------------

The Template Sandbox IaC repository is the cornerstone of the Showroom Experience initiative, designed to empower developers, architects, and creators within our organization with a unified and automated solution for building and sharing Proof of Concepts (POCs) effectively. This repository serves as the foundation for seamless infrastructure deployment, allowing you to focus on innovation while eliminating the complexities of setup and configuration.

What is Showroom Experience?
----------------------------

Showroom Experience is a comprehensive solution that streamlines the process of creating, sharing, and deploying Proof of Concepts across our organization. Whether you have a groundbreaking idea or a unique solution, the Showroom Experience aims to provide a centralized platform for showcasing, sharing, and deploying your creations. By leveraging the capabilities of this repository, you can contribute to the collective knowledge and facilitate collaboration among developers.

Repository Structure
--------------------

The repository is structured as follows:

-   `.github/workflows`: Contains GitHub Actions workflow definitions.
-   `roles`: Houses Ansible roles, each designed to perform specific tasks.
-   `deploy.yml`: Ansible playbook for deploying infrastructure.
-   `destroy.yml`: Ansible playbook for destroying infrastructure.
-   `test_deploy.yml` and `test_destroy.yml`: Test playbooks for verifying deployment and destruction in local environment, to reduce the wuantity of tasks that specific roles do, and to not have dependeicy with an instance of the poc in the web portal.
-   `README.md`: This README file.

Workflows and Automation
------------------------

The main workflow in `.github/workflows/main.yml` orchestrates the deployment and destruction of infrastructure. When triggered by the Showroom Experience portal, it executes the `deploy.yml` and `destroy.yml` playbooks respectively. GitHub Actions and Ansible work in harmony to ensure seamless execution of tasks.


Deploying Your POCs
-------------------

1.  Customize Roles: In the `roles` directory, you can tailor existing roles or create new ones to match your deployment requirements.

2.  Configure Environment Variables: Prior to deployment, set the required environment variables. These variables ensure secure and efficient execution of the deployment process.

3.  Invoke Deployment: Using the Showroom Experience portal, you can trigger the deployment process. The main workflow kicks in, executing the `deploy.yml` playbook.

4.  Automated Infrastructure Setup: Ansible roles perform specific tasks, such as GitHub repository creation, Terraform setup, and Azure CLI commands. Your infrastructure will be automatically configured and ready for use.

5.  Efficient Destruction: When your POC's lifecycle ends, use the Showroom Experience portal to initiate destruction. The `destroy.yml` playbook is executed, ensuring a clean and efficient removal of resources.

Key Features
------------

-   Automated Infrastructure: The roles and tasks defined in this repository automate the deployment of infrastructure resources, enabling you to rapidly bring your ideas to life.

-   Consistency: Eliminate inconsistencies and errors by adopting the standardized automation process provided by the roles in this repository.

-   Efficiency: With pre-configured Ansible roles, you can focus on developing your solution rather than wrestling with complex infrastructure setup.

-   Centralized Repository: This repository serves as a hub for managing the entire lifecycle of your Proof of Concepts, from deployment to showcasing and sharing.

-   Seamless Integration: Connect your solution to the Showroom Experience portal to make it available for deployment to a wider audience, fostering collaboration and knowledge-sharing.

Getting Started
---------------

Ready to dive in? Here's how you can get started with the Template Sandbox IaC repository:

1.  Fork this Repository: Begin by forking this repository into your own GitHub account.

2.  Configure Variables: Configure the required environment variables for authenticating with GitHub, Azure, and other services, ensuring a smooth deployment experience.

3.  Choose a Role: Explore the provided Ansible roles within the repository, such as `terraform_common`, `terraform_install`, `terraform_destroy`, and more. These roles cover various aspects of infrastructure deployment, management, and destruction.

4.  Customize and Develop: Tailor the roles to your specific needs and build your unique Proof of Concept.

5.  Connect to Showroom Experience: Once your solution is ready, integrate it with the Showroom Experience portal to make it accessible to the community.


Required Environment Variables
------------------------------

The following environment variables are essential for validating GitHub repository creation and access, and should be provided by the user when submitting a request (Please check the github action pipeline):

-   `SETUP_GITHUB_USERNAME`
-   `SETUP_GITHUB_TOKEN`
-   `SETUP_GITHUB_USERNAME_COLLABORATOR`
-   `SETUP_GITHUB_REPOSITORY_NAME`
-   `SETUP_NOTIFICATION_URL`
-   `SETUP_NOTIFICATION_POC_ID`
-   `SETUP_NOTIFICATION_PARAM_CODE`
-   `SETUP_COST_CENTER`
-   `SETUP_OWNER_DEPLOY`
-   `SETUP_OWNER_POC`
-   `SETUP_POC_ID`
-   `SETUP_DEPLOY_ID`

Additionally, the following variables, provided by the developer, are reserved for security purposes:

-   `SETUP_SANDBOX_ARM_CLIENT_ID`
-   `SETUP_SANDBOX_ARM_CLIENT_SECRET`
-   `SETUP_SANDBOX_ARM_TENANT_ID`
-   `SETUP_SANDBOX_ARM_SUBSCRIPTION_ID`

Contribute and Collaborate
--------------------------

We encourage you to contribute your innovations to this repository and collaborate with fellow developers. Your contributions will help enrich the collective knowledge, foster collaboration, and accelerate the development of impactful solutions.

Need Help?
----------

If you have any questions, encounter issues, or would like to share your experience, feel free to engage with our community. Type us an email to: [Showroom Experience Community Email](jcorremo@emeal.nttdata.com)

