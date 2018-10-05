Describe 'Function Add-TFVCItem' {

    BeforeAll {
        $source = '$/DevOpsTFVCTest/master'
        $local = "$testdrive\DevOpsTFVCTest\master"

        New-TFVCSession -ServerURI https://tfs -ProjectCollection DevOps
        $workspace = New-TFVCWorkspace -SetActiveWorkspace
        Add-TFVCWorkspaceMapping -Source $source -Destination $local
    }

    BeforeEach {
        Remove-TFVCPendingChange
        Get-ChildItem -Path $local -Recurse | Remove-Item -ErrorAction Ignore -Recurse -Force
    }

    It 'Adds a file to the pending changes' {
        $path = "$local\file.txt"
        Set-Content -Path $path -Value (Get-Date)

        Add-TFVCItem -Path $path

        $changes = Get-TFVCPendingChange
        $changes | Should -Not -BeNullOrEmpty
        $chagnes | Should -HaveCount 1
    }

    It 'Adds a folder to the pending changes' {
        $path = "$local\folder"
        New-Item -Path $path -ItemType Directory -Force -ErrorAction Ignore

        Add-TFVCItem -Path $path

        $changes = Get-TFVCPendingChange
        $changes | Should -Not -BeNullOrEmpty
        $chagnes | Should -HaveCount 1
    }

    It 'Adds multiple items to the pending changes' {

        New-Item -Path "$local\folder" -ItemType Directory -Force -ErrorAction Ignore

        $path = "$local\file.txt"
        Set-Content -Path $path -Value (Get-Date)

        Add-TFVCItem -Path $local -Recurse

        $changes = Get-TFVCPendingChange
        $changes | Should -Not -BeNullOrEmpty
        $changes | Should -HaveCount 3 -Because 'We selected a folder that had 2 sub items'
    }

    AfterAll {
        Remove-TFVCWorkspace
    }
}
