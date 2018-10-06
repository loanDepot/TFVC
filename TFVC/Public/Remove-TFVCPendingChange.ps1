using namespace Microsoft.TeamFoundation.VersionControl.Client

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
    [Alias('Remove-TFVCPendingChanges', 'TFUndo')]
    [cmdletbinding(SupportsShouldProcess)]
    [OutputType('[Microsoft.TeamFoundation.VersionControl.Client.PendingChange]')]
    param(

        # The Workspace
        [Parameter(
            Position = 0,
            ValueFromPipeline
        )]
        [Workspace]
        $Workspace = (Get-TFVCActiveWorkspace),

        # Local path to the pending change that should be removed
        [Alias('FullName', 'LocalItem')]
        [Parameter(
            Position = 1,
            ValueFromPipelineByPropertyName
        )]
        $Path,

        # Pending changes to commit
        [Parameter(
            Position = 2,
            ValueFromPipeline
        )]
        [PendingChange[]]
        $PendingChange = (Get-TFVCPendingChange)
    )

    process
    {
        try
        {
            if ( $null -ne $Path )
            {
                $PendingChange | Where LocalItem -in $Path
            }

            if ( $null -ne $PendingChange )
            {
                if ( $PSCmdlet.ShouldProcess( ( $PendingChange.LocalItem -join ',' ) ) )
                {
                    $count = $Workspace.Undo( $PendingChange )

                    [PSCustomOBject]@{
                        LocalItem     = $PendingChange.localItem
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
