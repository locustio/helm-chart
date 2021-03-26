#!/bin/sh

set -eu

rm -f .helm-docs-md5sum-before .helm-docs-md5sum-after

# Get md5sum of all README.md files before running helm-docs
md5sum stable/*/README.md > .helm-docs-md5sum-before

# Run helm-docs to generate all README.md files from the template
helm-docs --chart-search-root ./stable/locust

# Get md5sum of all README.md files after running helm-docs
md5sum stable/*/README.md > .helm-docs-md5sum-after

set +e
echo "Running diff:"
diff .helm-docs-md5sum-before .helm-docs-md5sum-after

if [[ $? -eq 0 ]]; then
  echo "✅ No changes detected"
  exit 0
else
  echo "🔴 These README.md files need to be updated with helm-docs: "
  echo ""
  echo "See main repo README.md for instructions"
  exit 1
fi

exit 1
