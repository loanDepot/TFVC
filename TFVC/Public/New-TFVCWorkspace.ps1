function New-TFVCWorkspace
{
    <#
        .Synopsis

        .Example
        New-TFVCWorkspace -Path $Path

        .Notes

    #>
    [cmdletbinding()]
    [OutputType('Microsoft.TeamFoundation.VersionControl.Client.Workspace')]
    param(
        # Parameter help description
        [Parameter(
            Position = 0,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [String]
        $Name = "${env:COMPUTERNAME}-Default",

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
            $TFVCSession.CreateWorkspace($Name)
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
