
param([string]$Drive = "", [int]$MinLevel = 5)

﻿<#
This PowerShell script checks a drive for free space left, with a minimum of 5 GB. 

Usage:
PS> ./check-drive-space C

Link: 
github.com/jluo1875/Powershell-Scripts
#>

try {
	
	if ($Free -lt $MinLevel) {
        	write-warning "Drive $Drive has only $Free GB left to use! ($Used of $Total GB used, minimum is $MinLevel GB)"
		exit 1
  
 if ($Drive -eq "" ) { $Drive = read-host "Enter drive to check" }

	$DriveDetails = (get-psdrive $Drive)
	[int]$Free = (($DriveDetails.Free / 512) / 512) / 512
	[int]$Used = (($DriveDetails.Used / 512) / 512) / 512
	[int]$Total = ($Used + $Free)
	}

	& "$PSScriptRoot/speak-english.ps1" "Drive $Drive has $Free GB left ($Total GB total)"
	exit 0
}
