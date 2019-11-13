$endpointKPIS = "https://api.powerbi.com/beta/7b43cda6-543d-4905-a695-f7bc8d9969ba/datasets/32d1dcdb-f244-42a0-b22c-4014e4ac31a7/rows?key=7pdbkheRck74NFR1PokP%2BsJEDrrAUmdWqmRyO3xGKaITvkx%2Fid99YWrc%2FuX2A6kHBRHeCy8m40mUsOwKopkNRA%3D%3D"

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
    Start-Sleep -Seconds 1


}