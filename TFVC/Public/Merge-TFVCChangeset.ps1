function Merge-TFVCChangeset
{
    <#
        .Synopsis
        Performs a merge in the workspace with the specified changes

        .Example
        Merge-TFVCChangeset -Path $Path

        .Notes

    #>
    [cmdletbinding(SupportsShouldProcess)]
    param(
         # the workspace
         [Parameter(
            Position = 0,
            ValueFromPipeline,
            ParameterSetName = 'Workspace'
        )]
        [Microsoft.TeamFoundation.VersionControl.Client.Workspace]
        $Workspace = (Get-TFVCActiveWorkspace),

        # Source banch with the chagnes that need to be merged
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [String]
        $SourceBranch,

        # Target branch to merge the changes into
        [Parameter(
            Mandatory,
            Position = 1,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [String]
        $TargetBranch,

        # First or oldest changeset in the list to merge
        [Alias('Changeset','Start','First')]
        [Parameter(
            Mandatory,
            Position = 2,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [Microsoft.TeamFoundation.VersionControl.Client.Changeset]
        $FromChangeset,

        # Latest or newest change to be merged
        [Alias('Last','End')]
        [Parameter(
            Position = 3,
            ValueFromPipelineByPropertyName
        )]
        [Microsoft.TeamFoundation.VersionControl.Client.Changeset]
        $ToChangeset
    )

    begin
    {
		$lock = [Microsoft.TeamFoundation.VersionControl.Client.LockLevel]::None
		$recurse = [Microsoft.TeamFoundation.VersionControl.Client.RecursionType]::Full
    }

    process
    {
        try
        {
            if ( $null -eq $ToChangeset )
            {
                $ToChangeset = $FromChangeset
            }

            $fromVersion = [Microsoft.TeamFoundation.VersionControl.Client.ChangesetVersionSpec]::new($FromChangeset.ChangesetId)
            $toVersion = [Microsoft.TeamFoundation.VersionControl.Client.ChangesetVersionSpec]::new($ToChangeset.ChangesetId)

            # Get the results of a merge without doing a merge
            $mergeFlags = [Microsoft.TeamFoundation.VersionControl.Common.MergeOptionsEx] "NoMerge, None"
            if ( $PSCmdlet.ShouldProcess($TargetBranch) )
            {
                $mergeFlags = [Microsoft.TeamFoundation.VersionControl.Common.MergeOptionsEx] "None"
            }

            $status = $Workspace.Merge(
                $SourceBranch,
                $TargetBranch,
                $fromVersion,
                $toVersion,
                $lock,
                $recurse,
                $mergeFlags
            )
            $status
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }

    end
    {

    }
}
