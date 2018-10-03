Describe 'Function Get-TFVCPendingChange' -Tag LocalIntegration {
    BeforeAll {
        New-TFVCSession -ServerURI https://tfs -ProjectCollection ldts
        New-TFVCWorkspace -SetActiveWorkspace
    }
    It 'Should not throw' {
        Get-TFVCPendingChange
    }
}
