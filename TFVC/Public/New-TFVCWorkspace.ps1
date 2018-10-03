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
        [ValidateLength(1,64)]
        [String]
        $Name = "${env:COMPUTERNAME}-Default",

        # Active TFVC Session
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [TFVCSession]
        $TFVCSession = (Get-TFVCSession),

        # Sets this workspace as the active workspace
        [switch]
        $SetActiveWorkspace
    )

    process
    {
        try
        {
            if ( $PSCmdlet.ShouldProcess( $Name ) )
            {
                $workspace = $TFVCSession.CreateWorkspace( $Name )
                if ( $SetActiveWorkspace )
                {
                    Set-TFVCActiveWorkspace -Workspace $workspace
                }

                return $workspace
            }
        }
        catch [Microsoft.TeamFoundation.VersionControl.Client.WorkspaceExistsException]
        {
            Write-Verbose "The workspace [$Name] already exists. Using existing workspace."
            $TFVCWorkspace = @{
                Name = $Name
                TFVCSession = $TFVCSession
                SetActiveWorkspace = [bool]$SetActiveWorkspace
            }
            Get-TFVCWorkspace @TFVCWorkspace
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
