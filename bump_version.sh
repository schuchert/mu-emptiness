#!/bin/bash
# bump_version.sh — Semantic version bump (MAJOR.MINOR.PATCH), then sync README.
#
# Usage: ./bump_version.sh patch|minor|major [--no-sync]
#   patch — increment PATCH (2.0.0 → 2.0.1)
#   minor — increment MINOR, reset PATCH (2.0.3 → 2.1.0)
#   major — increment MAJOR, reset MINOR and PATCH (2.1.0 → 3.0.0)
#   --no-sync — only write VERSION (skip sync_version.sh)

set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VERSION_FILE="${SCRIPT_DIR}/VERSION"

usage() {
  cat >&2 <<'USAGE'
Usage: ./bump_version.sh patch|minor|major [--no-sync]

  patch     — PATCH +1  (e.g. 2.0.0 → 2.0.1)
  minor     — MINOR +1, PATCH → 0
  major     — MAJOR +1, MINOR and PATCH → 0
  --no-sync — only write VERSION; skip README sync
USAGE
  exit 1
}

[[ -f "$VERSION_FILE" ]] || { echo "bump_version.sh: missing VERSION" >&2; exit 1; }

KIND=""
NO_SYNC=0
for arg in "$@"; do
  case "$arg" in
    --no-sync) NO_SYNC=1 ;;
    patch|minor|major) KIND="$arg" ;;
    -h|--help) usage ;;
    *) echo "bump_version.sh: unknown argument: $arg" >&2; usage ;;
  esac
done
[[ -n "$KIND" ]] || usage

CUR=$(tr -d '\n\r ' < "$VERSION_FILE")
if [[ ! "$CUR" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "bump_version.sh: VERSION must be MAJOR.MINOR.PATCH (got: $CUR)" >&2
  exit 1
fi

IFS=. read -r MAJ MIN PAT <<< "$CUR"
case "$KIND" in
  major) MAJ=$((MAJ + 1)); MIN=0; PAT=0 ;;
  minor) MIN=$((MIN + 1)); PAT=0 ;;
  patch) PAT=$((PAT + 1)) ;;
esac

NEW="${MAJ}.${MIN}.${PAT}"
printf '%s\n' "$NEW" > "$VERSION_FILE"
echo "✅ VERSION → $NEW ($KIND)"

if [[ "$NO_SYNC" -eq 0 ]]; then
  "${SCRIPT_DIR}/sync_version.sh"
fi
