Describe 'function Remove-TFVCWorkspaceMapping' -Tag LocalIntegration {

    BeforeAll {
        $source = '$/DevOpsTFVCTest/master'
        $local = "$testdrive\DevOpsTFVCTest\master"

        New-TFVCSession -ServerURI https://tfs -ProjectCollection DevOps
        $workspace = New-TFVCWorkspace
    }

    It 'Does not throw' {
        $folder = $workspace | Add-TFVCWorkspaceMapping -Source $source -Destination $local
        $folder | Should -Not -BeNullOrEmpty
        $workspace | Remove-TFVCWorkspaceMapping -Source $source
    }

    It 'Will remove folder object' {
        $folder = $workspace | Add-TFVCWorkspaceMapping -Source $source -Destination $local
        $folder | Should -Not -BeNullOrEmpty
        $workspace | Remove-TFVCWorkspaceMapping -Mapping $folder
    }

    AfterAll {
        $workspace | Remove-TFVCWorkspace
    }
}
