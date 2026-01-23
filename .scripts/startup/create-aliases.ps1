function Set-AliasWithCheck {
    param(
        [string]$aliasName,
        [string]$functionName
    )

    $oldAlias = Get-Item alias:\$aliasName -ErrorAction SilentlyContinue
    if ($oldAlias) {
        Remove-Item -Force -Path alias:\$oldAlias
    }
    Set-Alias -Name $aliasName -Value $functionName -Scope Global
}

function global:Git-Pull { git pull }
Set-AliasWithCheck -aliasName gp -functionName Git-Pull

function global:Git-Status { git status }
Set-AliasWithCheck -aliasName gs -functionName Git-Status

function global:Git-CheckoutMain { git checkout main }
Set-AliasWithCheck -aliasName gm -functionName Git-CheckoutMain

function global:Git-MainPull { git checkout main; git pull; }
Set-AliasWithCheck -aliasName gmp -functionName Git-MainPull

function global:Git-AddAll { git add . }
Set-AliasWithCheck -aliasName ga -functionName Git-AddAll

# source: https://steven-giesel.com/blogPost/bbfb8333-e05a-4de7-88b9-17ac2248d77f 
function global:Git-SwitchBack { git switch - }
Set-AliasWithCheck -aliasName gg -functionName Git-SwitchBack

function global:Git-CleanupDeadBranches { git branch --merged | grep -v \* | xargs git branch -D }
Set-AliasWithCheck -aliasName gdead -functionName Git-CleanupDeadBranches

function global:Git-CreateBranch {
    param(
        [string]$branchName
    )

    git checkout -b $branchName
}
Set-AliasWithCheck -aliasName gnew -functionName Git-CreateBranch

function global:Git-Checkout {
    param(
        [string]$branchName
    )

    git checkout $branchName
}
Set-AliasWithCheck -aliasName gc -functionName Git-Checkout

function global:Git-Branch {
    git branch
}
Set-AliasWithCheck -aliasName gb -functionName Git-Branch

function global:Git-BranchRemote { 
    git branch -r
}
Set-AliasWithCheck -aliasName gbr -functionName Git-BranchRemote

function global:Git-LogLastTen { 
    git log -n 10 --oneline
}
Set-AliasWithCheck -aliasName g10 -functionName Git-LogLastTen

function global:Todoist-QuickCreate { 
    param(
        [string]$taskName
    )

    # read API key from file todoist-api in the user profile folder
    $apiKey = Get-Content "$env:USERPROFILE\.todoist-api" -Raw

    $url = "https://api.todoist.com/rest/v2/tasks"

    $content = @{
        content = $taskName
    } | ConvertTo-Json

    curl $url -X POST -H "Authorization: Bearer $apiKey" -H "Content-Type: application/json" --data $content -H "X-Request-Id: $(New-Guid)" 
}
Set-AliasWithCheck -aliasName todo -functionName Todoist-QuickCreate
