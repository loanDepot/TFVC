Describe 'Function Merge-TFVCChangeset' {

    It 'Happy path integration test' {
        New-TFVCSession -ServerURI https://tfs -ProjectCollection ldts

        $Workspace = New-TFVCWorkspace -SetActiveWorkspace
        $Workspace | Add-TFVCWorkspaceMapping -Source '$/DevOps/Sandboxes/KMarquette' -Destination 'c:\AllSource\temp\kmarquette'
        $Workspace | Add-TFVCWorkspaceMapping -Source '$/DevOps/Sandboxes/KMarquette-test' -Destination 'c:\AllSource\temp\kmarquette-test'

        Remove-TFVCPendingChange
        Get-TFVCLatest

        $sourceBranch = '$/DevOps/Sandboxes/KMarquette'
        $targetBranch = '$/DevOps/Sandboxes/KMarquette-test'

        $changeset = Get-TFVCMergeCandidate -SourceBranch $sourceBranch -TargetBranch $targetBranch
        $changeset | Should -Not -BeNullOrEmpty -Because 'We need testdata for the merge'

        Merge-TFVCChangeset -Workspace $Workspace -SourceBranch $sourceBranch -TargetBranch $targetBranch -FromChangeset $changeset[0] -ToChangeset $changeset[-1]

        $changes = Get-TFVCPendingChange
        $changes | Should -Not -BeNullOrEmpty -Because 'The merge should have created pending changes'
        $changes | Remove-TFVCPendingChange

        Get-TFVCPendingChange | Should -BeNullOrEmpty -Because 'All the changes should have been removed'
    }
}
