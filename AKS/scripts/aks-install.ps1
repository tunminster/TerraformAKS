./helm/install.ps1 -file ./helm/cluster-role.yml
Write-Host "Please allow 90 seconds to helm pods to become up and running..."
Start-Sleep -Seconds 90
./lego/install.ps1 -issuer ./lego/cluster-issuer.yml
./dashboard/setup.ps1 -master ./dashboard/master.yml -roles ./dashboard/roles.yml