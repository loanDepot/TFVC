using namespace Microsoft.TeamFoundation.VersionControl.Client

function Save-TFVCPendingChange
{
    <#
        .Synopsis
        Commit or checking the pending changes in the workspace

        .Example
        Save-TFVCPendingChange

        .Notes

    #>
    [Alias('Save-TFVCPendingChanges', 'TFCommit', 'TFCheckIn')]
    [cmdletbinding(SupportsShouldProcess)]
    param(

        # Commit Message
        [Alias('Message', 'CM')]
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [string]
        $CommitMessage,

        # The Workspace
        [Parameter(
            Position = 2,
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
        [string[]]
        $Path,

        # Pending changes to commit
        [Parameter(
            Position = 3,
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
                    $newchangeset = $Workspace.Checkin( $PendingChange, $CommitMessage )
                    [PSCustomObject]@{
                        Changeset = $newchangeset
                    }
                }
            }
            else
            {
                Write-Warning "There were no pending chagnes to commit in workspace [$($Workspace.Displayname)]"
            }
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
