function Get-TFVCWorkspace
{
    <#
        .Synopsis
        Gets the local workspace

        .Example
        Get-TFVCWorkspace -Path $Path

        .Notes

    #>
    [cmdletbinding( DefaultParameterSetName = 'Default' )]
    [OutputType('Microsoft.TeamFoundation.VersionControl.Client.Workspace')]
    param(
        # Workspace name
        [Alias('WorkspaceName','Workspace')]
        [Parameter(
            Position = 0,
            ValueFromPipelineByPropertyName,
            ParameterSetName = 'Default'
        )]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1,64)]
        [String]
        $Name = "${env:COMPUTERNAME}-Default",

        # Workspace owner
        [Alias('WorkspaceOwner')]
        [Parameter(
            Position = 0,
            ValueFromPipelineByPropertyName,
            ParameterSetName = 'Default'
        )]
        [ValidateNotNullOrEmpty()]
        [String]
        $Owner = $env:USERNAME,

        # Local path to a working folder
        [Alias('LocalPath','Folder','Directory','FullName','WorkingFolder')]
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipelineByPropertyName,
            ParameterSetName = 'LocalPath'
        )]
        [ValidateNotNullOrEmpty()]
        [String]
        $Path,

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
            if ( $null -eq $TFVCSession )
            {
                Write-Warning 'No TFVCSession available to retreive workspace'
                return
            }

            switch ( $PSCmdlet.ParameterSetName )
            {
                'LocalPath'
                {
                    Write-Debug "Working folder path [$Path]"
                    $TFVCSession.GetWorkspaceFromPath( $Path )
                }
                default
                {
                    $TFVCSession.GetWorkspace( $PSBoundParameters.Name, $Owner )
                }
            }
        }
        catch [Microsoft.TeamFoundation.VersionControl.Client.WorkspaceNotFoundException]
        {
            Write-Verbose 'The workspace could not be found'
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
