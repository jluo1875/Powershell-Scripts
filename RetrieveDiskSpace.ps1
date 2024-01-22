function RetrieveDiskSpace {
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
