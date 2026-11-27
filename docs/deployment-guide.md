Deployment Guide – AI-Powered Azure Cloud Incident Assistant

1. Introduction

This guide documents the deployment and configuration of an AI-powered cloud incident investigation lab using Microsoft Azure.

The project combines Azure infrastructure, PowerShell automation, secure credential management, workflow orchestration, and Microsoft Foundry.
The overall solution architecture is documented in:

`docs/architecture/architecture.md`

2. Prerequisites

* An active Microsoft Azure subscription.
* Access to Azure Portal.
* A Microsoft Foundry project.
* Basic familiarity with Azure resources.
* Remote Desktop access to the Azure Virtual Machine.

3. Resource Group

A resource group named rg-ai-incident-lab was created to organise the resources used in the project.

All related Azure resources were deployed into this resource group where supported.

4. Virtual Network and Network Security

An Azure Virtual Network was created to provide network connectivity for the lab.

A Network Security Group was configured to control inbound and outbound traffic.

The VM’s network access was validated during deployment and troubleshooting.

5. Virtual Machine Deployment

A Windows 10 Enterprise 22H2 virtual machine was deployed for the demonstration environment.

The VM was configured with the required networking settings and accessed through Remote Desktop.

Note: Windows 10 Enterprise 22H2 is used here as a historical lab environment, not as a recommended production operating system. Windows 10 reached end of support on October 14, 2025.

6. IIS Installation

Internet Information Services (IIS) was installed on the VM using PowerShell.

Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole -All

The IIS service was checked using:

Get-Service W3SVC

The website was validated by opening:

http://localhost

7. Incident Evidence Collection

PowerShell was used to collect system and service information, including:

* Computer name.
* Operating system.
* IIS service status.
* Port 80 connectivity.
* Incident timestamp.

The collected information was converted into JSON for submission to the Logic App.
The evidence collection script is available in:

`scripts/collect-incident-evidence.ps1`

The script can be executed from an elevated PowerShell session on the Azure Virtual Machine.

8. Azure Key Vault Configuration

An Azure Key Vault named ai-incident-lab-kv was created to store the AI API credential.

The Logic App was configured to retrieve the required secret using its managed identity.

The Key Vault Secrets User role was assigned to the Logic App identity.

9. Microsoft Foundry Configuration

A Microsoft Foundry project was configured, and a GPT-5 mini model deployment was created.

The Foundry Responses API endpoint was used for AI-powered incident analysis.

The API credential was stored in Key Vault rather than hardcoded into the workflow.

10. Logic App Configuration

An Azure Logic App was created to orchestrate the incident investigation process.

The workflow included:

1. HTTP request trigger.
2. Key Vault Get Secret action.
3. HTTP action to Microsoft Foundry.
4. Response action.

The HTTP action was configured to submit incident information to the Foundry Responses API.

The request used the input field required by the Responses API.
The workflow was tested by submitting the incident JSON payload to the Logic App HTTP trigger. The workflow execution history was reviewed to verify the successful execution of the relevant actions.

11. End-to-End Validation

The following activities were performed:

1. Confirmed the IIS website was accessible.
2. Stopped the IIS service to simulate an outage.
3. Checked port 80 connectivity.
4. Collected incident evidence using PowerShell.
5. Submitted the incident information to the Logic App.
6. Verified the workflow’s integration with Key Vault and Microsoft Foundry.
7. Generated an AI-powered incident analysis.
8. The workflow was tested by submitting the incident JSON payload to the Logic App HTTP trigger. The workflow execution history was reviewed to verify the successful execution of the relevant actions.

12. Security Considerations

* Store API credentials in Azure Key Vault.
* Use managed identity for service-to-service access where supported.
* Protect sensitive Logic App inputs and outputs.
* Never publish API keys, passwords, trigger URLs, or secret values.
* Review AI-generated recommendations before taking operational action.

13. Cleanup and Cost Management

Azure resources may continue generating charges while running.

After completing the demonstration:

* Stop or deallocate the VM when it is not needed.
* Review unused public IP addresses and other billable resources.
* Check Azure Cost Management.
* Delete resources that are no longer required, after confirming that project evidence has been saved.

14. Conclusion

This deployment demonstrates practical experience with Azure infrastructure, virtual networking, Windows administration, PowerShell, Logic Apps, Key Vault, managed identity, and Microsoft Foundry integration.
