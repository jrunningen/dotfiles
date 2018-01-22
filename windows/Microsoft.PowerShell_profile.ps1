Import-Module PSReadLine

Set-PSReadLineOption -EditMode Vi

Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadlineKeyHandler -Key Shift+Ctrl+C -Function Copy
Set-PSReadlineKeyHandler -Key Ctrl+V -Function Paste
Set-PSReadlineKeyHandler -Key Alt+D -Function ShellKillWord
Set-PSReadlineKeyHandler -Key Alt+B -Function ShellBackwardWord
Set-PSReadlineKeyHandler -Key Alt+F -Function ShellForwardWord
Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-PSReadlineKeyHandler -Key Ctrl+r -Function ReverseSearchHistory
Set-PSReadlineKeyHandler -Key Ctrl+w -Function UnixWordRubout
Set-PSReadlineKeyHandler -Key Ctrl+[ -Function ViCommandMode

Set-Alias vi vim

# The following function is respectfully borrowed from 
# https://github.com/lzybkr/PSReadLine/blob/master/PSReadLine/SamplePSReadLineProfile.ps1

# Ctrl+Shift+j then type a key to mark the current directory.
# Ctrj+j then the same key will change back to that directory without
# needing to type cd and won't change the command line.

$global:PSReadlineMarks = @{}

Set-PSReadlineKeyHandler -Key Ctrl+Shift+j `
                         -BriefDescription MarkDirectory `
                         -LongDescription "Mark the current directory" `
                         -ScriptBlock {
    param($key, $arg)

    $key = [Console]::ReadKey($true)
    $global:PSReadlineMarks[$key.KeyChar] = $pwd
}

Set-PSReadlineKeyHandler -Key Ctrl+j `
                         -BriefDescription JumpDirectory `
                         -LongDescription "Goto the marked directory" `
                         -ScriptBlock {
    param($key, $arg)

    $key = [Console]::ReadKey()
    $dir = $global:PSReadlineMarks[$key.KeyChar]
    if ($dir)
    {
        cd $dir
        [Microsoft.PowerShell.PSConsoleReadLine]::InvokePrompt()
    }
}

Set-PSReadlineKeyHandler -Key Alt+j `
                         -BriefDescription ShowDirectoryMarks `
                         -LongDescription "Show the currently marked directories" `
                         -ScriptBlock {
    param($key, $arg)

    $global:PSReadlineMarks.GetEnumerator() | % {
        [PSCustomObject]@{Key = $_.Key; Dir = $_.Value} } |
        Format-Table -AutoSize | Out-Host

    [Microsoft.PowerShell.PSConsoleReadLine]::InvokePrompt()
}
