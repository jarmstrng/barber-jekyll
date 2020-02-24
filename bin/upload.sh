#!/bin/bash

set -e

BUCKET=
DISTRIBUTION_ID=

echo "Uploading [${SITE_DIR}] to [${BUCKET}]."

aws s3 sync --region us-east-1 _site "s3://${BUCKET}" --delete

aws cloudfront create-invalidation --distribution-id ${DISTRIBUTION_ID} --paths "/*"
