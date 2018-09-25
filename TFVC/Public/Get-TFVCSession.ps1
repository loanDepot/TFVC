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
        $script:MasterTFVCSession
    }
}
