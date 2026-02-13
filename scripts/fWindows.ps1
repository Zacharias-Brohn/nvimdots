Write-Host "NVIM setup script for Windows" -ForegroundColor Green
Write-Host "Installing winget packages" -foregroundcolor cyan

$packages = @(
	"Neovim.Neovim",
	"MartinStorsjo.LLVM-MinGW.MSVCRT",
	"zig.zig",
	"GnuWin32.Make",
	"Rustlang.Rust.MSVC",
	"GoLang.Go",
	"Kitware.Cmake",
	"Ninja-build.Ninja",
	"LuaLS.lua-language-server"
)

for ($i = 0; $i -lt $packages.Count; $i++) {
    $index = $i + 1
    Write-Host ("{0,4})  {1}" -f $index, $packages[$i]) -foreground yellow
	winget install $package
}

if ( !(Get-Command cargo -ErrorAction SilentlyContinue) ) {
    Write-Host "Cargo is not installed. Please install Rust to proceed." -ForegroundColor Red
    return
} else {
    Write-Host "Installing cargo package treesitter-cli" -foregroundcolor cyan
    cargo install --locked tree-sitter-cli
}

$list = @(
    "Git.Git",
    "ajeetdsouza.zoxide"
)

Write-Host "`nOptional packages to install:`n" -ForegroundColor Magenta

for ($i = 0; $i -lt $list.Count; $i++) {
    $index = $i + 1
    Write-Host "$index) $($list[$i])" -ForegroundColor Magenta
}

Write-Host "`nInstall all packages? [Y]es / [N]o / [E]dit list: " -ForegroundColor Green -NoNewLine
$answer = Read-Host

switch ($answer.ToLower()) {

    "y" {
        $selected = $list
    }

    "n" {
        Write-Host "No packages will be installed." -ForegroundColor Red
        return
    }

    "e" {
        Write-Host "`nEnter numbers to EXCLUDE (space separated, e.g. 2 3): " -ForegroundColor Yellow -NoNewLine
        $excludeInput = Read-Host

        $excludeIndexes = $excludeInput -split "\s+" | ForEach-Object { [int]$_ - 1 }

        $selected = @()
        for ($i = 0; $i -lt $list.Count; $i++) {
            if ($excludeIndexes -notcontains $i) {
                $selected += $list[$i]
            }
        }
    }

    default {
        Write-Host "Invalid option. Exiting." -ForegroundColor Red
        return
    }
}

if ($selected.Count -eq 0) {
    Write-Host "Nothing to install." -ForegroundColor Red
    return
}

Write-Host "`nInstalling selected packages:`n" -ForegroundColor Cyan

foreach ($module in $selected) {
    Write-Host "Installing $module..." -ForegroundColor Yellow
    winget install --id $module
}
