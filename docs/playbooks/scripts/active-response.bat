:: ===================================================================
:: Active Response Script: Automated IP Block via Windows Firewall
:: Action: Adds inbound firewall block rule for attacking source IP
:: ===================================================================

@echo off
setlocal enableextensions enabledelayedexpansion

set ACTION=%1
set USER=%2
set IP=%3

if "%ACTION%"=="add" (
    netsh advfirewall firewall add rule name="Wazuh_Block_IP_%IP%" dir=in action=block remoteip=%IP%
)

if "%ACTION%"=="delete" (
    netsh advfirewall firewall delete rule name="Wazuh_Block_IP_%IP%"
)

exit /b 0
