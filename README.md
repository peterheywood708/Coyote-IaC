### External secrets setup guide

1. helm repo add external-secrets https://charts.external-secrets.io
2. helm install external-secrets external-secrets/external-secrets -n external-secrets --create-namespace
3. kubectl get pods,crd -n external-secrets
