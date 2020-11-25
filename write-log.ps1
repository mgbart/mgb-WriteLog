
$StartPath = "$PSScriptRoot"
$LogPath = "$StartPath" + "\LOG\"
	
if (Test-Path $LogPath) { "" }
Else { mkdir $LogPath | Out-Null }
	
$CurrentDateTime = get-date -format yyyy-MM-dd___HH-mm-ss	
$LogFile = "$LogPath" + "LOG_" + $CurrentDateTime + ".txt"

function Write-Log($Info, $Status)
{
    switch($Status)
    {
        Info    {Write-Host $Info -ForegroundColor Green  ; $Info | Out-File -FilePath $LogFile -Append}
        Status  {Write-Host $Info -ForegroundColor Yellow ; $Info | Out-File -FilePath $LogFile -Append}
        Warning {Write-Host $Info -ForegroundColor Yellow ; $Info | Out-File -FilePath $LogFile -Append}
        Error   {Write-Host $Info -ForegroundColor Red    ; $Info | Out-File -FilePath $LogFile -Append}
        default {Write-Host $Info -ForegroundColor white  ; $Info | Out-File -FilePath $LogFile -Append}
    }
}
