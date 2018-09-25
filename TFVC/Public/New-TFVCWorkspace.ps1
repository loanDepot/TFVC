function New-TFVCWorkspace
{
    <#
        .Synopsis

        .Example
        New-TFVCWorkspace -Path $Path

        .Notes

    #>
    [cmdletbinding()]
    param(
        # Parameter help description
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $Path
    )

    begin
    {

    }

    process
    {
        try
        {
            foreach ( $node in $Path )
            {
                Write-Debug $node

            }
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }

    end
    {

    }
}
