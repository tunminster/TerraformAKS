<h1>Terraform solution </h1>

This solution includes several placeholders for creating the Azure infraestructure for Howdens' TDP Platform.

Please note that at its current stage doesn't reflect the final infraestructure, but provides an advanced starting point for creating said infraestructure and integrating it into an Azure DevOps deployment pipeline.


<h2>1. Pre-requisites</h2>

<h3>1.1 Azure access and Service Principal</h3>
In order to connect Terraform to your Azure account, you must know your "Subscription ID" and your "Tenant ID", also, and for authentication pourposes, you must create a a Service Principal application and an access key, we'll referer to these as "Client ID" and "Client Secret" respectively. Finally, you should grant it permissions for creating or deleting resources in your Azure account by adding it to the "Contributor" role group.

Where to find all those IDs?

* Subscription ID: you should find your subscription ID GUID under the <a href="https://portal.azure.com/#blade/Microsoft_Azure_Billing/SubscriptionsBlade">subscriptions</a> section of your azure portal.
* Tenant ID: this will appear as "Directory ID" under "<a href="https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview">Azure Active Directory</a> > Manage > <a href="https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Properties">Properties</a>"

As for creating the Service Principal and getting its details, please refeer to <a href="https://docs.microsoft.com/en-us/azure/active-directory/develop/howto-create-service-principal-portal">this</a> guide at microsoft.com.

After you have all these details, you must expose them to the terraform scripts:

In your Development machine, inside the "scripts" folder, create a file named "terraform-env_dev.sh" and add them as:

```
ARM_SUBSCRIPTION_ID=<your_azure_subscription_guid>
ARM_TENANT_ID=<your_azure_tenant_guid>
ARM_CLIENT_ID=<the_service_principal_guid>
ARM_CLIENT_SECRET=<the_service_principal_key>
```

In the VSTS environment, you must setup these details as the following environment variables:

```
ARM_SUBSCRIPTION_ID
ARM_TENANT_ID
ARM_CLIENT_ID
ARM_CLIENT_SECRET
```

Also, you need to pass on the Azure AKS Service Principal credentials, add them as the environment variables:
```
TF_VAR_aks_client_id
TF_VAR_aks_client_secret
```

<h3>1.2 Development Machine</h3>

The development environment used is <b>Ubuntu for Windows</b>, running in top of Windows 10.

1) Enable "Windows Subsystem for Linux" in your Windows machine. Run the following PowerShell command:

```
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

or refer to <a href="https://docs.microsoft.com/en-us/windows/wsl/install-win10">this page</a> for more detailed installation instructions,<br />



2) Install Ubuntu for Windows (<a href="https://www.microsoft.com/en-us/p/ubuntu/9nblggh4msv6">Windows store link</a>).<br/>

Windows Enterprise might have the Windows Store disabled, but you can still sideload Ubuntu for Windows.

First, go to "Settings > Update & Security > For developers" and activate the "Developer mode", then, from a PowerShell prompt type the following commands:
```
$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile Ubuntu_1804.appx -UseBasicParsing
 ren .\Ubuntu_1804.appx .\Ubuntu_1804.zip
Expand-Archive -Path .\Ubuntu_1804.zip -DestinationPath .\Ubuntu_1804
.\Ubuntu_1804\ubuntu1804.exe
```
and follow the installation instructions


3) Install Git, Azure-Cli and Terraform in Ubuntu for Windows (for an automatic process run the install.sh file inside the scripts folder)<br/>
   Please note that at the time of this writting, Azure DevOps (VSTS) is still using Terraform v0.11.8. To maintain the consistency of the terraform state between the VSTS and the development environments you must use the same version.
   If VSTS uses a different version you should edit the install script and change the version accordingly before you perform any Terraform tasks.



<h3>2. VSTS (Azure DevOps)</h3>

For creating the Pipelines you need to use the "Hosted Ubuntu 16.04" agent.

There's two stages, "create" and "destroy", both of them should be setup for manual triggering in order to control the availability of the resources.

the scripts "terraform-create.sh" and "terraform-destroy.sh" will perform said tasks, while performing additional checks and setting up the minimal resources needed in order to keep the Terrform state consistent between runs and/or development machines.

the only command line parameter they allow is the selected environment (or "Workspace" in Terraform terms) those are "dev", "qa", "pre" and "pro".

The working directory should always be the one with the terraform scripts.

For a simple "Create" pipeline, the basic parameters for the pipeline should be:

```
Script path: scripts/terraform-create.sh
Arguments: dev
Working Directory: terraform
```

as for the "Destroy" proccess, the pipeline is equally straightforward:

```
Script path: scripts/terraform-destroy.sh
Arguments: dev
Working Directory: terraform
```

Please note that creating or destroying resources in Azure could take quite some time, Terraform output will inform you of its current task and how long is taking to create the different resources.
