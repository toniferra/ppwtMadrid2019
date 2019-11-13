 Create Table ccKPIs(
	Inbound_Calls  INT
	,Waiting_Now INT
	,Transfer_Calls INT
	,Abandoned_Calls INT
	,Answered_Calls INT
	,logtime datetime
)

create table Agentes(
	Agente nvarchar(100)
	,Estado nvarchar(20)
	,Tiempo_Estado int
	,logtime datetime
	)
 
 create view KPIS as
 Select * from cckpis where logtime = (select max(logtime) from cckpis)

 Create view Agents as
 select * from Agentes where logtime = (select max(logtime) from Agentes)

