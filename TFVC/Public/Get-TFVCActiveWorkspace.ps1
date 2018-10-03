function Get-TFVCActiveWorkspace
{
    <#
        .Synopsis
        Gets the currently active workspace

        .Example
        Get-TFVCActiveWorkspace

        .Notes
        This is used to provide a default value for cmdlets that need a workspace.
        This is why it throws an error if it is used before a workspace is set.
    #>
    [cmdletbinding(SupportsShouldProcess)]
    param()

    end
    {
        if ( $PSCmdlet.ShouldProcess( $script:ActiveTFVCWorkspace.DisplayName ) )
        {
            if ( $script:ActiveTFVCWorkspace )
            {
                $script:ActiveTFVCWorkspace
            }
            else
            {
                Write-Error -ErrorAction Stop -ErrorId NoActiveTFVCWorkspace -Message 'No active workspace is set. Please provide a workspace or set an active one using Set-TFVCActiveWorkspace.'
            }
        }
    }
}
