Describe 'Function Get-TFVCMergeCandidate' -Tag LocalIntegration {

    BeforeAll {
        New-TFVCSession -ServerURI https://tfs -ProjectCollection DevOps
    }

    BeforeEach {
        $sourceBranch = '$/DevOpsTFVCTest/trunk'
        $targetBranch = '$/DevOpsTFVCTest/master'
    }

    It 'Does something' {
        $changeset = Get-TFVCMergeCandidate -SourceBranch $sourceBranch -TargetBranch $targetBranch
        $changeset | Should -Not -BeNullOrEmpty
    }

    It "Handles incorrect target path" {
        $changeset = Get-TFVCMergeCandidate -SourceBranch '$/DevOpsTFVCTest/doesnotexist' -TargetBranch $targetBranch
        $changeset | Should -BeNullOrEmpty
    }

    It "Handles incorrect project path" -Pending {
        $changeset = Get-TFVCMergeCandidate -SourceBranch '$/doesnotexist/doesnotexist' -TargetBranch $targetBranch
        $changeset | Should -BeNullOrEmpty
    }
}
