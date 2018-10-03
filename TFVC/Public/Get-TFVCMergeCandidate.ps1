function Get-TFVCMergeCandidate
{
    <#
        .Synopsis
        Compares 2 branches and get the changeset that are different between them

        .Example
        Get-TFVCMergeCandidate -SourceBranch $SourceBranch -TargetBranch $TargetBbranch -Workspace $Workspace

        .Notes

    #>
    [cmdletbinding()]
    param(

         # the workspace
         [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipeline
        )]
        [Microsoft.TeamFoundation.VersionControl.Client.Workspace]
        $Workspace,

        # Source banch with the chagnes that need to be merged
        [Parameter(
            Mandatory,
            Position = 1,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [String]
        $SourceBranch,

        # Target branch to merge the changes into
        [Parameter(
            Mandatory,
            Position = 2,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [String]
        $TargetBranch
    )

    begin
    {

    }

    process
    {
        try
        {
            foreach ( $node in $SourceBranch )
            {
                Write-Debug $node

            }
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
