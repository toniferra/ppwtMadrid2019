$endpointKPIS = "https://api.powerbi.com/beta/7b43cda6-543d-4905-a695-f7bc8d9969ba/datasets/3c0f62a5-048c-4df0-a095-d282ea5827c7/rows?noSignUpCheck=1&key=RcQjhegqAJ77xoYl5rGCBP1LkqDhK2ThryTQF2LaHmQdo%2BMkGYDYXhjOTe%2BlwP%2Fjg4SwFbSgLX%2F70w6Rk6I9rw%3D%3D"
$endpointAgent = "https://api.powerbi.com/beta/7b43cda6-543d-4905-a695-f7bc8d9969ba/datasets/31cdf760-7df2-4537-afba-fe021872b68d/rows?key=rrzGe37DVjwSZxE9o9ghbqiz3bRif%2BChDJl5HNCAw%2BgVqyyinrcOPxuWqfsT127B2tA26%2F4mU5BM9zMI9SNEtw%3D%3D"

while($true){
    $Inbound_Calls = Get-Random -Minimum 50 -Maximum 100
    $Waiting_Now = Get-Random -Minimum 50 -Maximum 100
    $Transfer_Calls = Get-Random -Minimum 50 -Maximum 100
    $Abandoned_Calls = Get-Random -Minimum 50 -Maximum 100
    $Answered_Calls = Get-Random -Minimum 50 -Maximum 100
    $logtime = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ss.000Z");

    $numAgents = Get-Random -Minimum 10 -Maximum 20

    Write-Output $logtime

    $KPIs = @{
        "Inbound_Calls" =$Inbound_Calls
        "Waiting_Now" =$Waiting_Now
        "Transfer_Calls" =$Transfer_Calls
        "Abandoned_Calls" =$Abandoned_Calls
        "Answered_Calls" =$Answered_Calls
        "logtime" =$logtime
    }
    Invoke-RestMethod -Method Post -Uri "$endpointKPIS" -Body (ConvertTo-Json @($KPIs))
    
    $AgentGroup = New-Object System.Collections.ArrayList
    $AgentGroup.Clear()

    for($i= 0; $i -lt $numAgents; $i++){
        $Agent = "Operador " + (Get-Random -Minimum 1 -Maximum 100).ToString()
        $Estado = Get-Random -Minimum 1 -Maximum 4
        $tiempo = Get-Random -Minimum 60 -Maximum 1000
        $AgentData = @{
            "Agente" =$Agent
            "Estado" = $Estado
            "Tiempo_Estado" = $tiempo
            "logtime" = $logtime
            }
        $AgentGroup.Add($AgentData)
    }
    Invoke-RestMethod -Method Post -Uri "$endpointAgent" -Body (ConvertTo-Json @($AgentGroup))
    Start-Sleep -Seconds 1


}