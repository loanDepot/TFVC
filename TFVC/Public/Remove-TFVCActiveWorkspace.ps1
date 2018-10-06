function Remove-TFVCActiveWorkspace
{
    <#
        .Synopsis
        Makes the current active workspace nolonger active.

        .Example
        Remove-TFVCActiveWorkspace

        .Notes

    #>
    [cmdletbinding(SupportsShouldProcess)]
    param()

    end
    {
        if ( $PSCmdlet.ShouldProcess( $script:ActiveTFVCWorkspace.DisplayName ) )
        {
            $script:ActiveTFVCWorkspace = $null
        }
    }
}
