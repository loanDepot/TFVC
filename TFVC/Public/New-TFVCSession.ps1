function New-TFVCSession
{
    <#
        .Synopsis
        Creates a connection to a TFS or VSTS endpoint

        .Example
        New-TFVCSession -Path $Path

        .Notes
    #>

    [Alias('Open-TFVCConnection','NTFVCS')]
    [CmdletBinding()]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    param(
        # TFS or VSTS endpoint
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [uri]
        $ServerURI,

        # Project Collection Name
        [Parameter(
            Mandatory,
            Position = 1,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [string]
        $ProjectCollection,

        # Credential
        [Parameter(
            Position = 2,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [PSCredential]
        $Credential
    )

    process
    {
        try
        {
            Write-Verbose ('Connectiong to TFVC URI [{0}] and Project Collection [{1}]' -f $ServerURI, $ProjectCollection )

            $script:MasterTFVCSession = $null
            if ( $null -ne $Credential )
            {
                Write-Debug ('  With Credential [{0}]' -f $Credential.UserName )
                $script:MasterTFVCSession = [TFVCSession]::New( $ServerURI, $ProjectCollection, $Credential )
            }
            else
            {
                Write-Debug '  With Default Credential'
                $script:MasterTFVCSession = [TFVCSession]::New( $ServerURI, $ProjectCollection )
            }

            return $script:MasterTFVCSession
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
