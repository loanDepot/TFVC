function New-TFVCShelveset
{
    <#
        .Synopsis
        Creates a Shelveset with the current pending changes

        .Example
        TFShelve

        .Example
        New-TFVCShelveset -Workspace $Workspace

        .Notes
        Workspace.Shelve: https://docs.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2013/bb139422(v%3dvs.120)
        Shelveset Class: https://docs.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2013/bb171628%28v%3dvs.120%29

    #>
    [Alias('TFShelve')]
    [cmdletbinding(SupportsShouldProcess)]
    param(
        # The Workspace
        [Parameter(
            Position = 0,
            ValueFromPipelineByPropertyName
        )]
        [String]
        $Name = ('{0}-{1:yyyyMMddHHmmss}' -f $env:USERNAME, (Get-Date) ),

        # The message or comment on the shelveset
        [Parameter(
            Position = 1,
            ValueFromPipelineByPropertyName
        )]
        [String]
        $Comment = $env:USERNAME,

        # The Workspace
        [Parameter(
            Position = 2,
            ValueFromPipeline
        )]
        [Microsoft.TeamFoundation.VersionControl.Client.Workspace]
        $Workspace = (Get-TFVCActiveWorkspace),

        # Pending changes to shelve
        [Parameter(
            Position = 3,
            ValueFromPipeline
        )]
        [Microsoft.TeamFoundation.VersionControl.Client.PendingChange[]]
        $PendingChange = (Get-TFVCPendingChange),

        # Active TFVC Session
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [TFVCSession]
        $TFVCSession = (Get-TFVCSession),

        # ShelvingOptions
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [Microsoft.TeamFoundation.VersionControl.Client.ShelvingOptions]
        $ShelvingOptions = [Microsoft.TeamFoundation.VersionControl.Client.ShelvingOptions]::Replace
    )

    process
    {
        try
        {
            $shelveset = $TFVCSession.CreateShelveset( $Name )
            $shelveset.Comment = $Comment

            if ( $PSCmdlet.ShouldProcess( $Workspace.DisplayName ) )
            {
                $Workspace.Shelve( $shelveset, $PendingChange, $ShelvingOptions )
                return $shelveset
            }
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
