function Get-TFVCChangeset
{
    <#
        .Synopsis
        Get specified changeset details

        .Example
        Get-TFVCChangeset -ChangesetID $ChangesetID

        .Notes
        GetChangeSet: https://docs.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2013/ff737622%28v%3dvs.120%29
        Changeset: https://docs.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2013/bb170151%28v%3dvs.120%29
    #>
    [Alias('TFChangeset')]
    [CmdletBinding()]
    [Outputtype('[Microsoft.TeamFoundation.VersionControl.Client.Changeset]')]
    param(

        # The ID of the Changeset.
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [Int32[]]
        $ChangesetID,

        # Active TFVC Session
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [TFVCSession]
        $TFVCSession = (Get-TFVCSession),

        # True to include the changes in the Changeset. False to include only metadata.
        [Parameter()]
        [switch]
        $IncludeChanges,

        # True to get the information needed to download files. Specify false to save bandwidth if not necessary.
        [Parameter()]
        [switch]
        $IncludeDownloadInfo
    )

    process
    {
        try
        {
            foreach ( $id in $ChangesetID )
            {
                $TFVCSession.GetChangeset( $id, $IncludeChanges, $IncludeDownloadInfo )
            }
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
