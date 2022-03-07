# Restart-AzApplicationGateway

A simple PowerShell cmdlet module to reboot AzApplicationGateway (PaaS)

## Pre-requisite

1. PowerShell
2. Azure PowerShell Module

## How-To

1. Clone the repository

	```sh
	git clone https://github.com/kiazhi/Restart-AzApplicationGateway.git
	```

2. Install and Import Azure PowerShell module

	```powershell
	# Install Azure PowerShell module if havn't done before
	Install-Module -Name Az

	# Import Azure PowerShell module if havn't done before
	Import-Module -Name Az
	```

3. Import the Restart-AzApplicationGateway module

	```powershell
	# Change to the repository source code directory
	cd ./Restart-AzApplicationGateway/src

	# Import the PowerShell script module
	Import-Module ./Restart-AzApplicationGateway.psm1
	```

3. Use `Get-Help` to know the command

	```powershell
	# Use Get-Help to get help on the Restart-AzApplicationGateway cmdlet
	Get-Help Restart-AzApplicationGateway -Full
	```
