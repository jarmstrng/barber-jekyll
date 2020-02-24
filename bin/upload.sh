#!/bin/bash

set -e

BUCKET=work-website-bucket-q6k585jsxn18
DISTRIBUTION_ID=ESPXEIVXE23NG

echo "Uploading [${SITE_DIR}] to [${BUCKET}]."

aws s3 sync --region us-east-1 _site "s3://${BUCKET}" --delete

aws cloudfront create-invalidation --distribution-id ${DISTRIBUTION_ID} --paths "/*"
