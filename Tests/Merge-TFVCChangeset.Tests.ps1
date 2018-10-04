Describe 'Function Merge-TFVCChangeset' -Tag LocalIntegration {

    It 'Happy path integration test' {
        New-TFVCSession -ServerURI https://tfs -ProjectCollection DevOps

        $source = '$/DevOpsTFVCTest'
        $local = "$testdrive\DevOpsTFVCTest\master"

        $sourceBranch = "$source/trunk"
        $targetBranch = "$source/master"

        $Workspace = New-TFVCWorkspace -SetActiveWorkspace
        $Workspace | Add-TFVCWorkspaceMapping -Source $targetBranch -Destination $local

        Remove-TFVCPendingChange
        Get-TFVCLatest


        $changeset = Get-TFVCMergeCandidate -SourceBranch $sourceBranch -TargetBranch $targetBranch
        $changeset | Should -Not -BeNullOrEmpty -Because 'We need testdata for the merge'

        Merge-TFVCChangeset -Workspace $Workspace -SourceBranch $sourceBranch -TargetBranch $targetBranch -FromChangeset $changeset[0] -ToChangeset $changeset[-1]

        $changes = Get-TFVCPendingChange
        $changes | Should -Not -BeNullOrEmpty -Because 'The merge should have created pending changes'
        $changes | Remove-TFVCPendingChange

        Get-TFVCPendingChange | Should -BeNullOrEmpty -Because 'All the changes should have been removed'
    }
}
