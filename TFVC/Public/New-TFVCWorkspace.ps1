function New-TFVCWorkspace
{
    <#
        .Synopsis
        Creates a local workspace

        .Example
        New-TFVCWorkspace -Path $Path

        .Notes
        Name must be unique per owner

    #>
    [cmdletbinding(SupportsShouldProcess)]
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
            if ( $PSCmdlet.ShouldProcess( $Name ) )
            {
                $TFVCSession.CreateWorkspace( $Name )
            }
        }
        catch [WorkspaceExistsException]
        {
            Write-Verbose "The workspace [$Name] already exists. Using existing workspace."
            Get-TFVCWorkspace @PSBoundParameters
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
