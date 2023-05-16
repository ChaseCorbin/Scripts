<#
comments multiline
#>
#comments inline 
#set variables
$ipv4 = (Get-NetIPAddress | Where-Object -FilterScript { $_.ValidLifetime -Lt ([TimeSpan]::FromDays(14)) }).IPAddress
$checkForservice = get-service -name 'softwareservicename*'
#check if software is already installed for machine if the return is null (none existent) install software
if ($null -eq $checkForservice) {
	Write-Output 'software Not Installed'
	#check IPV4
	if ($ipv4 -match '10.0.1.[0-255]' -or '10.0.2.[0-255]')
	{
        #writing output for testing - not needed
		Write-Output 'ip matches 10.0.1-2.x'
		#install software
		\\test-dc\NETLOGON\xxx1.msi /quiet
	}
	elseif ($ipv4 -match '10.0.3.[0-255]') {
		Write-Output 'IP matches 10.0.3.x'
		\\test-dc\NETLOGON\xxx1.msi /quiet
	}
	elseif ($ipv4 -match '10.0.4.[0-255]') {
		Write-Output 'IP matches 10.0.4.x'
		\\test-dc\NETLOGON\xxx1.msi /quiet
	}
	elseif ($ipv4 -match '10.0.5.[0-255]') {
		Write-Output 'IP matches 10.0.5.x'
		\\test-dc\NETLOGON\xxx1.msi /quiet
	}
	elseif ($ipv4 -match '10.0.6.[0-255]') {
		Write-Output 'IP matches 10.0.6.x'
		\\test-dc\NETLOGON\xxx1.msi /quiet
	}
	elseif ($ipv4 -match '10.0.7.[0-255]') {
		Write-Output 'IP matches 10.0.7.x'
		\\test-dc\NETLOGON\xxx1.msi /quiet
	}
	else {
		Write-Output 'IP not on network'
	}
}
else { 
Write-Output 'software installed'
exit
}
