using namespace Microsoft.TeamFoundation.VersionControl.Client

function Set-TFVCActiveWorkspace
{
    <#
        .Synopsis
        Sets a workspace as the default one for the current powershell session

        .Example
        New-TFVCSession -ServerURI https://tfs -ProjectCollection DevOps
        $workspace = New-TFVCWorkspace
        Set-TFVCActiveWorkspace -Workspace $Workspace

        .Example
        New-TFVCSession -ServerURI https://tfs -ProjectCollection DevOps
        New-TFVCWorkspace -SetActiveWorkspace

        .Notes

    #>
    [cmdletbinding(SupportsShouldProcess)]
    param(
        # The workspace
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipeline
        )]
        [ValidateNotNullOrEmpty()]
        [Workspace]
        $Workspace
    )

    end
    {
        try
        {
            if ( $PSCmdlet.ShouldProcess( $Workspace.DisplayName ) )
            {
                $script:ActiveTFVCWorkspace = $Workspace
            }
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
