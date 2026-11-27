# AI-Powered Azure Cloud Incident Assistant
# Collects IIS service and port connectivity evidence

$service = Get-Service W3SVC

$port = Test-NetConnection 127.0.0.1 -Port 80 -WarningAction SilentlyContinue

$incident = [PSCustomObject]@{
    Incident = "IIS Website Outage"
    Computer = $env:COMPUTERNAME
    OperatingSystem = (Get-CimInstance Win32_OperatingSystem).Caption
    ServiceName = "W3SVC"
    ServiceStatus = $service.Status.ToString()
    Port = 80
    PortAccessible = $port.TcpTestSucceeded
    Timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
}

# Display incident evidence as JSON
$incident | ConvertTo-Json -Depth 3
