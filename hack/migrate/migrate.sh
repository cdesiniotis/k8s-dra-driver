#!/bin/bash

OLD_NAMESPACE=${OLD_NAMESPACE:?"OLD_NAMESPACE variable must be defined"}
NEW_NAMESPACE=${NEW_NAMESPACE:?"NEW_NAMESPACE variable must be defined"}
SERVICE_ACCOUNT_NAME=${SERVICE_ACCOUNT_NAME:?"SERVICE_ACCOUNT_NAME variable must be defined"}

cat rbac.yaml | \
  sed "s/{oldNamespace}/$OLD_NAMESPACE/g" | \
  sed "s/{newNamespace}/$NEW_NAMESPACE/g" | \
  sed "s/{serviceAccountName}/$SERVICE_ACCOUNT_NAME/g" | \
  kubectl apply --dry-run=client -f -
