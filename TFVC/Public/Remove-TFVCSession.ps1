function Remove-TFVCSession
{
    <#
        .Synopsis
        Removes the current session

        .Example
        Remove-TFVCSession -TFVCSession $TFVCSession

        .Notes

    #>
    [Alias('Remove-TFVCConnection', 'RTFVCS')]
    [cmdletbinding()]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    param ()

    process
    {
        try
        {
            if ( $null -ne $script:MasterTFVCSession )
            {
                $script:MasterTFVCSession.Disconnect()
                $script:MasterTFVCSession = $null
            }
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
