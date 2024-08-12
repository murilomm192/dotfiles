oh-my-posh init pwsh --config 'C:\Users\99810903\OneDrive - Anheuser-Busch InBev\Desktop\Projetos\theme.opm.json' | Invoke-Expression

$env:VIRTUAL_ENV_DISABLE_PROMPT=1

#Invoke-Expression (&starship init powershell)

#starship preset tokyo-night -o '$PROFILE'

Invoke-Expression (& { (zoxide init powershell | Out-String) })