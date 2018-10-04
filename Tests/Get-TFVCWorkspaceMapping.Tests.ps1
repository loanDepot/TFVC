Describe 'function Get-TFVCWorkspaceMapping' -Tag LocalIntegration {

    BeforeAll {
        $source = '$/DevOpsTFVCTest/master'
        $local = "$testdrive\DevOpsTFVCTest\master"

        New-TFVCSession -ServerURI https://tfs -ProjectCollection DevOps
        $workspace = New-TFVCWorkspace
    }

    It 'Does not throw' {
        $folder = $workspace | Add-TFVCWorkspaceMapping -Source $source -Destination $local
        $folder | Should -Not -BeNullOrEmpty

        $workspace | Get-TFVCWorkspaceMapping | Should -Not -BeNullOrEmpty
    }

    It 'Handles filtering' {
        $workspace | Add-TFVCWorkspaceMapping -Source '$/DevOpsTFVCTest/trunk' -Destination "$testdrive\DevOpsTFVCTest\trunk"
        $workspace | Add-TFVCWorkspaceMapping -Source $source -Destination $local

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
