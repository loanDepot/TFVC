Describe 'Function New-TFVCShelveset' -Tag LocalIntegration {

    BeforeAll {
        New-TFVCSession -ServerURI https://tfs -ProjectCollection ldts
        $Workspace = New-TFVCWorkspace -SetActiveWorkspace
    }
    It 'Should not throw' {
        New-TFVCShelveset -WhatIf
    }
}

