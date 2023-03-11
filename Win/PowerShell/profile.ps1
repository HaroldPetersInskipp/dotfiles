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

Import-Module 'C:\tools\gsudo\v2.0.4\gsudoModule.psd1'

Import-Module -Name Terminal-Icons

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
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# User created functions
function Edit-Profile { notepad++.exe $PROFILE.AllUsersAllHosts }
function Clear-Prompt { clear }
function CD-1 { cd .. }
function CD-2 { cd ..\.. }
function CD-3 { cd ..\..\.. }
function CD-Downloads { cd ~\Downloads }
function Notepad-PlusPlus { notepad++.exe $args }
function Git-Nano { & "C:\Program Files\Git\usr\bin\nano.exe" $args }
function Git-Vim { & "C:\Program Files\Git\usr\bin\vim.exe" $args }
function Git-Awk { & "C:\Program Files\Git\usr\bin\awk.exe" $args }
function Git-GAwk { & "C:\Program Files\Git\usr\bin\gawk.exe" $args }
function Git-Cat { & "C:\Program Files\Git\usr\bin\cat.exe" $args }
function Git-Grep { & "C:\Program Files\Git\usr\bin\grep.exe" $args }
function Git-Head { & "C:\Program Files\Git\usr\bin\head.exe" $args }
function Git-Less { & "C:\Program Files\Git\usr\bin\less.exe" $args }
function Git-Sed { & "C:\Program Files\Git\usr\bin\sed.exe" $args }
function Git-Tail { & "C:\Program Files\Git\usr\bin\tail.exe" $args }
function Full-History { Get-Content (Get-PSReadlineOption).HistorySavePath }
function History-Search { Get-Content (Get-PSReadlineOption).HistorySavePath | wsl egrep $args }
function Run-NodeRed { cd ~ && C:\ProgramData\npmglobal\node-red.ps1 }
function View-NodeRedLogs { notepad++.exe "C:\Users\Bannd\Downloads\Cryo\Node-RED\Logs\Node-RED.log" }
function Docker-NodeRed { docker start -ai DockerNodeRED }
function Start-Amd { ~\Downloads\Cryo\cETH\LaunchAMD.bat }
function Start-RTSP { cd ~\Downloads\rtsp-simple-server && .\rtsp-simple-server.exe }
function Start-Webcam { ffmpeg -f dshow -s 1280x720 -framerate 30 -vcodec h264 -i video="HD Pro Webcam C920" -q:v 3 -f rtsp -rtsp_transport tcp rtsp://myuser:mypass@10.0.0.114:8554/livestream }
function Start-Webcam-Low { ffmpeg -f dshow -s 1024x576 -framerate 30 -vcodec h264 -i video="HD Pro Webcam C920" -q:v 4 -f rtsp -rtsp_transport tcp rtsp://myuser:mypass@10.0.0.114:8554/livestream }
function Start-Webcam-High { ffmpeg -f dshow -s 1280x720 -framerate 30 -vcodec mjpeg -i video="HD Pro Webcam C920" -q:v 2 -f rtsp -rtsp_transport tcp rtsp://myuser:mypass@10.0.0.114:8554/livestream }
function Start-Webcam-Ultra { ffmpeg -f dshow -s 1280x720 -framerate 30 -vcodec mjpeg -i video="HD Pro Webcam C920" -q:v 1 -f rtsp -rtsp_transport tcp rtsp://myuser:mypass@10.0.0.114:8554/livestream }
function Start-Video { cd ~\Downloads\rtsp-simple-server && ffmpeg -re -stream_loop -1 -i video.mp4 -c copy -f rtsp -rtsp_transport tcp rtsp://myuser:mypass@10.0.0.114:8554/livestream }
function Start-VLC-RTSP { start vlc rtsp://user:userpass@10.0.0.114:8554/livestream }
function Start-Pulse-Audio { cd D:\PortablePrograms\Pulseaudio\bin && .\pulseaudio.exe --use-pid-file=false }
function Stable-Diffusion { C:\Users\Bannd\invokeai\invoke.bat }
function ESP-Tool { esptool.py $args }
function Start-Arduino-CLI { C:\Users\Bannd\Downloads\ESP8266_NodeMCU\Arduino_CLI\arduino-cli.exe $args }
function Start-LocalChatGPT { python C:\Users\Bannd\Downloads\Cryo\ChatGPT-at-Home-main\app.py $args }
function Edit-ChatGPT-Log { notepad++.exe C:\Users\Bannd\Downloads\Cryo\ChatGPT.log }
function Start-ChatGPT { C:\Python39\Scripts\chatgpt.exe -l C:\Users\Bannd\Downloads\Cryo\ChatGPT.log $args }
function Start-Cleaner { python C:\Users\Bannd\Downloads\Cryo\Scripts\cleaner_cli_v1.2.py }
function Download-Audio { C:\Python39\Scripts\yt-dlp.exe -f ba -x --audio-format mp3 $args -o 'youtube.com_watch_qm_v=%(id)s(audio).%(ext)s' }
function Start-PeekGPT { cd C:\Users\Bannd\Downloads\Cryo\ChatGPT-Shell && yarn start }
function WinRAR-Extract { winrar X $args }
function Self-Extracting { winrar S"C:\Program Files\WinRAR\WinCon.SFX" $args }
function NPM-Install { npm install $args }
function Open-Admin { sudo $args }
function Runlast-Sudo { gsudo !! }
function Sudo-Status { gsudo status }
function Get-MyIPAddress { Invoke-RestMethod -Uri "https://api.ipify.org" }
function Get-Emojis { C:\Windows\system32\wsl.exe /home/pirate/.local/bin/em -s $args }

# User created aliases
Set-Alias -Name "Python" -Value "C:\Python39\python.exe"
Set-Alias -Name "Py" -Value "C:\Python39\python.exe"
Set-Alias -Name "Admin" -Value Open-Admin
Set-Alias -Name "Pro" -Value Edit-Profile
Set-Alias -Name "C" -Value Clear-Prompt
Set-Alias -Name ".." -Value CD-1
Set-Alias -Name "..." -Value CD-2
Set-Alias -Name "...." -Value CD-3
Set-Alias -Name "Down" -Value CD-Downloads
Set-Alias -Name "Nano" -Value Git-Nano
Set-Alias -Name "Vim" -Value Git-Vim
Set-Alias -Name "Awk" -Value Git-Awk
Set-Alias -Name "GAwk" -Value Git-GAwk
Set-Alias -Name "Cat" -Value Git-Cat
Set-Alias -Name "Grep" -Value Git-Grep
Set-Alias -Name "Head" -Value Git-Head
Set-Alias -Name "Less" -Value Git-Less
Set-Alias -Name "Sed" -Value Git-Sed
Set-Alias -Name "Tail" -Value Git-Tail
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
Set-Alias -Name "Node-Red" -Value Run-NodeRed
Set-Alias -Name "NR" -Value Run-NodeRed
Set-Alias -Name "NRL" -Value View-NodeRedLogs
Set-Alias -Name "Node-Red-Log" -Value View-NodeRedLogs
Set-Alias -Name "Node-Red-Docker" -Value Docker-NodeRed
Set-Alias -Name "Docker-Node-Red" -Value Docker-NodeRed
Set-Alias -Name "DockerNodeRed" -Value Docker-NodeRed
Set-Alias -Name "Pickaxe" -Value Start-Amd
Set-Alias -Name "RTSP" -Value Start-RTSP
Set-Alias -Name "Webcam" -Value Start-Webcam
Set-Alias -Name "Webcam-Low" -Value Start-Webcam-Low
Set-Alias -Name "Webcam-High" -Value Start-Webcam-High
Set-Alias -Name "Webcam-Ultra" -Value Start-Webcam-Ultra
Set-Alias -Name "Load-Video" -Value Start-Video
Set-Alias -Name "Open-Stream" -Value Start-VLC-RTSP
Set-Alias -Name "Pulse-Audio" -Value Start-Pulse-Audio
Set-Alias -Name "PulseAudio" -Value Start-Pulse-Audio
Set-Alias -Name "PA" -Value Start-Pulse-Audio
Set-Alias -Name "AI" -Value Stable-Diffusion
Set-Alias -Name "Esptool" -Value ESP-Tool
Set-Alias -Name "Arduino-CLI" -Value Start-Arduino-CLI
Set-Alias -Name "LChatGPT" -Value Start-LocalChatGPT
Set-Alias -Name "ChatGPT" -Value Start-ChatGPT
Set-Alias -Name "ChatLog" -Value Edit-ChatGPT-Log
Set-Alias -Name "Cleaner" -Value Start-Cleaner
Set-Alias -Name "YTA" -Value Download-Audio
Set-Alias -Name "Peek-GPT" -Value Start-PeekGPT
Set-Alias -Name "Extract" -Value WinRAR-Extract
Set-Alias -Name "Auto-Extract" -Value Self-Extracting
Set-Alias -Name "NPMI" -Value NPM-Install
Set-Alias -Name "Please" -Value Runlast-Sudo
Set-Alias -Name "PLS" -Value Runlast-Sudo
Set-Alias -Name "PLZ" -Value Runlast-Sudo
Set-Alias -Name "Status" -Value Sudo-Status
Set-Alias -Name "IP" -Value Get-MyIPAddress
Set-Alias -Name "EM" -Value Get-Emojis
Set-Alias -Name "Emoji" -Value Get-Emojis