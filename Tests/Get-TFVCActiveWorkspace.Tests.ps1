Describe 'Function Get-TFVCActiveWorkspace' {
    It 'Should not throw' {

        Get-TFVCActiveWorkspace -WhatIf
    }

    It 'Does something' {
        New-TFVCSession -ServerURI https://tfs -ProjectCollection ldts
        $workspace = New-TFVCWorkspace
        $workspace | Set-TFVCActiveWorkspace
        $workspace2 = Get-TFVCActiveWorkspace
        $workspace2 | Should -Not -BeNullOrEmpty
    }
}
