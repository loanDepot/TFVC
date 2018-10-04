Describe 'Function Get-TFVCFile' {

    BeforeAll {
        New-TFVCSession -ServerURI https://tfs -ProjectCollection ldts
        $Source = '$/DevOps/Sandboxes/KMarquette/DeployHelper.ps1'
        $Destination = "$testdrive\DeployHelper.ps1"
    }

    It 'Should not throw' {
        Get-TFVCFile -WhatIf -Source $source -Destination $Destination
    }

    It 'Does something' {
        Get-TFVCFile -Source $source -Destination $Destination
        "$Destination" | Should -Exist
    }
}
