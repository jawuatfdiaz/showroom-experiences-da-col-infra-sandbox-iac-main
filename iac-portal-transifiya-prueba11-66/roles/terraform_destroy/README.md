terraform_destroy
=================

The `terraform_destroy` role automates the destruction of the infrastructure defined in the template phase using Terraform. The main objective is to safely and efficiently remove all previously deployed resources. Additionally, this role, as it is expected to run when the demo destruction is scheduled on the demo portal, uses specific tasks to clone the repository of the constructed infrastructure. For this role to work correctly, you need to provide the required environment variables before requesting the Proof of Concept (POC) from the sandbox portal. For example:

-   `SANDBOX_ARM_CLIENT_ID`: Client ID of SP to use as authentication of az cli
-   `SANDBOX_ARM_CLIENT_SECRET` Client secret of SP to use as authentication of az cli
-   `SANDBOX_ARM_SUBSCRIPTION_ID` Subscription id to use as authentication of az cli
-   `SANDBOX_ARM_TENANT_ID` Tenant ID of SP to use as authentication of az cli
-   `PARAM_CODE`: Auth code provided by the showroom experiences microservices use to notify the events in the role
-   `NOTIFICATION_URL` URL provided by the showroom experiences microservices use to notify the events in the role
-   `POC_ID` id of the requested poc provided by the showroom experiences microservices use to notify the events in the role
-   `GITHUB_USERNAME`: Own github username to use as authentication to github
-   `GITHUB_TOKEN`: Own github token to use as authentication to github 

If you wish to add more functionalities or implement your architecture, you can start creating tasks after the "Terraform destroy" task.

tasks
-----

### Download Terraform

Downloads the Terraform zip file for version 1.5.0 from the official site and saves it in the destination directory `/tmp/terraform.zip`.

### Unzip Terraform

Unzips the previously downloaded Terraform zip file and places it in the directory `/usr/local/bin`.

### Remove zip file

Deletes the Terraform zip file after it has been extracted. Uses the `file` module and sets the state to "absent" to remove the file.

### Add Terraform to PATH

Adds the location of Terraform to the system's PATH so that Terraform can be executed globally.

### Query current repository

Performs a GET request to a notification URL to obtain information about the current repository, saving its state in the `query_current_repository_response` register.

### Install jmespath library

Installs the jmespath Python library using pip.

### Get JSON Response

Extracts and stores the repository name in the `repositoryName` variable from the JSON response obtained from the `query_current_repository_response` register.

### Set new variable with username and password

Creates a variable `authenticated_repository_url` for the repository using the provided GitHub credentials.

### Remove folder

Deletes the folder containing the cloned repository at the path `{{ playbook_dir }}/roles/terraform_destroy/files/github_repository`, changing its state to "absent".

### Clone Git Repository

Clones the authenticated repository using the URL generated in the "Set new variable with username and password" task.

### Terraform init

Initializes the Terraform project in the directory of the cloned repository at the path `{{ playbook_dir }}/roles/terraform_destroy/files/github_repository`.

### Terraform destroy

Executes the `terraform destroy` command to remove all infrastructure resources in the directory of the cloned repository at the path `{{ playbook_dir }}/roles/terraform_destroy/files/github_repository`.

Example Playbook
----------------

yamlCopy code

```yaml
- name: Download Terraform
  get_url:
    url: https://releases.hashicorp.com/terraform/1.5.0/terraform_1.5.0_linux_amd64.zip
    dest: /tmp/terraform.zip`
```
Important Notes
---------------

-   Ensure that you correctly configure the variables for GitHub authentication.
-   These tasks are designed to enhance automation and collaboration in infrastructure development.
-   Run the playbook using the command: `ansible-playbook playbook.yml`.

License
-------

BSD

Author Information
------------------

@NTTDATA | Digital Technology | Digital Architecture