using namespace Microsoft.TeamFoundation.VersionControl.Client

function Remove-TFVCWorkspace
{
    <#
        .Synopsis
        This will delete an existing workspace.

        .Example
        Remove-TFVCWorkspace -Path $Path

        .Notes
        This implementation only deletes from the local system, but could be enhanced to delete any workspace from TFS

    #>
    [cmdletbinding(DefaultParameterSetName = 'Named', SupportsShouldProcess)]
    param(
        # Name of the workspace
        [Parameter(
            Position = 0,
            ValueFromPipelineByPropertyName,
            ParameterSetName = 'Named'
        )]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 64)]
        [String]
        $Name = "${env:COMPUTERNAME}-Default",

        # the workspace
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipeline,
            ParameterSetName = 'Workspace'
        )]
        [Workspace]
        $Workspace,

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
            if ( $null -eq $Workspace )
            {
                $Workspace = Get-TFVCWorkspace -Name $Name -TFVCSession $TFVCSession
            }

            if ( $null -ne $Workspace -and $PSCmdlet.ShouldProcess( $Workspace.DisplayName ) )
            {
                if ( $Workspace.Delete() )
                {
                    Write-Verbose "The Workspace [$($Workspace.DisplayName)] was deteled"
                }
                else
                {
                    Write-Warning 'Calling delete on this workspace object returned [$false] unexpectidly. Are the red ones stuff you wanted removed? Ooh, that''s clever, Morty, but I don''t use color to sort things'
                }
            }
        }
        catch [WorkspaceDeletedException]
        {
            Write-Verbose 'This workspace has alraedy been deleted'
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
