function BlockNetworkTraffic {

<#
Blocks network traffic destined to the provided IP address and/or port, adds a rule to the local Windows Firewall policy so network traffic destined to the provided IP address and/or port is blocked. 

Parameters:

Protocol: Specifies the protocol to block.

IP Address: Specifies the IP address to block traffic.

Port: Specifies the port to block traffic.

Usage:
PS> BlockNetworkTraffic -Protocol UDP -IpAddress 8.8.8.8 -Port 53

Link:
github.com/jluo1875/Powershell-Scripts
#>

  Param(
      [ValidateSet("Any","TCP","UDP","ICMPv4","ICMPv6")][string]$Protocol = "Any",
      [Parameter(Mandatory)][ipaddress]$IpAddress,
      $Port = "Any"
  )
  New-NetFirewallRule `
      -DisplayName "Block '$Protocol' traffic to '$Port' port on $IpAddress" `
      -Direction Outbound `
      -Protocol $Protocol `
      -RemoteAddress $IpAddress `
      -RemotePort $RemotePort `
      -Action Block
} 
