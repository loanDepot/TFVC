function Get-TFVCPendingChange
{
    <#
        .Synopsis
        Gets the pending changes in the workspace

        .Example
        Get-TFVCPendingChange

        .Notes

    #>
    [Alias('Get-TFVCPendingChanges','TFPending')]
    [cmdletbinding()]
    param(
        # The Workspace
        [Parameter(
            Position = 0,
            ValueFromPipeline
        )]
        [Microsoft.TeamFoundation.VersionControl.Client.Workspace]
        $Workspace = (Get-TFVCActiveWorkspace)
    )

    process
    {
        try
        {
            $Workspace.GetPendingChanges()
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
