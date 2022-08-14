clear

# PowerShell parameter completion shim for the dotnet CLI
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
    param($commandName, $wordToComplete, $cursorPosition)
        dotnet complete --position $cursorPosition "$wordToComplete" | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}

[ScriptBlock]$Prompt = {
    $lastCommandSuccess = $?
    $realLASTEXITCODE = $global:LASTEXITCODE
    $errorCode = 0
    if ($lastCommandSuccess -eq $false) {
        #native app exit code
        if ($realLASTEXITCODE -ne 0) {
            $errorCode = $realLASTEXITCODE
        }
        else {
            $errorCode = 1
        }
    }
    $startInfo = New-Object System.Diagnostics.ProcessStartInfo
    $startInfo.FileName = "C:\tools\oh-my-posh.exe"
    $cleanPWD = $PWD.ProviderPath.TrimEnd("\")
    $startInfo.Arguments = "-config=""C:\Users\Bannd\.poshthemes\Plague.json"" -error=$errorCode -pwd=""$cleanPWD"""
    $startInfo.Environment["TERM"] = "xterm-256color"
    $startInfo.CreateNoWindow = $true
    $startInfo.StandardOutputEncoding = [System.Text.Encoding]::UTF8
    $startInfo.RedirectStandardOutput = $true
    $startInfo.UseShellExecute = $false
    if ($PWD.Provider.Name -eq 'FileSystem') {
      $startInfo.WorkingDirectory = $PWD.ProviderPath
    }
    $process = New-Object System.Diagnostics.Process
    $process.StartInfo = $startInfo
    $process.Start() | Out-Null
    $standardOut = $process.StandardOutput.ReadToEnd()
    $process.WaitForExit()
    $standardOut
    $global:LASTEXITCODE = $realLASTEXITCODE
    #remove temp variables
    Remove-Variable realLASTEXITCODE -Confirm:$false
    Remove-Variable lastCommandSuccess -Confirm:$false
}

Set-Item -Path Function:prompt -Value $Prompt -Force
Import-Module PSColor

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

Set-PSDebug -Strict
# History options
# Searching for commands with up/down arrow is really handy. The
# option "moves to end" is useful if you want the cursor at the end
# of the line while cycling through history like it does w/o searching,
# without that option, the cursor will remain at the position it was
# when you used up arrow, which can be useful if you forget the exact
# string you started the search on.
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -MaximumHistoryCount 10000
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# User created functions
function Be-Admin { Start-Process -Verb RunAs wt.exe }
function Edit-Profile { notepad++.exe $PROFILE.AllUsersAllHosts }
function Clear-Prompt { clear }
function CD-1 { cd .. }
function CD-2 { cd ..\.. }
function CD-3 { cd ..\..\.. }
function CD-Downloads { cd C:\Users\Bannd\Downloads }
function Notepad-PlusPlus { notepad++.exe $args }
function Full-History { Get-Content (Get-PSReadlineOption).HistorySavePath }
function History-Search { Get-Content (Get-PSReadlineOption).HistorySavePath | wsl egrep $args }
function Run-NodeRed { C:\ProgramData\npmglobal\node-red.ps1 }
function View-NodeRedLogs { notepad++.exe "C:\Users\Bannd\Downloads\Cryo\Node-RED\Logs\Node-RED.log" }
function Docker-NodeRed { docker start -ai DockerNodeRED }
function Start-Amd { C:\Users\Bannd\Downloads\Cryo\cETH\LaunchAMD.bat }

# User created aliases
Set-Alias -Name "Admin" -Value Be-Admin
Set-Alias -Name "Pro" -Value Edit-Profile
Set-Alias -Name "C" -Value Clear-Prompt
Set-Alias -Name ".." -Value CD-1
Set-Alias -Name "..." -Value CD-2
Set-Alias -Name "...." -Value CD-3
Set-Alias -Name "Down" -Value CD-Downloads
Set-Alias -Name "Nano" -Value Notepad-PlusPlus
Set-Alias -Name "Edit" -Value Notepad-PlusPlus
Set-Alias -Name "H" -Value Full-History
Set-Alias -Name "HS" -Value History-Search
Set-Alias -Name "Which" -Value Get-Command
Set-Alias -Name "Rename" -Value Rename-Item
Set-Alias -Name "RN" -Value Rename-Item
Set-Alias -Name "Delete" -Value Remove-Item
Set-Alias -Name "RM" -Value Remove-Item
Set-Alias -Name "Internet" -Value Test-NetConnection
Set-Alias -Name "Info" -Value Get-ComputerInfo
Set-Alias -Name "NR" -Value Run-NodeRed
Set-Alias -Name "NRL" -Value View-NodeRedLogs
Set-Alias -Name "Node-Red-Log" -Value View-NodeRedLogs
Set-Alias -Name "Node-Red-Docker" -Value Docker-NodeRed
Set-Alias -Name "Docker-Node-Red" -Value Docker-NodeRed
Set-Alias -Name "DockerNodeRed" -Value Docker-NodeRed
Set-Alias -Name "Pickaxe" -Value Start-Amd