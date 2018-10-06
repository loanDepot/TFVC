Describe 'Function New-TFVCShelveset' -Tag LocalIntegration {

    BeforeAll {
        New-TFVCSession -ServerURI https://tfs -ProjectCollection DevOps
        $Workspace = New-TFVCWorkspace -SetActiveWorkspace
    }
    It 'Should not throw' {
        New-TFVCShelveset -WhatIf
    }
}

