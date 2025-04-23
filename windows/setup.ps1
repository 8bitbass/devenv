[System.IO.Directory]::CreateDirectory("C:\.config")
[System.IO.Directory]::CreateDirectory("C:\.local")
[System.IO.Directory]::CreateDirectory("C:\.local\share")
[System.IO.Directory]::CreateDirectory("C:\.local\state")

winget install microsoft.powershell

winget install --id Microsoft.WindowsTerminal -e

winget install --id Git.Git -e --source winget

function Set-EnvVar {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Name,

        [Parameter(Mandatory = $true)]
        [string]$Value
    )

        [System.Environment]::SetEnvironmentVariable($Name, $Value, "Machine")
        Set-Item env:$Name -Value $Value  # Also update current session
}

Set-EnvVar -Name "XDG_CONFIG_HOME" -Value "C:/.config"
Set-EnvVar -Name "XDG_DATA_HOME" -Value "C:/.local/share"
Set-EnvVar -Name "XDG_STATE_HOME" -Value "C:/.local/state"

# install chocolatey because getting zig through winget is broken for 0.14.0
# winget install --id chocolatey.chocolatey --source winget
# $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 
# choco install zig
# winget uninstall --id chocolatey.chocolatey

winget install -e --id zig.zig

winget install BurntSushi.ripgrep.MSVC

winget install Neovim.Neovim

git clone https://github.com/8bitbass/config.nvim.git "${env:XDG_CONFIG_HOME}\nvim"
