#!/bin/bash
# sync_version.sh — Propagate the canonical VERSION file into README.md visible strings.
# Workflow: ./bump_version.sh patch|minor|major  — or edit VERSION manually, then:
#           ./sync_version.sh && ./mu_load.sh

set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

VERSION_FILE="${SCRIPT_DIR}/VERSION"
[[ -f "$VERSION_FILE" ]] || { echo "sync_version.sh: missing VERSION" >&2; exit 1; }
V=$(tr -d '\n\r ' < "$VERSION_FILE")
[[ -n "$V" ]] || { echo "sync_version.sh: VERSION is empty" >&2; exit 1; }

README="${SCRIPT_DIR}/README.md"
[[ -f "$README" ]] || { echo "sync_version.sh: missing README.md" >&2; exit 1; }

# Quoted for YAML 1.1 (unquoted 2.0.0 can be read as a float).
sed -i '' "s/^version:.*/version: \"$V\"/" "$README"
sed -i '' "s#\\(The Mu Emptiness Framework: MEAT-UNIT Technical Manual \\)v[^[:space:]]*#\\1v$V#" "$README"
sed -i '' "s#\\*\\*v[^*]* Master Evaluation Prompt#**v${V} Master Evaluation Prompt#" "$README"

echo "✅ README.md synced from VERSION ($V)"
