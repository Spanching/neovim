Set-Alias python3 python

function Measure-Profile {
  $p = 0
  1..100 | ForEach-Object {
      Write-Progress -Id 1 -Activity 'pwsh' -PercentComplete $_
      $p += (Measure-Command {
          pwsh -noprofile -command 1
      }).TotalMilliseconds 
  }
  Write-Progress -id 1 -Activity 'profile' -Completed
  $p = $p/100
  $p
  $a = 0
  1..100 | ForEach-Object {
      Write-Progress -Id 1 -Activity 'profile' -PercentComplete $_
      $a += (Measure-Command {
          pwsh -command 1
      }).TotalMilliseconds
  }
  Write-Progress -id 1 -activity 'profile' -Completed
  $a/100 - $p
}
Set-Alias pfmeasure Measure-Profile

$ENV:STARSHIP_CONFIG = "C:\Users\AndreasK\OneDrive - MaibornWolff GmbH\Dokumente\PowerShell\starship.toml"
$ENV:FZF_DEFAULT_OPTS=@"
--preview "bat -n --color=always --line-range :500 {}"
--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf
--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284
"@
$ENV:FZF_DEFAILT_COMMAND='--preview "bat -n --color=always --line-range :500 {}"'
$ENV:FZF_CTRL_T_OPTS='--preview "bat -n --color=always --line-range :500 {}"'
$ENV:FZF_CTRL_R_OPTS='--preview "bat -n --color=always --line-range :500 {}"'

Invoke-Expression (&starship init powershell)

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

function Gradle-Test {
    .\gradlew test
}
Set-Alias gt Gradle-Test

function Gradle-FeatureTest {
    .\gradlew featureTest
}
Set-Alias gft Gradle-FeatureTest

function Gradle-Assemble {
    .\gradlew assemble
}
Set-Alias ga Gradle-Assemble

function Gradle-CleanBuild {
    .\gradlew clean build
}
Set-Alias gcb Gradle-CleanBuild

function PublishToLocalMaven {
    git tag -d andi
    git add .
    git commit -m "Update"
    git tag andi
}
Set-Alias preparePublish PublishToLocalMaven

function Gradle-DeployLocal {
    .\gradlew deployLocal
}
Set-Alias gdl Gradle-DeployLocal

function Gradle {
    param (
        [Parameter(Mandatory=$false, ValueFromRemainingArguments=$true)]
        [string[]]$args
    )
    .\gradlew @args
}
Set-Alias g Gradle

function Git-Pull {
    git pull
}
Set-Alias gitp Git-Pull

function Git-Delete-Local {
    git for-each-ref --format='%(refname:short)' refs/heads |
        Where-Object { $_ -notmatch '^(main|master)$' } |
        ForEach-Object { git branch -D $_ }
}
Set-Alias gitdeletelocal Git-Delete-Local

function Git-CheckoutMain {
    git checkout main
    git pull
}
Set-Alias gitcmain Git-CheckoutMain

function Git-CheckoutMaster {
    git checkout master
    git pull
}
Set-Alias gitcm Git-CheckoutMaster

function Git-SwitchRemoteBranch {
    # Make sure we have an up-to-date list of branches
    git fetch

    # Get the branch name using fzf. We list both local (heads) and remote (remotes) branches.
    $branch = git for-each-ref --format="%(refname:short)" refs/heads refs/remotes | fzf --height=40% --reverse --info=inline --preview='echo {}'

    if (-not $branch) {
        Write-Host "No branch selected."
        return
    }

    $branch = $branch.Trim()

    # Strip 'origin/' if present
    if ($branch -like 'origin/*') {
        $branch = $branch -replace '^origin/', ''
    }

    # Attempt to check out the branch
    $local_ref = git show-ref --verify refs/heads/$branch | out-null
    if (!($local_ref -like 'fatal: * - not a valid ref')) {
        git switch $branch
        return
    } 
    $remote_ref = git show-ref --verify refs/remotes/origin/$branch | out-null
    if (!($remote_ref -like 'fatal: * - not a valid ref')) {
        git switch $branch
        return
    } else {
      Write-Host "Could not find local or remote branch ref"
      return
    }

    git pull
}
Set-Alias gitcb Git-SwitchRemoteBranch

function Go-Notes {
    Set-Location -Path "C:\Users\AndreasK\Notes"
}
Set-Alias notes Go-Notes

$ENV:K9S_EDITOR='nvim'
$ENV:EDITOR='nvim'

# # Import the Chocolatey Profile that contains the necessary code to enable
# # tab-completions to function for `choco`.
# # Be aware that if you are missing these lines from your profile, tab completion
# # for `choco` will not function.
# # See https://ch0.co/tab-completion for details.
# # $ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
# # if (Test-Path($ChocolateyProfile)) {
# #   Import-Module "$ChocolateyProfile"
# # }

Invoke-Expression (Get-Content "C:\Users\AndreasK\Miele\helper\tools\miele.ps1" -Raw)
Invoke-Expression (Get-Content "C:\Users\AndreasK\Miele\helper\tools\mcs_completion.ps1" -Raw)
Set-Alias mcs "C:\Users\AndreasK\Miele\helper\tools\mcs.exe"
