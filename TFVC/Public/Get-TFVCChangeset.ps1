function Get-TFVCChangeset
{
    <#
        .Synopsis
        Get specified changeset details

        .Example
        Get-TFVCChangeset -ChangesetID $ChangesetID

        .Notes
        GetChagneSet: https://docs.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2013/ff737622%28v%3dvs.120%29
        Changeset: https://docs.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2013/bb170151%28v%3dvs.120%29
    #>
    [cmdletbinding()]
    param(

        # Parameter help description
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
        $TFVCSession = (Get-TFVCSession)
    )

    begin
    {

    }

    process
    {
        try
        {

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
