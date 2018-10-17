[CmdletBinding()]

param($Task = 'Default')
$ProgressPreference=’SilentlyContinue’

$Script:Modules = @(
    'BuildHelpers',
    'InvokeBuild',
    #'LDModuleBfuilder',
    'Pester',
    'platyPS',
    'PSScriptAnalyzer',
    'TFVC.libraries'
)

$Script:ModuleInstallScope = 'CurrentUser'

'Starting build...'
'Installing module dependencies...'

Get-PackageProvider -Name 'NuGet' -ForceBootstrap | Out-Null

foreach ( $module in $Modules )
{
    "  Installing [$module]"
    $install = Find-Module $module -ErrorAction Stop | Sort-Object Repository | Select-Object -First 1
    $installed = $install | Install-Module -Force -SkipPublisherCheck -AllowClobber -AcceptLicense -Scope $Script:ModuleInstallScope -ErrorAction Stop
    $installed | Import-Module -ErrorAction Stop
    $installed
}

Set-BuildEnvironment
Get-ChildItem Env:BH*
Get-ChildItem Env:APPVEYOR*

$Error.Clear()

'Invoking build'

Invoke-Build $Task -Result 'Result'
if ($Result.Error)
{
    $Error[-1].ScriptStackTrace | Out-String
    exit 1
}

exit 0
