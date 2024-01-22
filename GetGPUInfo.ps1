function Bytes2String { param([int64]$Bytes)

﻿<#
This PowerShell script obtains the GPU status and prints it.

Usage:
PS> ./GetGPUInfo.ps1
NVIDIA GeForce RTX 2080 Super (8GB RAM, 1920x1080 pixels, 32-bit, 240Hz, driver 31.0.15.1740, status OK)

Link: 
github.com/jluo1875/Powershell-Scripts
#>

	if ($Bytes -lt 1000) { return "$Bytes bytes" }
	$Bytes /= 1000
	if ($Bytes -lt 1000) { return "$($Bytes)KB" }
	$Bytes /= 1000
	if ($Bytes -lt 1000) { return "$($Bytes)MB" }
	$Bytes /= 1000
	if ($Bytes -lt 1000) { return "$($Bytes)GB" }
	$Bytes /= 1000
	return "$($Bytes)TB"
}

try {
	$Details = Get-WmiObject Win32_VideoController
        $DriverVersion = $Details.DriverVersion
	$Model = $Details.Caption
	$ResWidth = $Details.CurrentHorizontalResolution
	$ResHeight = $Details.CurrentVerticalResolution
	$RefreshRate = $Details.CurrentRefreshRate
  	$RAMSize = $Details.AdapterRAM
	$Status = $Details.Status
	Write-Host "$Model GPU ($(Bytes2String $RAMSize) RAM, $($ResWidth)x$($ResHeight) pixels, $($BitsPerPixel)-bit, $($RefreshRate)Hz, driver $DriverVersion, status $Status)"
	}
	exit 0 
 } catch {
 Write-Host "An error occurred: $_"
}
