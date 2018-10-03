Describe 'Function Get-TFVCMergeCandidate' -Tag LocalIntegration {

    BeforeAll {
        New-TFVCSession -ServerURI https://tfs -ProjectCollection ldts
    }

    BeforeEach {
        $sourceBranch = '$/DevOps/Sandboxes/LDXProject'
        $targetBranch = '$/DevOps/Sandboxes/KMarquette'
    }

    It 'Does something' {
        $changeset = Get-TFVCMergeCandidate -SourceBranch $sourceBranch -TargetBranch $targetBranch
        $changeset | Should -Not -BeNullOrEmpty
    }

    It "Handles incorrect target path" {
        $changeset = Get-TFVCMergeCandidate -SourceBranch '$/DevOps/doesnotexist' -TargetBranch $targetBranch
        $changeset | Should -BeNullOrEmpty
    }
}
