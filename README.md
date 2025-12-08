
# My personal NeoVim configuration 

This is mostly used as a backup if something breaks, but feel free to take a look around. My OS is Windows 11.

## PowerShell Based Setup

To not having to use AppData all the time, set the `XDG_CONFIG_HOME` variable to some config directory you like. Usually (and on Linux) this is `$HOME\.config`

### PowerShell

Install [PowerShell](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3) and add it to the ```PATH``` variable with ```C:\Program Files\PowerShell\7\```.

### Windows Terminal 

Install [Windwos Terminal](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701)

#### Catppuccin Colorscheme

I am using [Catppuccin](https://github.com/catppuccin/catppuccin) as my colorscheme.

```
{
  "launchMode": "maximized",
}
```

```
{
    ..default layout
    "schemes":
    [
        {
          "name": "Catppuccin Frappe",

          "cursorColor": "#F2D5CF",
          "selectionBackground": "#626880",

          "background": "#303446",
          "foreground": "#C6D0F5",

          "black": "#51576D",
          "red": "#E78284",
          "green": "#A6D189",
          "yellow": "#E5C890",
          "blue": "#8CAAEE",
          "purple": "#F4B8E4",
          "cyan": "#81C8BE",
          "white": "#B5BFE2",

          "brightBlack": "#626880",
          "brightRed": "#E78284",
          "brightGreen": "#A6D189",
          "brightYellow": "#E5C890",
          "brightBlue": "#8CAAEE",
          "brightPurple": "#F4B8E4",
          "brightCyan": "#81C8BE",
          "brightWhite": "#A5ADCE"
        }
    ],
}
```

```
{
    ..default layout
    "themes":
    [
        {
          "name": "Catppuccin Frappe",
          "tab": {
            "background": "#303446FF",
            "showCloseButton": "always",
            "unfocusedBackground": null
          },
          "tabRow": {
            "background": "#292C3CFF",
            "unfocusedBackground": "#232634FF"
          },
          "window": {
            "applicationTheme": "dark"
          }
        }
    ],
}
```

In the Terminal Settings > Open JSON file, add the above snippets. Close Windows Terminal Application while you do that. Then reopen and go to Settings > Color schemes and select the newly installed Catppuccin and set it as default.

### Package Managers 

Install chocolatey [here](https://chocolatey.org/).

Install Scoop [here](https://scoop.sh/)

### Required Software

```
neovim fzf gzip wget make lua luarocks grep fd ripgrep lazygit starship nodejs
```

### PowerShell Profile

The PowerShell Profile location is saved in `$PROFILE`, you can edit it with `nvim $PROFILE`.

```
$ENV:STARSHIP_CONFIG = "C:\Users\AndreasK\OneDrive - MaibornWolff GmbH\Dokumente\PowerShell\starship.toml"
Invoke-Expression (&starship init powershell)

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

$ENV:FZF_DEFAULT_OPTS=@"
--preview "bat -n --color=always --line-range :500 {}"
--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf
--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284
"@
$ENV:FZF_DEFAILT_COMMAND='--preview "bat -n --color=always --line-range :500 {}"'
$ENV:FZF_CTRL_T_OPTS='--preview "bat -n --color=always --line-range :500 {}"'
$ENV:FZF_CTRL_R_OPTS='--preview "bat -n --color=always --line-range :500 {}"'

function Git-CheckoutMaster {
    git checkout master
    git pull
}
Set-Alias gitcm Git-CheckoutMaster
```

### PowerShell fzf

```
Install-Module -Name PSFzf
```

### install treesitter cli 

```
npm install -g tree-sitter-cli
```

### Install bat

```
choco install bat
```
Now download the catppuccin theme for bat
```
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Latte.tmTheme
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Frappe.tmTheme
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Macchiato.tmTheme
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
```
Now you can change the theme to catppuccin by editing the configuration file
```
nvim $(bat --config-file)
```
And add the following line:
```
--theme="Catppuccin Frappe"
```

### Install delta

For nicer git diffs install delta:
``` 
choco install delta
```
Get catppuccin theme for delta
```
cd $HOME\.config\
git clone https://github.com/catppuccin/delta.git delta
```
Use delta for default git diffs:
```
nvim .\.gitconfig
```
Add the following configurations to this (change the Path to absolute):
```
[include]
    path = $HOME/.config/delta/catppuccin.gitconfig
[core]
    pager = delta
[interactive]
    diffFilter = delta --color-only
[delta]
    navigate = true
    side-by-side = true
    features = catppuccin-frappe
[diff]
    colorMoved = default
```

### using my neovim configuration

```
cd .config\
git clone https://github.com/Spanching/init.lua.git nvim
cp ~/.config/nvim/starship.toml ~/.config/starship.toml 
cp ~/.config/nvim/.tmux.conf ~/.tmux.conf 
TMUX_CONF=~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### nerd font

install `jetbrainsmono nerd font` from [here](https://www.nerdfonts.com/) and set is as default font in windows terminal. and while you are there you might want to set ubuntu as default terminal and disable the tabs. 

