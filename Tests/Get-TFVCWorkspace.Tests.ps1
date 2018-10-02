Describe 'functon Get-TFVCWorkspace' -Tag LocalIntegration {

    $workspaceFolder = 'C:\AllSource\CLP\trunk'
    it 'Gets a local workspace' {
        New-TFVCSession -ServerURI https://tfs -ProjectCollection LDTS
        Get-TFVCWorkspace -Path $workspaceFolder | Should -Not -BeNullOrEmpty
    }
}
