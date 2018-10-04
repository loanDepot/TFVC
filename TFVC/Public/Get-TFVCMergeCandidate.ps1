using namespace Microsoft.TeamFoundation.VersionControl.Client
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
        $TargetBranch,

        # Active TFVC Session
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [TFVCSession]
        $TFVCSession = (Get-TFVCSession)
    )

    begin
    {
        $recursive = [RecursionType]::Full
    }

    process
    {
        try
        {
            $MergeCandidate = $TFVCSession.VersionControlServer.GetMergeCandidates( $SourceBranch, $TargetBranch, $recursive )
            $MergeCandidate.ChangeSet
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
