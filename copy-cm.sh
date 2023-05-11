#!/bin/bash

destination_cluster="destination_cluster_name"
source_cluster="source_cluster_name"
destination_namespace="destination_ns"
source_namespace="source_ns"

echo $source_cluster
echo $source_namespace


kubectx $source_cluster
echo "swtiched to $source_cluster"
cd /Users/user.name/temp
echo "swtiched to /temp direcktory"
#mkdir -p test
#cd ./test
pwd

configmap_names=$(kubectl get configmaps -n $source_namespace --no-headers | awk ' { print $1 } ')
echo "$configmap_names"

for configmaps in ${configmap_names[@]}; do
echo "Copying configmaps $configmaps from $source_cluster in $source_namespace to local directory"
kubectl get configmap $configmaps -n $source_namespace -o yaml > $configmaps.yml
done

kubectx $destination_cluster

for configmaps in ${configmap_names[@]}; do
echo "Applying configmaps $configmaps from $source_cluster in $source_namespace to $destination_cluster in $destination_namespace"
kubectl apply -n $destination_namespace -f $configmaps.yml
done
