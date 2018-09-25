class TFVCSession
{
    [uri] $DisplayName
    [uri] $Server

    hidden
    [PSCredential] $Credential

    hidden
    [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection] $TfsTeamProjectCollection

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
        $this.TfsTeamProjectCollection = [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]::new( $ProjectCollectionURI )

        $this.ValidateConnection($ProjectCollectionURI)
        $this.RefreshProperties()
    }

    [void] Connect( [uri]$ProjectCollectionURI, [PSCredential]$Credential )
    {
        $this.TfsTeamProjectCollection = [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]::new( $ProjectCollectionURI, $Credential )
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
}
