#Requires -Version 5.1
param(
    [ValidateSet('user', 'project')]
    [string]$Scope = 'user',
    [string[]]$Agents = @('cursor', 'claude', 'codex')
)

$ErrorActionPreference = 'Stop'
$Cli = Join-Path (Split-Path -Parent $PSScriptRoot) "bin\motion-arch-slide.js"
$agentArg = ($Agents -join ',')
& node $Cli install --scope $Scope --agents $agentArg @args
