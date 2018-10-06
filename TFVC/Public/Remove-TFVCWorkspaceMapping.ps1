using namespace Microsoft.TeamFoundation.VersionControl.Client

function Remove-TFVCWorkspaceMapping
{
    <#
        .Synopsis
        Adds a source to folder mapping to the workspace

        .Example
        New-TFVCSession -ServerURI https://tfs -ProjectCollection DevOps
        $workspace = Get-TFVCWorkspace
        $workspace | Remove-TFVCWorkspaceMapping -Source '$/DevOpsTFVCTest/master'

        .Notes

    #>
    [cmdletbinding(DefaultParameterSetName = 'Source', SupportsShouldProcess)]
    param(

        # A workspace to add a source mapping to
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipeline
        )]
        [ValidateNotNullOrEmpty()]
        [Workspace]
        $Workspace,

        # The TFS locaion to map to the local system
        [Alias('SourcePath', 'TFSLocaion', 'ServerItem')]
        [Parameter(
            Mandatory,
            Position = 1,
            ValueFromPipelineByPropertyName,
            ParameterSetName = 'Source'
        )]
        [ValidateNotNullOrEmpty()]
        [String]
        $Source,

        # The location on the local system that gets mapped
        [Alias('DestinationPath', 'Path', 'LocalPath', 'FullName', 'LocalItem')]
        [Parameter(
            Mandatory,
            Position = 1,
            ValueFromPipelineByPropertyName,
            ParameterSetName = 'Destination'
        )]
        [ValidateNotNullOrEmpty()]
        [String]
        $Destination,

        # The location on the local system that gets mapped
        [Alias('WorkingFolder')]
        [Parameter(
            Mandatory,
            Position = 1,
            ValueFromPipeline,
            ParameterSetName = 'WorkingFolder'
        )]
        [WorkingFolder[]]
        $Mapping
    )

    process
    {
        try
        {
            switch ( $PSCmdlet.ParameterSetName )
            {
                'Source'
                {
                    $Mapping = $Workspace.Folders |
                        Where ServerItem -eq $Source
                }
                'Destination'
                {
                    $Mapping = $Workspace.Folders |
                        Where LocalItem -eq $Destination
                }
            }

            if ( $null -ne $Mapping )
            {
                if ( $PSCmdlet.ShouldProcess( $mapping.ServerItem ) )
                {
                    foreach ($folder in $Mapping)
                    {
                        $Workspace.DeleteMapping( $folder )
                    }
                }
            }
        }
        catch [ItemNotMappedException]
        {
            Write-Verbose 'This mapping does not exist in this workspace'
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
