function Remove-TFVCPendingChange
{
    <#
        .Synopsis
        Removes the specified pending changes

        .Example
        Remove-TFVCPendingChange -Path $Path

        .Example
        Remove-TFVCPendingChange | Remove-TFVCPendingChages

        .Notes

    #>
    [Alias('Get-TFVCPendingChanges')]
    [cmdletbinding(SupportsShouldProcess)]
    param(

        # The Workspace
        [Parameter(
            Position = 0,
            ValueFromPipeline
        )]
        [Microsoft.TeamFoundation.VersionControl.Client.Workspace]
        $Workspace = (Get-TFVCActiveWorkspace),

        # Local path to the pending change that should be removed
        [Alias('FullName', 'LocalItem')]
        [Parameter(
            Position = 1,
            ValueFromPipelineByPropertyName
        )]
        $Path
    )

    begin
    {
        $recurse = [Microsoft.TeamFoundation.VersionControl.Client.RecursionType]::Full
    }

    process
    {
        try
        {
            if ( $null -eq $Path )
            {
                $Path = Get-TFVCPendingChange -Workspace $Workspace | Select -ExpandProperty LocalItem
            }

            if ( $null -ne $Path )
            {
                if ( $PSCmdlet.ShouldProcess( ( $Path -join ',') ) )
                {
                    $count = $Workspace.Undo( $Path, $recurse )

                    [PSCustomOBject]@{
                        LocalItem     = $Path
                        UndoneChanges = $count
                    }
                }
            }
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
