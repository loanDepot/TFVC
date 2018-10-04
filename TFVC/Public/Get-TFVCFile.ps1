function Get-TFVCFile
{
    <#
        .Synopsis
        Downloads a file from the TFS server

        .Example
        Get-TFVCFile -ServerPath $ServerPath -Path $Path

        .Notes

    #>
    [Alias('TFDownload')]
    [cmdletbinding(SupportsShouldProcess)]
    param(
        # Server location for the file to download
        [Alias('Source')]
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [String]
        $ServerPath,

        # Location to save the selected file
        [Alias('FullName', 'Path')]
        [Parameter(
            Mandatory,
            Position = 1,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [String]
        $DestinationPath,

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
            if ( $PSCmdlet.ShouldProcess( $DestinationPath ) )
            {
                $TFVCSession.DownloadFile( $ServerPath, $DestinationPath )
            }
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
