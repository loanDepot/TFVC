<#
.Notes
This need an active connectiont to a TFS server
#>

Describe 'Function New-TFVCWorkspace' -Tag LocalIntegration {

    BeforeAll {
        New-TFVCSession -ServerURI https://tfs -ProjectCollection DevOps
    }

    Context 'Functionality' {

        BeforeEach {
            $Name = ('{0}-{1}-deleteme-{2}' -f $env:COMPUTERNAME, $env:USERNAME, (New-Guid)).Substring(0, 64)
        }

        It 'does not throw' {
            $workspace = New-TFVCWorkspace -Name $Name -WhatIf
            $workspace | Should -BeNullOrEmpty

            $workspace = Get-TFVCWorkspace -Name $Name
            $workspace | Should -BeNullOrEmpty
        }

        it 'also does not throw' {
            New-TFVCSession -ServerURI https://tfs -ProjectCollection DevOps
            $workspace = New-TFVCWorkspace
            $workspace | Should -Not -BeNullOrEmpty
        }

        It 'creates a workspace' {
            $workspace = New-TFVCWorkspace -Name $Name
            $workspace | Should -Not -BeNullOrEmpty
            $workspace | Remove-TFVCWorkspace
        }

        It 'returns a workspace if it already exists' {
            $workspace = New-TFVCWorkspace -Name $Name
            $workspace | Should -Not -BeNullOrEmpty

            $workspace2 = New-TFVCWorkspace -Name $Name
            $workspace2 | Should -Not -BeNullOrEmpty

            $workspace | Remove-TFVCWorkspace
        }
    }
}
