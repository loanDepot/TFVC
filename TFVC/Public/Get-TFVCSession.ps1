function Get-TFVCSession
{
    <#
        .Synopsis
        Gets the current active session

        .Example
        Get-TFVCSession

        .Notes

    #>
    [Alias('Get-TFVCConnection','GTFVCS')]
    [cmdletbinding()]
    param ()

    process
    {
        if ( $null -eq $script:MasterTFVCSession )
        {
            Write-Warning 'There are no active TFVC sessions, please run [New-TFVCSession] to connect to a server'
        }
        else
        {
            $script:MasterTFVCSession
        }
    }
}
