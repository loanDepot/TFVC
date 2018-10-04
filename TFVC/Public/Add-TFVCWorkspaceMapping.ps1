using namespace Microsoft.TeamFoundation.VersionControl.Client

function Add-TFVCWorkspaceMapping
{
    <#
        .Synopsis
        Adds a source to folder mapping to the workspace

        .Example
        New-TFVCSession -ServerURI https://tfs -ProjectCollection DevOps
        $workspace = Get-TFVCWorkspace
        $workspace | Add-TFVCWorkspaceMapping -Source '$/DevOpsTFVCTest/master' -Destination 'c:\localworkspace\DevOpsTFVCTest\master'

        .Notes

    #>
    [cmdletbinding( DefaultParameterSetName = 'Path', SupportsShouldProcess )]
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
            ParameterSetName = 'Path'
        )]
        [ValidateNotNullOrEmpty()]
        [String]
        $Source,

        # The location on the local system that gets mapped
        [Alias('DestinationPath', 'Path', 'LocalPath', 'FullName', 'LocalItem')]
        [Parameter(
            Mandatory,
            Position = 2,
            ValueFromPipelineByPropertyName,
            ParameterSetName = 'Path'
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
        [ValidateNotNullOrEmpty()]
        [WorkingFolder]
        $Mapping
    )

    process
    {
        try
        {
            if ( $null -ne $Mapping )
            {
                $Source = $Mapping.ServerItem
                $Destination = $Mapping.LocalItem
            }

            # normalize to full path
            $null = New-Item -Path $Destination -ItemType Directory -Force -ErrorAction Ignore
            $Destination = Resolve-Path -Path $Destination

            Write-Verbose ( "Mapping source [{0}] to local [{1}] in workspace [{2}]" -f $Source, $Destination, $Workspace.DisplayName )

            # Check to see if it is already mapped
            $currentFolder = $Workspace.Folders |
                Where ServerItem -eq $Source
            Where LocalItem -eq $Destination

            if ( $null -eq $currentFolder )
            {
                Write-Verbose '  Adding new mapping'
                if ( $PSCmdlet.ShouldProcess( $Source ) )
                {
                    if ( $null -ne $Mapping )
                    {
                        $Workspace.CreateMapping( $Mapping )
                    }
                    else
                    {
                        $Workspace.Map( $Source, $Destination )
                    }

                    Write-Verbose '  Verify working folder was created'
                    $Workspace.GetWorkingFolderForServerItem( $Source )
                }
            }
            else
            {
                Write-Verbose "  Folder [$Destination] is already mapped in this workspace"
                $currentFolder
            }
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
