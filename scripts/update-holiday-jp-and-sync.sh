#!/bin/bash
set -e

cd "$(dirname "$0")/../holiday_jp"

git fetch --tags
latest_tag=$(git for-each-ref --sort=-creatordate --format '%(refname:short)' refs/tags | head -n 1)

echo "Latest release tag: $latest_tag"

git checkout "$latest_tag"

cd ..

git add holiday_jp
git commit -m "Update holiday_jp submodule to latest release ($latest_tag)" || echo "No changes to commit"

./scripts/sync-holidays-yaml.sh

git add Sources/HolidayJp/holidays_detailed.yml
git commit -m "Update holidays_detailed.yml after syncing with holiday_jp" || echo "No changes to commit" 