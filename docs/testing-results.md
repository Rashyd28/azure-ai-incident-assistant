Testing Results for AI-Powered Azure Cloud Incident Assistant

1. Testing Objective

The objective was to simulate a real-world IIS website outage, collect system evidence, and process the incident through an automated Azure workflow using Microsoft Foundry.

2. Test Environment

* Azure Virtual Machine
* Windows 10 Enterprise lab environment
* Internet Information Services (IIS)
* Azure Virtual Network (VNet)
* Network Security Group (NSG)
* PowerShell
* Azure Logic Apps
* Azure Key Vault
* Microsoft Foundry – GPT-5 mini

3. Test Scenario: IIS Website Outage

The IIS World Wide Web Publishing Service (W3SVC) was intentionally stopped to simulate a website outage.

Expected Results

* IIS service should report as stopped.
* Port 80 should become inaccessible.
* The website should become unavailable.
* PowerShell should collect the incident evidence.

Observed Results

The IIS service stopped successfully, the local port 80 connectivity test failed, and the website became unavailable.

4. Incident Evidence Collection

PowerShell was used to collect:

* Computer information
* Operating system information
* IIS service status
* Port 80 connectivity
* Incident timestamp

The collected information was converted into JSON and submitted to the Azure Logic App.

5. Automated Incident Analysis

The Azure Logic App workflow performed the following operations:

1. Received the incident information through an HTTP trigger.
2. Retrieved the required API credential from Azure Key Vault.
3. Sent the incident information to Microsoft Foundry.
4. Received an AI-generated incident analysis.

6. Security Validation

* API credentials were stored in Azure Key Vault.
* Managed identity was used for Logic App access to Key Vault.
* Sensitive workflow information was protected where appropriate.
* Credentials and trigger URLs were excluded from public documentation.

7. Overall Result

The lab demonstrated the integration of Azure infrastructure, PowerShell evidence collection, workflow automation, secure secret retrieval, and AI-powered incident analysis.

This was an educational demonstration rather than a production incident management deployment.

8. Supporting Evidence

Screenshots are available in the docs/screenshots directory.
## 9. AI Analysis Validation

The incident information was successfully submitted to the Azure Logic App and processed through Microsoft Foundry using the GPT-5 mini model.

The AI analysis was reviewed to assess whether it could:

* Identify the IIS service outage.
* Interpret the failed port 80 connectivity test.
* Explain the likely impact on website availability.
* Recommend relevant troubleshooting and recovery actions.

The AI-generated analysis demonstrates how generative AI can assist cloud engineers with initial incident investigation and troubleshooting.

