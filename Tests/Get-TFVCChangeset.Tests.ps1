Describe 'Function Get-TFVCChangeset' -Tag LocalIntegration {

    It 'Gets the specified chagneset' {

        New-TFVCSession -ServerURI https://tfs -ProjectCollection DevOps
        New-TFVCWorkspace -SetActiveWorkspace

        $ID = 122895
        $changeset = Get-TFVCChangeset -ChangesetID $ID
        $changeset | Should -Not -BeNullOrEmpty
        $changeset.Comment | Should -Not -BeNullOrEmpty
        $changeset.ChangesetId | Should -Be $ID
    }
}
