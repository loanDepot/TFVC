<#
.Notes
This need an active connectiont to a TFS server
#>

Describe 'Function Remove-TFVCWorkspace' -Tag LocalIntegration {

    BeforeAll {
        New-TFVCSession -ServerURI https://tfs -ProjectCollection DevOps
    }

    Context 'Functionality' {

        BeforeEach {
            $Name = ('{0}-{1}-deleteme-{2}' -f $env:COMPUTERNAME, $env:USERNAME, (New-Guid)).Substring(0, 64)
        }

        It 'does not throw' {
            $workspace = Remove-TFVCWorkspace -Name $Name -WhatIf
            $workspace | Should -BeNullOrEmpty
        }

        It 'removes a workspace' {
            $workspace = New-TFVCWorkspace -Name $Name
            $workspace | Should -Not -BeNullOrEmpty -Because 'New workspace should have been created'
            $workspace | Remove-TFVCWorkspace
            $workspace2 = Get-TFVCWorkspace -Name $name

            $workspace2 | Should -BeNullOrEmpty -Because 'It should have been deleted'
        }

        It 'removes a workspace by name' {

            $workspace = New-TFVCWorkspace -Name $Name
            $workspace | Should -Not -BeNullOrEmpty -Because 'New workspace should have been created'
            Remove-TFVCWorkspace -Name $Name

            $workspace2 = Get-TFVCWorkspace -Name $name

            $workspace2 | Should -BeNullOrEmpty -Because 'It should have been deleted'
        }

        It 'removes a from a Get-TFVCWorkspace' {

            New-TFVCWorkspace -Name $Name
            $workspace = Get-TFVCWorkspace -Name $name
            $workspace | Should -Not -BeNullOrEmpty -Because 'New workspace should have been created and retreived'

            $workspace | Remove-TFVCWorkspace

            $workspace2 = Get-TFVCWorkspace -Name $name
            $workspace2 | Should -BeNullOrEmpty -Because 'It should have been deleted'
        }

        It 'safe to call remove twice' {
            $workspace = New-TFVCWorkspace -Name $Name
            $workspace | Should -Not -BeNullOrEmpty -Because 'New workspace should have been created'

            $workspace | Remove-TFVCWorkspace
            $workspace | Remove-TFVCWorkspace

            $workspace2 = Get-TFVCWorkspace -Name $name
            $workspace2 | Should -BeNullOrEmpty -Because 'It should have been deleted'
        }

        It 'safe to call remove name when it does not exist' {
            Remove-TFVCWorkspace -Name $Name
        }
    }
}
