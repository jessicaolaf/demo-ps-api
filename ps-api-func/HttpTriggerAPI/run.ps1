# -------------------------------------------------------------
# This HttpTriggerAPI Azure Function takes an HTTP request with a query string
# or request body that specifies an "apiUrl" parameter.
# It then calls that public API and returns the JSON response.
# ----

using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

# Write to the Azure Functions log stream.
Write-Host "PowerShell HTTP trigger function processed a request."

# Interact with query parameters (?apiUrl = ...)
$apiURL = $Request.Query.apiURL

# If not found in query string, check the body of the request.
if (-not $apiURL) {
    $apiURL = $Request.Body.apiURL
}

# If no API URL was provided, deafault to Microsoft Stock Data
# other test API - ?apiURL=https://api.fda.gov/tobacco/problem.json?count=tobacco_products.exact
if (-not $apiUrl) {
    $apiURL = 'https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=MSFT&apikey=demo'
}

if ($apiURL) {
    try {
        $response = Invoke-RestMethod -Uri $apiUrl -Method GET

        # Return the API response as JSON back to the client
        Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
            StatusCode = [HttpStatusCode]::OK           # HTTP 200
            Headers    = @{ "Content-Type" = "application/json" }
            Body       = $response
        })
    }
    catch {
        # If the API call fails, return error 500
        Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
            StatusCode = [HttpStatusCode]::InternalServerError  # HTTP 500
            Headers    = @{ "Content-Type" = "application/json" }
            Body       = @{ error = $_.Exception.Message }
        })
    }
}


