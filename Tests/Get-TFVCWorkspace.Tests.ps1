Describe 'functon Get-TFVCWorkspace' -Tag LocalIntegration {

    BeforeAll {
        New-TFVCSession -ServerURI https://tfs -ProjectCollection DevOps
        $workspaceFolder = 'C:\AllSource\CLP\trunk'
    }

    BeforeEach {
        $Name = ('{0}-{1}-deleteme-{2}' -f $env:COMPUTERNAME, $env:USERNAME, (New-Guid)).Substring(0, 64)
    }

    It 'Gets a local workspace' {
        Get-TFVCWorkspace -Path $workspaceFolder | Should -Not -BeNullOrEmpty
    }

    It 'handles getting a missing workspace' {
        Get-TFVCWorkspace -Name $Name |
            Should -BeNullOrEmpty
    }
}
