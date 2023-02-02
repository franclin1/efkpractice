#!bin/bash/

# elasticsearch + kibana
# Retrieve elastic user's password.
echo "username:"
echo "elastic"
echo "initial admin password:"
kubectl get secrets --namespace=malteahlers elasticsearch-master-credentials -ojsonpath='{.data.password}' | base64 -d
echo ""
echo ""
# Retrieve the kibana service account token.
echo "kibana service account token:"
kubectl get secrets --namespace=malteahlers kibana-kibana-es-token -ojsonpath='{.data.token}' | base64 -d