function RetrieveDiskSpace {

﻿<#
This PowerShell script obtains the amount of disk space in the primary disk.

Usage:
PS> ./RetrieveDiskSpace.ps1

Link: 
github.com/jluo1875/Powershell-Scripts
#>


  Get-CimInstance -Class Win32_PrimaryDisk |
  Select-Object -Property @{
      Label = 'DriveLetter'
      Expression = { $_.Name }
  },@{
      Label = 'FreeSpace (GB)'
      Expression = { ($_.FreeSpace / 1GB).ToString('F2') }
  },@{
      Label = 'TotalSpace (GB)'
      Expression = { ($_.Size / 1GB).ToString('F2') }
  },@{
      Label = 'SerialNumber'
      Expression = { $_.VolumeSerialNumber }
  }
}
