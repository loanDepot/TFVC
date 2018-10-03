function Get-TFVCWorkspaceMapping
{
    <#
        .Synopsis
        Gets the folder mappings in the workspace

        .Example
        New-TFVCSession -ServerURI https://tfs -ProjectCollection ldts
        $workspace = Get-TFVCWorkspace
        $Workspace | Get-TFVCWorkspaceMapping

        .Notes

    #>
    [cmdletbinding()]
    param(

        # A workspace to add a source mapping to
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipeline
        )]
        [ValidateNotNullOrEmpty()]
        [Microsoft.TeamFoundation.VersionControl.Client.Workspace]
        $Workspace,

        # The TFS locaion to map to the local system
        [Alias('SourcePath', 'TFSLocaion', 'ServerItem')]
        [Parameter(
            Position = 1,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [String]
        $Source = '*',

        # The location on the local system that gets mapped
        [Alias('DestinationPath', 'Path', 'LocalPath', 'FullName', 'LocalItem')]
        [Parameter(
            Position = 2,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [String]
        $Destination = '*'
    )

    process
    {
        try
        {
            $Workspace.Folders | Where {$_.ServerItem -like $Source -and $_.LocalItem -like $Destination}
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
