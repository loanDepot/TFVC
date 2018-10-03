Describe 'function Add-TFVCWorkspaceMapping' -Tag LocalIntegration {

    BeforeAll {
        $local = "$testdrive\ppe\trunk"
        $source = '$/PPE/trunk'

        New-TFVCSession -ServerURI https://tfs -ProjectCollection ldts
        $workspace = New-TFVCWorkspace
    }

    It 'Does not throw' {
        $folder = $workspace | Add-TFVCWorkspaceMapping -Source $source -Destination $local
        $folder | Should -Not -BeNullOrEmpty
    }

    AfterAll {
        $workspace | Remove-TFVCWorkspace
    }
}
