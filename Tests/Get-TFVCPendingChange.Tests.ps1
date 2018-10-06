Describe 'Function Get-TFVCPendingChange' -Tag LocalIntegration {
    BeforeAll {
        New-TFVCSession -ServerURI https://tfs -ProjectCollection DevOps
        New-TFVCWorkspace -SetActiveWorkspace
    }
    It 'Should not throw' {
        Get-TFVCPendingChange
    }
}
