Describe 'Function Save-TFVCPendingChange' -Tag LocalIntegration {

    BeforeAll {
        New-TFVCSession -ServerURI https://tfs -ProjectCollection DevOps
        $Workspace = New-TFVCWorkspace -SetActiveWorkspace
    }

    It 'Should not throw' {
        Save-TFVCPendingChange -WhatIf -CommitMessage 'Test commit'
    }
}
