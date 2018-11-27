# This script requires Administrator privileges, because it creates symlinks.

Function Install-Dotfile($filename)
{
	New-Item -ItemType SymbolicLink -Force -Path "$HOME/$filename" -Target "$PSScriptRoot\$filename"
}

New-Item -ItemType SymbolicLink -Path $profile -Target "$PSScriptRoot\Microsoft.PowerShell_profile.ps1" -Force
New-Item -ItemType SymbolicLink -Path "$HOME/vimfiles" -Target "$PSScriptRoot\..\home\.vim" -Force

Install-Dotfile("_vimrc")
Install-Dotfile(".gitconfig")
