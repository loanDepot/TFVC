Describe 'functon Get-TFVCWorkspace' -Tag LocalIntegration {

    BeforeAll {
        $Name = ('{0}-{1}-deleteme-{2}' -f $env:COMPUTERNAME, $env:USERNAME, (New-Guid)).Substring(0, 64)
        $source = '$/DevOpsTFVCTest/master'
        $local = "$testdrive\DevOpsTFVCTest\master"

        New-TFVCSession -ServerURI https://tfs -ProjectCollection DevOps
        New-TFVCWorkspace -Name $Name
        Add-TFVCWorkspaceMapping -Source $source -Destination $local
    }

    BeforeEach {
    }

    It 'Gets a local workspace' {
        Get-TFVCWorkspace -Path $workspaceFolder | Should -Not -BeNullOrEmpty
    }

    It 'handles getting a missing workspace' {
        Get-TFVCWorkspace -Name 'MISSING_WORKSPACE_NAME' |
            Should -BeNullOrEmpty
    }

    AfterAll {
        Remove-TFVCWorkspace -Name $Name
    }
}
