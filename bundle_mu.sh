#!/bin/bash
# bundle_mu.sh — Back-compat wrapper; builds both LLM artifacts via mu_load.sh.
#
# Prefer running: ./mu_load.sh
# Legacy output name (mu_v1.9_complete_manifest.md) is no longer written here;
# use mu_audit_manifest.md for the audit + tail-call bundle.

set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
exec "$SCRIPT_DIR/mu_load.sh"
