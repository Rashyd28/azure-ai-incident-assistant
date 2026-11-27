# Project Evidence

This folder contains supporting documentation and evidence for the AI-Powered Azure Cloud Incident Assistant project.
## End-to-End Testing

The project was tested by simulating an IIS website outage on the Azure Virtual Machine.

### Test Procedure

1. Confirmed that the IIS web service was running.
2. Accessed the IIS website locally.
3. Stopped the IIS service using PowerShell to simulate an outage.
4. Checked the service status and tested port 80 connectivity.
5. Executed the PowerShell incident evidence collection script.
6. Submitted the incident JSON to the Azure Logic App HTTP trigger.
7. The Logic App retrieved the API credential from Azure Key Vault.
8. The Logic App sent the incident information to Microsoft Foundry.
9. GPT-5 mini generated an AI-powered incident analysis.
10. Reviewed the workflow execution and AI-generated response.

### Expected Results

- IIS service reports as stopped during the simulated outage.
- Port 80 is inaccessible locally.
- PowerShell produces incident evidence in JSON format.
- The Logic App executes the incident analysis workflow.
- Microsoft Foundry returns an AI-generated incident analysis.

### Testing Note

This is a controlled demonstration environment. AI-generated findings are advisory and should be validated by a human engineer before taking corrective action.
