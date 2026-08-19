#Requires -Version 5.1
param(
    [ValidateSet('user', 'project')]
    [string]$Scope = 'user',
    [string[]]$Agents = @('cursor', 'claude', 'codex')
)

$ErrorActionPreference = 'Stop'
$Root = Split-Path -Parent $PSScriptRoot
$BundleItems = @('SKILL.md', 'DESIGN.md', 'INSTALL.md', 'references', 'templates', 'slides')

function Copy-SkillBundle {
    param([string]$Dest)
    if (Test-Path $Dest) { Remove-Item -Recurse -Force $Dest }
    New-Item -ItemType Directory -Force -Path $Dest | Out-Null
    foreach ($item in $BundleItems) {
        $src = Join-Path $Root $item
        if (-not (Test-Path $src)) { continue }
        Copy-Item -Path $src -Destination (Join-Path $Dest $item) -Recurse -Force
    }
}

function Get-TargetDirs {
    param([string]$Agent, [string]$Scope)
    $name = 'motion-arch-slide'
    switch ($Agent) {
        'cursor' {
            if ($Scope -eq 'project') { return @((Join-Path $Root ".cursor\skills\$name")) }
            return @((Join-Path $env:USERPROFILE ".cursor\skills\$name"))
        }
        'claude' {
            if ($Scope -eq 'project') { return @((Join-Path $Root ".claude\skills\$name")) }
            return @((Join-Path $env:USERPROFILE ".claude\skills\$name"))
        }
        'codex' {
            if ($Scope -eq 'project') { throw 'Codex skills are user-scoped only.' }
            $codexHome = if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $env:USERPROFILE '.codex' }
            return @((Join-Path $codexHome "skills\$name"))
        }
        default { throw "Unknown agent: $Agent" }
    }
}

$installed = @()
foreach ($agent in $Agents) {
    foreach ($dir in (Get-TargetDirs -Agent $agent -Scope $Scope)) {
        Copy-SkillBundle -Dest $dir
        $installed += $dir
        Write-Host "Installed -> $dir"
    }
}

Write-Host ""
Write-Host "Done. Restart agent chat or start a new turn."
Write-Host "Cursor/Claude: @motion-arch-slide"
