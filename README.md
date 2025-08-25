# 🚀 Azure Function App (PowerShell)

This repository contains an **Azure Function App** written in **PowerShell**.  
The function is designed to call external/public APIs via an HTTP trigger and return the results in JSON format.  

---

## 📂 Repository Structure  

| File | Description |
|------|-------------|
| `extensions.json` | Recommended VS Code extensions for this project. |
| `launch.json` | Debugging configuration for VS Code. |
| `settings.json` | Local project/app settings (VS Code). |
| `tasks.json` | VS Code task configuration for building/running. |
| `function.json` | Defines the trigger & binding configuration for the function. |
| `run.ps1` | Main function code — executes when the function is triggered. |
| `sample.dat` | Example input/output data for testing. |
| `.funcignore` | Files excluded when publishing to Azure Functions. |
| `.gitignore` | Files ignored by Git. |
| `host.json` | Global configuration options for the Azure Functions host. |
| `profile.ps1` | Profile script loaded by Azure Functions runtime before execution. |
| `requirements.psd1` | PowerShell modules required for this function. |


---

## ⚡ How It Works  

1. The function is triggered via **HTTP** (GET or POST).  
2. You pass an API URL as a query parameter (`?apiUrl=...`) or in the JSON body. if none is passed it defaults to MSFT stock prices https://www.alphavantage.co/documentation/#daily
3. The function makes a request to the provided API and returns the response as JSON.  

---

## ▶️ Running Locally  

### Prerequisites  
- [Install Azure Functions Core Tools](https://learn.microsoft.com/azure/azure-functions/functions-run-local)  
- [Install Powershell extension in vscode](https://code.visualstudio.com/docs/languages/powershell)  
- [Install Azure Functions extension](https://code.visualstudio.com/) 


### Steps  
```bash
# Start function locally
cd .\ps-api-func\
func host start
```

Test the function:  
```bash
curl "http://localhost:7071/api/HttpTriggerAPI?apiUrl=https://api.fda.gov/tobacco/problem.json?count=tobacco_products.exact"
curl "http://localhost:7071/api/HttpTriggerAPI"
```

Other tools like Postman can be used as well
---

## ▶️ Deployment using GitHUb Action

This repository contains two CI/CD pipelines designed for deploying application functions and infrastructure resources:

| Pipeline Name | Description |
|------|-------------|
| `func-deploy` | Deploys the application functions. |
| `infra-deploy` | Deploys infrastructure resource using infrastructure‑as‑code (Terraform). |


## 🚀 Usage

GET request (query string):  
```bash
curl "https://psapi-demo-func.azurewebsites.net/api/HttpTriggerAPI?apiUrl=https://api.fda.gov/tobacco/problem.json?count=tobacco_products.exact"
```

GET request (body):  
```bash
curl -X POST "https:///psapi-demo-func.azurewebsites.net/api/HttpTriggerAPI" `
     -H "Content-Type: application/json" `
     -d '{ "apiUrl": "https://api.fda.gov/tobacco/problem.json?count=tobacco_products.exact" }'
```