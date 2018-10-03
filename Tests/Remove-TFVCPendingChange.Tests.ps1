Describe 'Function Remove-TFVCPendingChange' -Tag LocalIntegration {

    BeforeAll {
        New-TFVCSession -ServerURI https://tfs -ProjectCollection ldts
        $workspace = New-TFVCWorkspace -SetActiveWorkspace
    }

    It 'Should not throw' {
        Remove-TFVCPendingChange -WhatIf
    }

    It 'Does something' {
        Remove-TFVCPendingChange -Workspace $Workspace
    }
}
