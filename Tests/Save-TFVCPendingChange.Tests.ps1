Describe 'Function Save-TFVCPendingChange' -Tag LocalIntegration {

    BeforeAll {
        New-TFVCSession -ServerURI https://tfs -ProjectCollection ldts
        $Workspace = New-TFVCWorkspace -SetActiveWorkspace
    }

    It 'Should not throw' {
        Save-TFVCPendingChange -WhatIf -CommitMessage 'Test commit'
    }
}
