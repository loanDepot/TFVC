function Merge-TFVCChangeset
{
    <#
        .Synopsis
        Performs a merge in the workspace with the specified changes

        .Example
        Merge-TFVCChangeset -Path $Path

        .Notes
        Workspace.Merge: https://docs.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2013/bb139330%28v%3dvs.120%29
        MergeOptionsEx: https://docs.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2013/ff736044%28v%3dvs.120%29
    #>
    [cmdletbinding(SupportsShouldProcess)]
    [OutputType('[Microsoft.TeamFoundation.VersionControl.Client.GetStatus]')]
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
        $ToChangeset,

        # Special options to use for the merge. Default is None
        [Parameter()]
        [Microsoft.TeamFoundation.VersionControl.Common.MergeOptionsEx]
        $MergeOptions = [Microsoft.TeamFoundation.VersionControl.Common.MergeOptionsEx]::None,

        # Specified lock level
        [Parameter()]
        [Microsoft.TeamFoundation.VersionControl.Client.LockLevel]
        $LockLevel = [Microsoft.TeamFoundation.VersionControl.Client.LockLevel]::None,

        # Recursion type
        [Parameter()]
        [Microsoft.TeamFoundation.VersionControl.Client.RecursionType]
        $RecursionType = [Microsoft.TeamFoundation.VersionControl.Client.RecursionType]::Full
    )

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
            if ( -Not $PSCmdlet.ShouldProcess($TargetBranch) )
            {
                $MergeOptions = $MergeOptions -bor [Microsoft.TeamFoundation.VersionControl.Common.MergeOptionsEx]::NoMerge
            }

            $status = $Workspace.Merge(
                $SourceBranch,
                $TargetBranch,
                $fromVersion,
                $toVersion,
                $LockLevel,
                $RecursionType,
                $MergeOptions
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
