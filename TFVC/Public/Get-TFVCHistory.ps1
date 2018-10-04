function Get-TFVCHistory
{
    <#
        .Synopsis
        Get the history for a given server path

        .Example
        Get-TFVCHistory -Path $Path

        .Notes

    #>
    [cmdletbinding()]
    param(

        # The server path to checck the history on. Supports wildcards
        [Alias('Path')]
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [string]
        $ServerPath,

        # User to search the history for
        [Parameter(
            Position = 1,
            ValueFromPipelineByPropertyName
        )]
        [String]
        $User = [NullString]::Value,

        # max number of history items to return
        [Parameter( ValueFromPipelineByPropertyName )]
        [Int32]
        $MaxCount = [Int32]::MaxValue,

        # include change information
        [Parameter( ValueFromPipelineByPropertyName )]
        [Switch]
        $IncludeChanges,

        # Sort the results Ascending
        [Parameter( ValueFromPipelineByPropertyName )]
        [Switch]
        $SortAscending,

        # Active TFVC Session
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [TFVCSession]
        $TFVCSession = (Get-TFVCSession)
    )

    process
    {
        try
        {
            $TFVCSession.GetHistory(
                $ServerPath,
                $User,
                $MaxCount,
                $IncludeChanges,
                $SortAscending
            )
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
