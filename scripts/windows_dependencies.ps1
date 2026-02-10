Write-Host "installing required packages for nvim" -foregroundcolor cyan

$packages = @(
	"Neovim.Neovim",
	"MartinStorsjo.LLVM-MinGW.MSVCRT",
	"zig.zig",
	"GnuWin32.Make",
	"Rustlang.Rust.MSVC",
	"GoLang.Go",
	"Kitware.Cmake",
	"Ninja-build.Ninja"
)

# cargo install --locked tree-sitter-cli

foreach ( $package in $packages ) {
	Write-Host "Installing $package..." -foregroundcolor yellow
	# winget install $package
}

$list = @(
    "Git.Git",
    "ajeetdsouza.zoxide"
)

Write-Host "Module list" -ForegroundColor Magenta
for ($i = 0; $i -lt $list.Count; $i++) {
    $index = $i + 1
    Write-Host "$index) $($list[$i])" -ForegroundColor Magenta
}

Write-Host "Do you want to install the above modules for PowerShell (y/n)? " -ForegroundColor Green -NoNewLine
$answer = Read-Host

if ($answer -eq 'y' -or $answer -eq 'Y') {
    foreach ($module in $list) {
        Write-Host "Installing $module..." -ForegroundColor Yellow
        # winget install --id $module -e
    }
	return
}
