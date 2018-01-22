# Overwrite the current PowerShell profile, and hardlink that path to the
# profile in this repo.
Remove-Item $profile
New-Item -ItemType HardLink -Path $profile -Target "$PSScriptRoot\Microsoft.PowerShell_profile.ps1"
