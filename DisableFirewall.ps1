function DisableFirewall {
<#
Disables the domain, public, and private firewall profile. 

Usage:
PS> DisableFirewall
#>
  Set-NetFirewallProfile -Name domain,public,private -Enabled False
} 
