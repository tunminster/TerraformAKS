param([string]$issuer = "cluster-issuer.yml",[string]$version="v0.6.0")

kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.6/deploy/manifests/00-crds.yaml

# Update helm repository cache
helm repo update

# Install cert-manager
helm install --name cert-manager --namespace cert-manager --version $version stable/cert-manager

# Create the cluster issuer. 
# More information about Issuer vs. ClusterIssuer: https://cert-manager.readthedocs.io/en/latest/getting-started/3-configuring-first-issuer.html
kubectl apply -n cert-manager -f $issuer