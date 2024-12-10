AZURE_CLI_COMMANDS
==================

This role is designed to interact with Azure via the CLI. It starts by installing all the necessary packages for the Azure CLI installation. This allows you to log in with `az login` and then set the subscription you will be working with. For this role to work correctly, you need to provide the required environment variables before requesting the Proof of Concept (POC) from the sandbox portal. For example:

-   `SANDBOX_ARM_CLIENT_ID`: Client ID of SP to use as authentication of az cli
-   `SANDBOX_ARM_CLIENT_SECRET` Client secret of SP to use as authentication of az cli
-   `SANDBOX_ARM_SUBSCRIPTION_ID` Subscription id to use as authentication of az cli
-   `SANDBOX_ARM_TENANT_ID` Tenant ID of SP to use as authentication of az cli

If you wish to add more functionalities or implement your architecture, you can start creating tasks after the "Set subscription" task.

TASKS
-----

### Check Variables and Values

Verifies if all the required variables are defined and not empty. If any variable is undefined or empty, the task will fail with an error message. This ensures that the required variables are configured before proceeding with the deployment.

```yml
- name: Check variables and values
  fail:
    msg: "Variable '{{ item }}' is not defined or empty"
  when: item not in vars
  loop: "{{ required_vars }}"
```

### Update Packages

Updates the package cache using the APT package management system on Debian/Ubuntu-based systems. This guarantees that the playbook is executed with the most up-to-date version of available packages on the system. It uses the Ansible `apt` module to perform the package cache update (`update_cache: yes`). The `ignore_errors: yes` parameter is present, ensuring that a failure in updating the package cache won't cause the entire playbook to fail.

### Get Packages Needed for the Pre-Install Process

Installs a series of necessary packages. These packages are prerequisites to ensure that the system has the appropriate dependencies before proceeding with the installation process. It uses the Ansible `apt` module to install packages listed under the `name` parameter. The `loop` parameter is used to iterate over the list of package names and install each one.

Packages include:

-   `apt-transport-https`: Enables APT to download packages using HTTPS.
-   `ca-certificates`: Contains trusted Certificate Authority (CA) certificates, essential for secure connections.
-   `curl`: Command-line tool for transferring data with URLs.
-   `gnupg` (GNU Privacy Guard): Used for encryption, signing, and authentication.
-   `lsb-release` (Linux Standard Base release): Provides information about the Linux distribution and version.

### Download and Install the Microsoft Signing Key

Downloads and installs the Microsoft signing key required to verify the authenticity of Microsoft packages downloaded and installed via APT. It uses the Ansible `shell` module to execute commands, performing the following actions:

-   Creates the `/etc/apt/keyrings` directory if it doesn't exist.
-   Downloads the Microsoft signing key using `curl -sLS`.
-   Decodes the key using `gpg --dearmor` and writes it to `/etc/apt/keyrings/microsoft.gpg`.

### Add the Azure CLI Software Repository

Adds the Azure CLI software repository to the system, allowing APT to search for and access Azure CLI packages from the Microsoft repository. In the shell, the following actions are taken:

-   Assigns the repository name to the `AZ_REPO` environment variable (`AZ_REPO=$(lsb_release -cs)`).
-   Adds a repository line to `/etc/apt/sources.list.d/azure-cli.list` using `sudo tee`.

### Update Packages After Repository Change

Updates the package cache after adding the new Azure CLI repository. This update is important for APT to recognize and access packages in the new repository. It uses the Ansible `apt` module to perform the package cache update (`update_cache: yes`). The `ignore_errors: yes` parameter is present to prevent the entire playbook from failing if the cache update fails.

### Install azure-cli

Installs the `azure-cli` package using the APT package management system. Once installed, Azure CLI is available for interaction with Microsoft Azure services and resources from the command line. It uses the Ansible `apt` module with the `name` parameter set to `"azure-cli"`.

### Azure Login

Logs into Azure using Azure CLI and the credentials of a service principal. After successful completion of this task, you'll be authenticated in Azure and can proceed with operations using Ansible. It uses the Ansible `command` module to run the `az login` command with parameters `-u`, `-p`, and `--tenant`, providing necessary login credentials.

### Set Subscription

Sets the Azure CLI subscription you want to work with. After completing this task, all operations performed with Azure CLI will apply to the specified subscription. It uses the Ansible `command` module to run the `az account set` command with the `--subscription` parameter.

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

@NTTDATA | Digital Tecnology | Digital Architecture