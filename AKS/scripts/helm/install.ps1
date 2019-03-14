param([string]$file = "cluster-role.yml")

choco install kubernetes-helm
kubectl create serviceaccount -n kube-system tiller
kubectl apply -f $file
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
helm init --service-account tiller