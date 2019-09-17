using namespace Microsoft.TeamFoundation.Client
using namespace Microsoft.TeamFoundation.VersionControl.Client

class TFVCSession
{
    [uri]
    $DisplayName

    [uri]
    $Server

    hidden
    [PSCredential]
    $Credential

    hidden
    [TfsTeamProjectCollection]
    $TfsTeamProjectCollection

    hidden
    [VersionControlServer]
    $VersionControlServer


    TFVCSession( [uri]$ProjectCollectionURI )
    {
        $this.Connect( $ProjectCollectionURI )
    }

    TFVCSession( [uri]$ProjectCollectionURI, [PSCredential]$Credential )
    {
        $this.Connect( $ProjectCollectionURI, $Credential )
    }

    TFVCSession( [uri]$Server, [string]$ProjectCollectionName )
    {
        $URI = [uribuilder]::new( $Server)
        $URI.Path = $this.AppendProjectCollectionToPath($URI.Path, $ProjectCollectionName)
        $this.Connect( $URI.uri )
    }

    TFVCSession( [uri]$Server, [string]$ProjectCollectionName, [PSCredential]$Credential )
    {
        $URI = [uribuilder]::new( $Server)
        $URI.Path = $this.AppendProjectCollectionToPath($URI.Path, $ProjectCollectionName)
        $this.Connect( $URI.uri, $Credential )
    }

    [string] AppendProjectCollectionToPath([string]$Path, [string]$ProjectCollectionName)
    {
        if (-not $Path.EndsWith('/'))
        {
            $Path = "$Path/"
        }
        return $Path + $ProjectCollectionName
    }

    [Void] Connect( [uri]$ProjectCollectionURI )
    {
        $this.TfsTeamProjectCollection = [TfsTeamProjectCollection]::new( $ProjectCollectionURI )

        $this.ValidateConnection($ProjectCollectionURI)
        $this.RefreshProperties()
    }

    [Void] Connect( [uri]$ProjectCollectionURI, [PSCredential]$Credential )
    {
        $this.TfsTeamProjectCollection = [TfsTeamProjectCollection]::new( $ProjectCollectionURI, $Credential )
        $this.TfsTeamProjectCollection.Credentials = $Credential

        $this.ValidateConnection($ProjectCollectionURI)
        $this.RefreshProperties()
    }

    [Void] ValidateConnection([uri] $uri)
    {
        if ( $null -eq $this.TfsTeamProjectCollection.ConfigurationServer )
        {
            throw [TFVCSessionException]::New("Was not able to establish a connection to the specified endpoint [$uri]")
        }
    }

    [Void] RefreshProperties()
    {
        if ( $null -ne $this.TfsTeamProjectCollection )
        {
            $this.DisplayName = $this.TfsTeamProjectCollection.DisplayName
            $this.Server = $this.TfsTeamProjectCollection.ConfigurationServer.Uri
            $this.VersionControlServer = $this.GetVersionControlServer()
        }
    }

    [Void] Disconnect()
    {
        if ($null -ne $this.TfsTeamProjectCollection)
        {
            $this.TfsTeamProjectCollection.Disconnect()
            $this.TfsTeamProjectCollection.Dispose()
            $this.TfsTeamProjectCollection = $null
        }
    }

    hidden
    [VersionControlServer] GetVersionControlServer ()
    {
        return $this.TfsTeamProjectCollection.GetService( [VersionControlServer] )
    }

    [Workspace] GetWorkspaceFromPath( $LocalPath )
    {
        return $this.VersionControlServer.GetWorkspace( $LocalPath )
    }

    [Workspace] GetWorkspace( $WorkspaceName, $WorkspaceOwner )
    {
        return $this.VersionControlServer.GetWorkspace( $WorkspaceName, $WorkspaceOwner )
    }

    [Workspace] CreateWorkspace( $Name )
    {
        return $this.VersionControlServer.CreateWorkspace( $Name )
    }

    [Shelveset] CreateShelveset( [string]$Name )
    {
        return [Shelveset]::new( $this.VersionControlServer, $Name, $ENV:USERNAME )
    }

    [Changeset] GetChangeset( [Int32]$ChangesetID, [bool]$IncludeChanges, [bool]$IncludeDownloadInfo )
    {
        return $this.VersionControlServer.GetChangeset(
            $ChangesetID, $IncludeChanges, $IncludeDownloadInfo
        )
    }

    [Void] DownloadFile( [string]$ServerPath, [string]$DestinationPath )
    {
        $folder = Split-Path $DestinationPath
        New-Item -Path $folder -ItemType Directory -Force -ErrorAction Ignore

        $this.VersionControlServer.DownloadFile( $ServerPath, $DestinationPath )
    }

    [Changeset[]] GetHistory (
        [String] $ServerPath,
        [String] $User,
        [Int32] $MaxCount,
        [Boolean] $IncludeChanges,
        [Boolean] $SortAscending
    )
    {
        [Int32] $DeletionId = 0
        [VersionSpec] $Version = [VersionSpec]::Latest
        [RecursionType] $Recursion = [RecursionType]::Full
        [VersionSpec] $VersionFrom = $null
        [VersionSpec] $VersionTo = $null
        [Boolean] $SlotMode = $true
        [Boolean] $IncludeDownloadInfo = $true

        if ( [string]::IsNullOrEmpty( $User ) )
        {
            $User = [NullString]::Value
        }

        return $this.VersionControlServer.QueryHistory(
            $ServerPath,
            $Version,
            $DeletionId,
            $Recursion,
            $User,
            $VersionFrom,
            $VersionTo,
            $MaxCount,
            $IncludeChanges,
            $SlotMode,
            $IncludeDownloadInfo,
            $SortAscending
        )
    }
}
