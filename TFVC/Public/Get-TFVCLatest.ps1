using namespace Microsoft.TeamFoundation.VersionControl.Client

function Get-TFVCLatest
{
    <#
        .Synopsis
        Gets the latest changes for all the mappings in the workspace


        .Example
        New-TFVCSession -ServerURI https://tfs -ProjectCollection DevOps
        $workspace = Get-TFVCWorkspace
        $workspace | Get-TFVCLatest

        .Notes

    #>
    [cmdletbinding(SupportsShouldProcess)]
    param(
        # A workspace to get latest
        [Parameter(
            Position = 0,
            ValueFromPipeline
        )]
        [ValidateNotNullOrEmpty()]
        [Workspace]
        $Workspace = (Get-TFVCActiveWorkspace)
    )

    process
    {
        try
        {
            if ( $null -ne $Workspace -and $PSCmdlet.ShouldProcess( $Workspace.DisplayName ) )
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
