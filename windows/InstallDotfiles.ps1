# Overwrite the current PowerShell profile, and hardlink that path to the
# profile in this repo.
New-Item -ItemType SymbolicLink -Path $profile -Target "$PSScriptRoot\Microsoft.PowerShell_profile.ps1" -Force

# Put in a sensible vimrc, and link the runfiles directory to ~/vimfiles.
New-Item -ItemType SymbolicLink -Path "$HOME/_vimrc" -Target "$PSScriptRoot\_vimrc" -Force
New-Item -type Junction -Path "$HOME/vimfiles" -Value "$PSScriptRoot\..\home\.vim" -Force
