#!/usr/bin/env bash
set -euo pipefail

: "${IMAGE:?Falta la variable IMAGE}"
: "${RAILWAY_SERVICE_ID:?Falta RAILWAY_SERVICE_ID}"
: "${RAILWAY_ENVIRONMENT_ID:?Falta RAILWAY_ENVIRONMENT_ID}"
: "${RAILWAY_ACCOUNT_TOKEN:?Falta RAILWAY_ACCOUNT_TOKEN}"

API="https://backboard.railway.com/graphql/v2"

echo "Actualizando source image a: $IMAGE"
curl --fail --silent -X POST "$API" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $RAILWAY_ACCOUNT_TOKEN" \
  -d "$(jq -n \
    --arg serviceId "$RAILWAY_SERVICE_ID" \
    --arg environmentId "$RAILWAY_ENVIRONMENT_ID" \
    --arg image "$IMAGE" \
    '{
      query: "mutation serviceInstanceUpdate($serviceId: String!, $environmentId: String!, $input: ServiceInstanceUpdateInput!) { serviceInstanceUpdate(serviceId: $serviceId, environmentId: $environmentId, input: $input) }",
      variables: { serviceId: $serviceId, environmentId: $environmentId, input: { source: { image: $image } } }
    }')" | tee /tmp/update.json

if grep -q '"errors"' /tmp/update.json; then
  echo "::error::Fallo actualizando el source image en Railway"
  exit 1
fi

echo "Disparando redeploy con la nueva imagen..."
curl --fail --silent -X POST "$API" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $RAILWAY_ACCOUNT_TOKEN" \
  -d "$(jq -n \
    --arg serviceId "$RAILWAY_SERVICE_ID" \
    --arg environmentId "$RAILWAY_ENVIRONMENT_ID" \
    '{
      query: "mutation serviceInstanceDeployV2($serviceId: String!, $environmentId: String!) { serviceInstanceDeployV2(serviceId: $serviceId, environmentId: $environmentId) }",
      variables: { serviceId: $serviceId, environmentId: $environmentId }
    }')" | tee /tmp/deploy.json

if grep -q '"errors"' /tmp/deploy.json; then
  echo "::error::Fallo disparando el deploy en Railway"
  exit 1
fi

echo "Railway ahora corre: $IMAGE"
