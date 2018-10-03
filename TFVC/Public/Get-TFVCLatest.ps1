function Get-TFVCLatest
{
    <#
        .Synopsis
        Gets the latest changes for all the mappings in the workspace


        .Example
        New-TFVCSession -ServerURI https://tfs -ProjectCollection ldts
        $workspace = Get-TFVCWorkspace
        $workspace | Get-TFVCLatest

        .Notes

    #>
    [cmdletbinding(SupportsShouldProcess)]
    param(
        # A workspace to get latest
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipeline
        )]
        [ValidateNotNullOrEmpty()]
        [Microsoft.TeamFoundation.VersionControl.Client.Workspace]
        $Workspace
    )

    process
    {
        try
        {
            if( $null -ne $Workspace -and $PSCmdlet.ShouldProcess( $Workspace.DisplayName ) )
            {
                $Workspace.Get()
            }
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
