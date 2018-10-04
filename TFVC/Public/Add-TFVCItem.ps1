function Add-TFVCItem
{
    <#
        .Synopsis
        Adds items to the workspace that will become pending changes

        .Example
        Add-TFVCItem -Path $Path

        .Notes

    #>
    [Alias('TFAdd')]
    [cmdletbinding()]
    param(
        # Path to the file to add. Supports wildcards
        [Parameter(
            Position = 0,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $Path = '.',

        # Recursivly add files
        [Parameter(
            Position = 1,
            ValueFromPipelineByPropertyName
        )]
        [switch]
        $Recurse,

        # The Workspace
        [Parameter(
            Position = 2,
            ValueFromPipeline
        )]
        [Workspace]
        $Workspace = (Get-TFVCActiveWorkspace)
    )

    process
    {
        try
        {
            $allFiles = Resolve-Path -Path $Path

            $count = foreach ( $node in $allFiles )
            {
                $Workspace.PendAdd( $node, $Recurse )
            }

            [PSCustomobject]@{
                LocalItems = $allFiles
                NumberAdded = $count
            }
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
