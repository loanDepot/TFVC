Describe 'Function Get-TFVCHistory' -Tag LocalIntegration {

    It 'Gets the history for a branch' {
        New-TFVCSession -ServerURI https://tfs -ProjectCollection DevOps
        $sourceBranch = '$/DevOps/Sandboxes/KMarquette'
        $history = Get-TFVCHistory -ServerPath $sourceBranch -MaxCount 3
        $history | Should -Not -BeNullOrEmpty
        $history | Should -HaveCount 3 -Because 'We specified to have a max count of 3'
    }
}
