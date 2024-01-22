function OpenPowershellModule {
<#
Opens the specified PowerShell script module file (.psm1) using PowerShell ISE. 

Usage:
PS> Edit-Module "soap"

Link:
github.com/jluo1875/Powershell-Scripts
#>
  Param([Parameter(Mandatory)][string]$Name)
  $Module = Get-Module | Where-Object { $_.Path -like "*$Name.psm1" }
  if ($Module) { 
      ise $Module.Path
  } else {
      Write-Error "A module called '$Name' does not exist."
  }
}
