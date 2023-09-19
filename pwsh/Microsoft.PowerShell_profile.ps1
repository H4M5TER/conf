# Measure-Command {

# oh-my-posh init pwsh --config $env:LocalAppData/Programs/oh-my-posh/themes/ys.omp.json | Invoke-Expression

# Import-Module -Name Terminal-Icons
# Import-Module -Name posh-git

Import-Module -Name PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

# Import-Module (Get-Command 'gsudoModule.psd1').Source
$ChocolateyProfile = "$env:ChocolateyInstall/helpers/chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

Invoke-Expression (starship init powershell)
Invoke-Expression ((& 'D:/CLI/opts/lua-5.4.2_Win64_bin/lua54.exe' 'D:/CLI/opts/z.lua-1.8.16/z.lua' --init powershell) -join "`n")
$env:_ZL_MATCH_MODE = 1
$env:_ZL_ADD_ONCE = 1
$env:_ZL_ECHO = 1

$env:KOMOREBI_CONFIG_HOME = 'D:/conf/komorebi'
$env:STARSHIP_CONFIG = 'D:/conf/starship/starship.toml'

Set-Alias -Name which -Value Get-Command
Set-Alias -Name grep -Value findstr

function proxy {
  $env:HTTP_PROXY = 'http://127.0.0.1:7890'
  $env:HTTPS_PROXY = 'http://127.0.0.1:7890'
  $env:ALL_PROXY = 'http://127.0.0.1:7890'
}

function noproxy {
  $env:HTTP_PROXY = ''
  $env:HTTPS_PROXY = ''
  $env:ALL_PROXY = ''
}

function set-conda {
  & 'C:/ProgramData/Miniconda3/shell/condabin/conda-hook.ps1'
  conda activate base
}

function fd {
  Get-ChildItem -Recurse -Filter *$args* -Path $pwd
}

function cnpm {
  npm --registry https://registry.npmmirror.com/ @args
}
function cyarn {
  yarn --registry https://registry.npmmirror.com/ @args
}
function cpnpm {
  pnpm --registry https://registry.npmmirror.com/ @args
}

function bili {
  Set-Location F:/Downloads/Bilibili
  gcookie -p "C:/Users/zhuxx/AppData/Local/Vivaldi/User Data/Default" bilibili.com > F:/Cookies/bilibili.txt
  lux -c F:/Cookies/bilibili.txt @args
}
function ydl {
  Set-Location F:/Downloads/Youtube
  & "D:/CLI/opts/yt-dlp_win/yt-dlp.exe" --proxy 'socks5://127.0.0.1:7890' --concurrent-fragments 16 --write-subs @args
}

function scrcpy {
  & "D:/CLI/opts/scrcpy-win64-v2.0/scrcpy.exe" @args
}

function sing-box {
  Set-Location D:/Data/sing-box
  & "D:/Go/bin/sing-box.exe" @args
}

function l {
  lsd --blocks name,date,size --sort time --size short --group-dirs first --date "+%Y-%m-%d %H:%M:%S" @args
}

function tree {
  lsd --blocks name,date,size --sort time --size short --group-dirs first --date "+%Y-%m-%d %H:%M:%S" --tree
}

function archive {
  Set-Location "D:/ArchiveBox"
  docker-compose run --rm archivebox @args
}

function kpa {
  Write-Output ($args | ForEach-Object { 'koishi-plugin-' + $_ })
}

# $FFPATH = "D:/CLI/opts/ffmpeg-n6.0-7-gadb4688bfb-win64-gpl-shared-6.0/bin"

# function ffmpeg {
#   & "$FFPATH/ffmpeg.exe" @args
# }
# function ffplay {
#   & "$FFPATH/ffplay.exe" @args
# }
# function ffprobe {
#   & "$FFPATH/ffprobe.exe" @args
# }

# }