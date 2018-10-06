Describe 'Function Get-TFVCFile' -tag LocalIntegration {

    BeforeAll {
        New-TFVCSession -ServerURI https://tfs -ProjectCollection DevOps
        $Source = '$/DevOpsTFVCTest/master/readme.md'
        $Destination = "$testdrive\readme.md"
    }

    It 'Should not throw' {
        Get-TFVCFile -WhatIf -Source $source -Destination $Destination
    }

    It 'Does something' {
        Get-TFVCFile -Source $source -Destination $Destination
        "$Destination" | Should -Exist
    }
}
