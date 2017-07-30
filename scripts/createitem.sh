#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/items"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "item": {
      "name": "sofa",
      "description": "comfy old sofa"
    }
  }'

echo
