Describe 'Function Get-TFVCSession' -Tag LocalIntegration {
    Context 'Functionality' {
        It 'does not throw' {
            New-TFVCSession -ServerURI https://tfs -ProjectCollection DevOps
            Get-TFVCSession | Should -Not -BeNullOrEmpty
        }
    }
}
