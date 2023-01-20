resource_group_name = "aks-rg"
location = "EastUS"
cluster_name = "aks-cluster"
kubernetes_version = "1.25.2"    #check the k8s version is available or not.
# using this command to check the availbale k8s version --> az aks get-versions --location <location-name>
node_count  = 2
