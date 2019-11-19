$sqlConn = New-Object System.Data.SqlClient.SqlConnection
$sqlConn.ConnectionString = “Server=server.database.windows.net;Initial Catalog=PPWT;Persist Security Info=False;User ID=masteruser;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Password=XXXXXXX;Connection Timeout=30;"


$sqlConn.Open()

while($true)
{
    $Inbound_Calls = Get-Random -Minimum 50 -Maximum 100
    $Waiting_Now = Get-Random -Minimum 50 -Maximum 100
    $Transfer_Calls = Get-Random -Minimum 50 -Maximum 100
    $Abandoned_Calls = Get-Random -Minimum 50 -Maximum 100
    $Answered_Calls = Get-Random -Minimum 50 -Maximum 100
    $logtime = Get-Date

    $sqlInsKPIs = "INSERT INTO [dbo].[ccKPIs]
               ([Inbound_Calls]
               ,[Waiting_Now]
               ,[Transfer_Calls]
               ,[Abandoned_Calls]
               ,[Answered_Calls]
               ,[logtime])
         VALUES
               ($Inbound_Calls
               ,$Waiting_Now
               ,$Transfer_Calls
               ,$Abandoned_Calls
               ,$Answered_Calls
               ,'$logtime')"

    $numAgents = Get-Random -Minimum 1 -Maximum 10

    for($i= 0; $i -lt $numAgents; $i++){
        $Agent = "Operador " + (Get-Random -Minimum 1 -Maximum 100).ToString()
        $Estado = Get-Random -Minimum 1 -Maximum 4
        $tiempo = Get-Random -Minimum 60 -Maximum 1000

        $sqlInsAgents = "INSERT INTO [dbo].[Agentes]
                   ([Agente]
                   ,[Estado]
                   ,[Tiempo_Estado]
                   ,[logtime])
             VALUES
                   ('$Agent'
                   ,$Estado
                   ,$tiempo
                   ,'$logtime')"


        Write-Output $sqlInsAgents

        $cmd_Agents = new-object System.Data.SqlClient.SqlCommand($sqlInsAgents, $sqlConn)
        $cmd_Agents.ExecuteNonQuery()
    }


    $cmd_KPIs = new-object System.Data.SqlClient.SqlCommand($sqlInsKPIs, $sqlConn)
    $cmd_KPIs.ExecuteNonQuery()
    Start-Sleep -Seconds 2
}
$sqlConn.Close()
