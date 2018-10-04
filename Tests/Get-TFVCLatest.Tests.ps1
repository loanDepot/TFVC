Describe 'function Get-TFVCLatest' -Tag LocalIntegration {

    BeforeAll {
        $local = "$testdrive\ppe\trunk"
        $source = '$/PPE/trunk'

        New-TFVCSession -ServerURI https://tfs -ProjectCollection DevOps
        $workspace = New-TFVCWorkspace
        $folder = $workspace | Add-TFVCWorkspaceMapping -Source $source -Destination $local
    }

    It 'Does not throw' {
        $workspace | Get-TFVCLatest -whatif
    }

    It 'Gets latest changes' {
        $workspace | Get-TFVCLatest
    }

    AfterAll {
        $workspace | Remove-TFVCWorkspace
    }
}
