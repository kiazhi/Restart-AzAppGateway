<#
 .Synopsis
  Restart an Azure Application Gateway.

 .Description
  Restart an Azure Application Gateway. This function retains the existing
  Azure Application Gateway configurations prior to stop the Azure Application
  Gateway and start the Azure Application Gateway.

 .Parameter Name
  Specifies the name of the Azure Application Gateway that this cmdlet will restarts.

 .Parameter ResourceGroupName
  Specifies the name of a resource group containing the Azure Application Gateway.

 .Parameter Wait
  Specifies the number of seconds to wait before starting the Azure Application Gateway.

 .Example
  # Restart the Azure Application Gateway.
  Restart-AzApplicationGateway -Name "myAzureApplicationGateway" -ResourceGroupName "myResourceGroup"

 .Example
  # Restart the Azure Application Gateway with Verbose outputs.
  Restart-AzApplicationGateway -Name "myAzureApplicationGateway" -ResourceGroupName "myResourceGroup" -Verbose

 .Example
  # Restart the Azure Application Gateway and wait for 30 seconds duration with Verbose outputs.
  Restart-AzApplicationGateway -Name "myAzureApplicationGateway" -ResourceGroupName "myResourceGroup" -Wait 30 -Verbose

 .INPUTS
 	System.String

 .OUTPUTS
 	System.Object

 .NOTES
  Author: Ryen Tang
	GitHub: https://github.com/kiazhi
  
#>

function Restart-AzApplicationGateway {

	[CmdletBinding()]

	param (
		[Parameter( 
      Mandatory=$True, 
      ValueFromPipeline=$True, 
      ValueFromPipelineByPropertyName=$True)] 
		[String] $Name,

		[Parameter( 
      Mandatory=$True, 
      ValueFromPipeline=$True, 
      ValueFromPipelineByPropertyName=$True)] 
		[String] $ResourceGroupName,

		[Parameter( 
      Mandatory=$False, 
      ValueFromPipeline=$True, 
      ValueFromPipelineByPropertyName=$True)] 
		[Int] $Wait
	)

	begin {}

	process {

		$AzApplicationGateway = Get-AzApplicationGateway `
			-Name $Name `
			-ResourceGroupName $ResourceGroupName

		if($PSCmdlet.MyInvocation.BoundParameters["Verbose"].IsPresent) {
			Write-Verbose `
				-Message $("$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzzz') - " `
					+ "Get existing AzApplicationGateway configurations:")

			Write-Output `
				-InputObject $AzApplicationGateway
		}

		if($PSCmdlet.MyInvocation.BoundParameters["Verbose"].IsPresent) {
			Write-Verbose -Message $("$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzzz') - " `
				+ "Stopping AzApplicationGateway")
		}

		Stop-AzApplicationGateway `
			-ApplicationGateway $AzApplicationGateway `
		| Select-Object `
			-Property `
				Name, `
				ResourceGroupName, `
				OperationalState, `
				ProvisioningState

		if($PSCmdlet.MyInvocation.BoundParameters["Verbose"].IsPresent) {
			Write-Verbose -Message $("$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzzz') - " `
				+ "Stopped AzApplicationGateway")
		}

		if($Wait) {

			if($PSCmdlet.MyInvocation.BoundParameters["Verbose"].IsPresent) {
				Write-Verbose -Message $("$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzzz') - " `
					+ "Start waiting for $Wait seconds")
			}

			Start-Sleep -Seconds $Wait

			if($PSCmdlet.MyInvocation.BoundParameters["Verbose"].IsPresent) {
				Write-Verbose -Message $("$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzzz') - " `
					+ "End waiting")
			}
		}

		if($PSCmdlet.MyInvocation.BoundParameters["Verbose"].IsPresent) {
			Write-Verbose -Message $("$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzzz') - " `
				+ "Starting AzApplicationGateway")
		}

		Start-AzApplicationGateway `
			-ApplicationGateway $AzApplicationGateway `
		| Select-Object `
			-Property `
				Name, `
				ResourceGroupName, `
				OperationalState, `
				ProvisioningState

		if($PSCmdlet.MyInvocation.BoundParameters["Verbose"].IsPresent) {
			Write-Verbose -Message $("$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzzz') - " `
        + "Started AzApplicationGateway")
		}

  }

	end {}

}
