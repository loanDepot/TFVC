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
        $URI.Path = $ProjectCollectionName
        $this.Connect( $URI.uri )
    }

    TFVCSession( [uri]$Server, [string]$ProjectCollectionName, [PSCredential]$Credential )
    {
        $URI = [uribuilder]::new( $Server)
        $URI.Path = $ProjectCollectionName
        $this.Connect( $URI.uri, $Credential )
    }

    [void] Connect( [uri]$ProjectCollectionURI )
    {
        $this.TfsTeamProjectCollection = [TfsTeamProjectCollection]::new( $ProjectCollectionURI )

        $this.ValidateConnection($ProjectCollectionURI)
        $this.RefreshProperties()
    }

    [void] Connect( [uri]$ProjectCollectionURI, [PSCredential]$Credential )
    {
        $this.TfsTeamProjectCollection = [TfsTeamProjectCollection]::new( $ProjectCollectionURI, $Credential )
        $this.TfsTeamProjectCollection.Credentials = $Credential

        $this.ValidateConnection($ProjectCollectionURI)
        $this.RefreshProperties()
    }

    [void] ValidateConnection([uri] $uri)
    {
        if( $null -eq $this.TfsTeamProjectCollection.ConfigurationServer )
        {
            throw [System.Runtime.Remoting.ServerException]::New("Was not able to establish a connection to the specified endpoint [$uri]")
        }
    }

    [void] RefreshProperties()
    {
        if ( $null -ne $this.TfsTeamProjectCollection )
        {
            $this.DisplayName = $this.TfsTeamProjectCollection.DisplayName
            $this.Server = $this.TfsTeamProjectCollection.ConfigurationServer.Uri
            $this.VersionControlServer = $this.GetVersionControlServer()
        }
    }
    [void] Disconnect()
    {
        if($null -ne $this.TfsTeamProjectCollection)
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
}
