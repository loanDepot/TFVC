# TFVC

TFS Source Control Management PowerShell Module.

There are several TFVC actions that are available from the TFS client libraries that are not availabe from the TFS rest endpoint. This module leverages the TFS client libraries to perform those actions.

This project is in beta at the moment. The commands and parameters are subject to change as we continue to build on this module.

# Git

To clone this repository

    git clone https://github.com/loanDepot/TFVC.git

# Building

Run the build script in the root of the project to install dependent modules and start the build

    .\build.ps1

To just run the build, execute Invoke-Build

    Invoke-Build

    # or do a clean build
    Invoke-Build Clean,Default


Install dev version of the module on the local system after building it.

    Invoke-Build Install

# Integration tests

Most of the tests in this module require a TFS instance to run. Those tests are tagged as 'LocalIntegration' and do not run by default with the build. To execute the integration test, invoke Pester with the 'LocalIntegration' tag.

    Invoke-Pester -Tag LocalIntegration

# Example

Here are a few quick commands to connect to a TFS server and project collection. This will create a new workspace, add a mapping, and get latest.

    New-TFVCSession -ServerURI https://tfs -ProjectCollection DevOps
    New-TFVCWorkspace -SetActiveWorkspace

    $source = '$/DevOps/master'
    $local = "$env:temp\DevOps\master"
    Add-TFVCWorkspaceMapping -Source $targetBranch -Destination $local

    Get-TFVCLatest

# Commands in this module

Here are the current commands available in the module:

    Add-TFVCItem
    Add-TFVCWorkspaceMapping
    Get-TFVCActiveWorkspace
    Get-TFVCChangeset
    Get-TFVCFile
    Get-TFVCHistory
    Get-TFVCLatest
    Get-TFVCMergeCandidate
    Get-TFVCPendingChange
    Get-TFVCSession
    Get-TFVCWorkspace
    Get-TFVCWorkspaceMapping
    Merge-TFVCChangeset
    New-TFVCSession
    New-TFVCShelveset
    New-TFVCWorkspace
    Remove-TFVCActiveWorkspace
    Remove-TFVCPendingChange
    Remove-TFVCSession
    Remove-TFVCWorkspace
    Remove-TFVCWorkspaceMapping
    Save-TFVCPendingChange
    Set-TFVCActiveWorkspace
