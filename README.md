AI-Powered Azure Cloud Incident Assistant

Project Overview

The AI-Powered Azure Cloud Incident Assistant is a cloud engineering demonstration project that uses Microsoft Azure services, PowerShell automation, and artificial intelligence to investigate simulated infrastructure incidents.

The project demonstrates how an Azure-based workflow can collect incident information, securely retrieve an AI API key, and use Microsoft Foundry to generate an incident analysis and troubleshooting recommendations.

Project Objectives

* Simulate a real-world cloud infrastructure incident.
* Collect system and service health information using PowerShell.
* Send incident information to an Azure Logic App.
* Securely retrieve API credentials from Azure Key Vault.
* Use a Microsoft Foundry AI model to analyse the incident.
* Generate troubleshooting recommendations.

Architecture

The workflow follows this sequence:

1. An IIS website runs on an Azure Windows virtual machine.
2. PowerShell collects system and service information.
3. A simulated IIS outage generates incident evidence.
4. The incident information is submitted to an Azure Logic App.
5. Azure Key Vault securely supplies the required API credential.
6. Microsoft Foundry (GPT-5 mini) analyses the incident.
7. The workflow returns an AI-generated incident analysis.

Azure Services and Technologies

* Azure Virtual Machines
* Azure Virtual Network (VNet)
* Network Security Groups (NSGs)
* Internet Information Services (IIS)
* Azure Logic Apps
* Azure Key Vault
* Microsoft Foundry
* GPT-5 mini
* PowerShell
* Windows Server/Windows client lab environment

Incident Simulation

A simulated website outage was created by stopping the IIS World Wide Web Publishing Service (W3SVC).

The project collected evidence including:

* IIS service status
* Port 80 connectivity
* Computer information
* Incident description
* Timestamp

The collected information was sent to the Logic App for AI-powered analysis.

Security Implementation

* API credentials were stored in Azure Key Vault.
* Logic App access to Key Vault was configured using managed identity.
* Sensitive workflow inputs and outputs were protected where appropriate.
* Credentials, API keys and trigger URLs must not be published in this repository.
* AI-generated recommendations are advisory and do not automatically execute infrastructure changes.

Testing and Validation

The following project activities were performed:

* Verified that the IIS website was accessible.
* Stopped the IIS service to simulate an outage.
* Confirmed that port 80 was inaccessible during the outage.
* Collected incident evidence using PowerShell.
* Submitted incident information to the Logic App.
* Verified the workflow’s integration with Key Vault and Microsoft Foundry.
* Generated an AI incident analysis.

Lessons Learned

This project provided practical experience with:

* Azure resource deployment and configuration.
* Network security and connectivity troubleshooting.
* PowerShell-based evidence collection.
* Logic App workflow automation.
* Managed identity and Key Vault access.
* Integrating Microsoft Foundry with Azure services.
* Troubleshooting API request and response issues.

Future Improvements

* Add automated monitoring and alerting.
* Integrate Azure Monitor and Log Analytics.
* Support multiple incident types.
* Add automated incident classification.
* Build a dashboard for incident reporting.
* Explore controlled remediation with human approval.


Project Category: Cloud Engineering | AI Automation | Azure Infrastructure
