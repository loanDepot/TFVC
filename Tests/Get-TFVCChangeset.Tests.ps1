Describe 'Function Get-TFVCChangeset' -Tag LocalIntegration {

    It 'Gets the specified changeset' {

        New-TFVCSession -ServerURI https://tfs -ProjectCollection DevOps
        New-TFVCWorkspace -SetActiveWorkspace

        $ID = 21
        $changeset = Get-TFVCChangeset -ChangesetID $ID
        $changeset | Should -Not -BeNullOrEmpty
        $changeset.Comment | Should -Not -BeNullOrEmpty
        $changeset.ChangesetId | Should -Be $ID
    }
}
