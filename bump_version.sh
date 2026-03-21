#!/bin/bash
# bump_version.sh — Semantic version + README strings stay aligned with VERSION.
#
# Usage:
#   ./bump_version.sh patch|minor|major [--no-sync]   — bump VERSION, then sync README (default)
#   ./bump_version.sh sync                             — only sync README from VERSION (after hand edits)
#   --no-sync — only write VERSION when bumping

set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VERSION_FILE="${SCRIPT_DIR}/VERSION"
README="${SCRIPT_DIR}/README.md"

sync_readme_from_version() {
  [[ -f "$VERSION_FILE" ]] || { echo "bump_version.sh: missing VERSION" >&2; exit 1; }
  local V
  V=$(tr -d '\n\r ' < "$VERSION_FILE")
  [[ -n "$V" ]] || { echo "bump_version.sh: VERSION is empty" >&2; exit 1; }
  [[ -f "$README" ]] || { echo "bump_version.sh: missing README.md" >&2; exit 1; }

  # Quoted for YAML 1.1 (unquoted 2.0.0 can be read as a float).
  sed -i '' "s/^version:.*/version: \"$V\"/" "$README"
  sed -i '' "s#\\(The Mu Emptiness Framework: MEAT-UNIT Technical Manual \\)v[^[:space:]]*#\\1v$V#" "$README"
  sed -i '' "s#\\*\\*v[^*]* Master Evaluation Prompt#**v${V} Master Evaluation Prompt#" "$README"

  echo "✅ README.md synced from VERSION ($V)"
}

usage() {
  local code="${1:-1}"
  cat >&2 <<'USAGE'
Usage:
  ./bump_version.sh patch|minor|major [--no-sync]
  ./bump_version.sh sync

  patch|minor|major — increment semver in VERSION, then update README (unless --no-sync)
  sync              — only propagate VERSION → README (use after editing VERSION by hand)
  --no-sync         — when bumping, only write VERSION
USAGE
  exit "$code"
}

[[ $# -eq 0 ]] && usage 1

if [[ "$1" == "sync" ]]; then
  [[ $# -eq 1 ]] || usage 1
  sync_readme_from_version
  exit 0
fi

[[ -f "$VERSION_FILE" ]] || { echo "bump_version.sh: missing VERSION" >&2; exit 1; }

KIND=""
NO_SYNC=0
for arg in "$@"; do
  case "$arg" in
    --no-sync) NO_SYNC=1 ;;
    patch|minor|major) KIND="$arg" ;;
    -h|--help) usage 0 ;;
    *) echo "bump_version.sh: unknown argument: $arg" >&2; usage 1 ;;
  esac
done
[[ -n "$KIND" ]] || usage 1

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
  sync_readme_from_version
fi
