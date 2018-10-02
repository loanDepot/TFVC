function Remove-TFVCWorkspace
{
    <#
        .Synopsis

        .Example
        Remove-TFVCWorkspace -Path $Path

        .Notes

    #>
    [cmdletbinding(DefaultParameterSetName = 'Named')]
    param(


        # Name of the workspace
        [Parameter(
            Position = 0,
            ValueFromPipelineByPropertyName,
            ParameterSetName = 'Named'
        )]
        [ValidateNotNullOrEmpty()]
        [String]
        $Name = "${env:COMPUTERNAME}-Default",

        # the workspace
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipeline,
            ParameterSetName = 'Workspace'
        )]
        [ValidateNotNullOrEmpty()]
        [Microsoft.TeamFoundation.VersionControl.Client.Workspace]
        $Workspace,

        # Active TFVC Session
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [TFVCSession]
        $TFVCSession = (Get-TFVCSession)
    )

    process
    {
        try
        {
            if ( $null -eq $Workspace )
            {
                $Workspace = Get-TFVCWorkspace -Name $Name -TFVCSession $TFVCSession
            }

            if ( $PSCmdlet.ShouldContinue( $Workspace.DisplayName ) )
            {
                $Workspace.Delete()
            }

        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }

}
