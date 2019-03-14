param([string]$master = "master.yml",[string]$roles="roles.yml")
kubectl apply -f $master
kubectl apply -f $roles
