function DisableFirewall {
<#
Disables the domain, public, and private firewall profile. 

Usage:
PS> DisableFirewall

Link: 
github.com/jluo1875/Powershell-Scripts
#>
  Set-NetFirewallProfile -Name domain,public,private -Enabled False
} 
