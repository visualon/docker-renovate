#!/bin/bash
set -eo pipefail

FROM=$(grep 'FROM renovate/renovate:' Dockerfile)
SEMVER_REGEX=":(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)-"


if ! [[ "$FROM" =~ $SEMVER_REGEX ]]; then
  echo Not a semver tag - skipping
  exit
fi

major=${BASH_REMATCH[1]}
minor=${BASH_REMATCH[2]}
patch=${BASH_REMATCH[3]}


VERSION="${major}.${minor}.${patch}"
echo "VERSION=${VERSION}" >> "$GITHUB_ENV"
echo "Found version: ${VERSION}"
