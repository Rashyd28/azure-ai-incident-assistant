Azure Cloud Incident Assistant – Architecture

1. Architecture Overview

The AI-Powered Azure Cloud Incident Assistant is a demonstration solution that combines Azure infrastructure, PowerShell automation, secure credential management, workflow orchestration, and artificial intelligence.

The solution simulates an IIS website outage on an Azure Virtual Machine, collects incident evidence, and submits the information to an Azure Logic App for AI-powered analysis using Microsoft Foundry.

2. Architecture Components

Component	Purpose
Azure Virtual Machine	Hosts the Windows lab environment
Internet Information Services (IIS)	Hosts the test website
Azure Virtual Network (VNet)	Provides network isolation and connectivity
Network Security Group (NSG)	Controls network traffic
PowerShell	Collects system and incident evidence
Azure Logic Apps	Orchestrates the incident analysis workflow
Azure Key Vault	Securely stores the AI API credential
Managed Identity	Allows the Logic App to access Key Vault
Microsoft Foundry	Provides the AI model endpoint
GPT-5 mini	Analyses incident information and generates recommendations

3. Architecture Workflow

1. An IIS website runs on the Azure Virtual Machine.
2. A simulated incident is created by stopping the IIS World Wide Web Publishing Service (W3SVC).
3. PowerShell checks the service status and port 80 connectivity.
4. The collected incident information is converted into JSON.
5. The incident information is submitted to the Logic App HTTP trigger.
6. The Logic App retrieves the required API credential from Azure Key Vault.
7. The Logic App sends the incident information to the Microsoft Foundry endpoint.
8. GPT-5 mini analyses the incident and generates troubleshooting recommendations.
9. The workflow returns the AI response.

4. Architecture Diagram

flowchart TD
    A[Azure Virtual Machine] --> B[IIS Website]
    B --> C[Simulated Website Outage]
    C --> D[PowerShell Evidence Collection]
    D --> E[Logic App HTTP Trigger]
    E --> F[Azure Key Vault]
    F --> G[Microsoft Foundry API]
    G --> H[GPT-5 mini]
    H --> I[AI Incident Analysis]
    I --> J[Logic App Response]

5. Security Design

* Azure Key Vault stores the API credential.
* The Logic App uses managed identity to access Key Vault.
* The Key Vault role assignment uses Key Vault Secrets User.
* Sensitive workflow information is protected where appropriate.
* Credentials, secret values, and HTTP trigger URLs are excluded from public documentation.

6. Architecture Limitations

This is a demonstration environment.

* Incident submission is initiated through a PowerShell HTTP request rather than continuous automatic monitoring.
* AI-generated recommendations require human review.
* The solution does not automatically repair the affected infrastructure.
* The lab is not intended for production use.

7. Conclusion

The architecture demonstrates how Azure infrastructure, PowerShell, Logic Apps, Key Vault, managed identity, and Microsoft Foundry can be integrated to support AI-assisted cloud incident investigation.
