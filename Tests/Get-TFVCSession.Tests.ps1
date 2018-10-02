Describe 'Function Get-TFVCSession' -Tag LocalIntegration {
    Context 'Functionality' {
        It 'does not throw' {
            New-TFVCSession -ServerURI https://tfs -ProjectCollection ldts
            Get-TFVCSession | Should -Not -BeNullOrEmpty
        }
    }
}
