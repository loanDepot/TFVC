Describe 'function Get-TFVCWorkspaceMapping' -Tag LocalIntegration {

    BeforeAll {
        $local = "$testdrive\ppe\trunk"
        $source = '$/PPE/trunk'

        New-TFVCSession -ServerURI https://tfs -ProjectCollection ldts
        $workspace = New-TFVCWorkspace
    }

    It 'Does not throw' {
        $folder = $workspace | Add-TFVCWorkspaceMapping -Source $source -Destination $local
        $folder | Should -Not -BeNullOrEmpty

        $workspace | Get-TFVCWorkspaceMapping | Should -Not -BeNullOrEmpty
    }

    It 'Handles filtering' {
        $workspace | Add-TFVCWorkspaceMapping -Source '$/PPE/master' -Destination "$testdrive\ppe\master"
        $workspace | Add-TFVCWorkspaceMapping -Source $source -Destination $local -Verbose

        $folder = $workspace | Get-TFVCWorkspaceMapping
        $folder | Should -Not -BeNullOrEmpty
        $folder | Should -HaveCount 2

        $folder2 = $workspace | Get-TFVCWorkspaceMapping -Source $source
        $folder2 | Should -Not -BeNullOrEmpty
        $folder2 | Should -HaveCount 1

        $folder3 = $workspace | Get-TFVCWorkspaceMapping -Destination $local
        $folder3 | Should -Not -BeNullOrEmpty
        $folder3 | Should -HaveCount 1

        $workspace | Get-TFVCWorkspaceMapping -Destination $local | Should -Not -BeNullOrEmpty
    }

    AfterAll {
        $workspace | Remove-TFVCWorkspace
    }
}
