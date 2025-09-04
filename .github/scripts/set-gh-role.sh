#!/bin/bash

root_dir=$(echo "$1" | cut -d '/' -f 1)

case "$root_dir" in
  root)
    ROLE_ARN=${ROOT_GH_ROLE}
    ;;
  staging)
    ROLE_ARN=${STAGING_GH_ROLE}
    ;;
  *)
    echo "Unknown account $root_dir"
    exit 1
    ;;
esac

echo "Assuming role $ROLE_ARN for account $root_dir"
echo "role_arn=$ROLE_ARN" >> $GITHUB_OUTPUT