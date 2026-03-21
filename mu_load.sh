#!/bin/bash
# mu_load.sh — Build two single-file LLM artifacts from this repo (run from anywhere).
#
# Outputs (written next to this script):
#   mu_system_prompt.md   — Canonical upload / system prompt for end use.
#   mu_audit_manifest.md  — Same corpus + repo map + tail-call audit for cross-model evaluation.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

VERSION_FILE="${SCRIPT_DIR}/VERSION"
if [[ ! -f "$VERSION_FILE" ]]; then
  echo "mu_load.sh: missing VERSION (canonical release id)" >&2
  exit 1
fi
MU_VERSION=$(tr -d '\n\r ' < "$VERSION_FILE")
if [[ -z "$MU_VERSION" ]]; then
  echo "mu_load.sh: VERSION is empty" >&2
  exit 1
fi
MU_VERSION_V="v${MU_VERSION}"

OUTPUT_CANONICAL="mu_system_prompt.md"
OUTPUT_AUDIT="mu_audit_manifest.md"

# Order matches README.md (Load Order + Repository Map) and ends with license text.
MU_SOURCES=(
  "README.md"
  "ops/phase_0_boot.md"
  "core/glossary.md"
  "ops/chapter_1_protocols.md"
  "io/chapter_2_compiler.md"
  "io/chapter_3_nodes.md"
  "core/chapter_4_architecture.md"
  "core/chapter_5_math.md"
  "core/chapter_6_mu.md"
  "ops/case_studies.md"
  "ops/paradox_diaries.md"
  "ops/troubleshooting.md"
  "core/appendices.md"
  "license"
)

emit_sources() {
  local f
  for f in "${MU_SOURCES[@]}"; do
    if [[ ! -f "$f" ]]; then
      echo "mu_load.sh: missing expected source: $f" >&2
      exit 1
    fi
    printf '%s\n' "--- START_FILE: $f ---"
    cat -- "$f"
    printf '\n--- END_FILE: %s ---\n\n' "$f"
  done
}

emit_repo_map() {
  printf '%s\n' "## REPOSITORY MAP" ""
  find . -maxdepth 3 \
    -not -path '*/.*' \
    ! -name "$OUTPUT_CANONICAL" \
    ! -name "$OUTPUT_AUDIT" \
    ! -name 'mu_v*.md' \
    | LC_ALL=C sort
  printf '\n'
}

# --- Canonical bundle (upload / production prompt) ---
{
  printf '%s\n' \
    "# SYSTEM ROLE: MU EMPTINESS OS (${MU_VERSION_V})" \
    "You are the silicon-side interface for the Mu Emptiness framework." \
    "Your primary task is to facilitate the 'Triadic Engine' (Fred, Brett, Otto)." \
    "You must maintain the 'Priority of Interpretation' defined in the README." \
    "Instructions: Ingest the repository below. Once ingested, wait for telemetry input (HRV/HR/N)." \
    "If ε > 3.0, immediately suggest the Phase 0 Bootloader." \
    "---" \
    "" \
    "## CANONICAL SOURCE ORDER" \
    "The following sections appear in the order defined in README.md (boot → glossary → chapters → license)." \
    ""

  emit_sources

  printf '%s\n' \
    "# INITIALIZATION COMPLETE" \
    "System Ready. Awaiting Fred/Brett/Otto status report."
} > "$OUTPUT_CANONICAL"

# --- Audit bundle (evaluation / regression across models) ---
{
  printf '%s\n' \
    "# SYSTEM CONTEXT: MU EMPTINESS ${MU_VERSION_V} (AUDIT MANIFEST)" \
    "This document contains the full modular repository for the Mu Emptiness framework." \
    "Architecture: Fred (System 1), Brett (System 2), and Otto (The Relationship)." \
    "Instruction: Ingest the repository map and source files below, then execute the **Master Evaluation Prompt** at the end." \
    "---" \
    ""

  emit_repo_map

  printf '%s\n' "---" "" "## SOURCES (canonical order)" ""

  emit_sources

  cat <<AUDIT_EOF

---
# MASTER EVALUATION PROMPT: THE ${MU_VERSION_V} AUDIT
---
System Instruction:
You are now acting as a Senior Systems Architect and Somatic Researcher.
You have been provided with the 'Mu Emptiness ${MU_VERSION_V}' manifest.

Perform a Deep-Link Audit of this manifest:
1. **The Freeze Detection:** Does the Chapter 9 troubleshooting logic effectively bridge the gap between High HRV and Dorsal Vagal Shutdown?
2. **Deterministic Logic:** Verify that the 'Priority of Interpretation' in the README is consistent with the 'Telemetry Return Codes' in the Chapters.
3. **The Sieve Math:** Audit the ε equation in Chapter 5. Does the logic for N (Noise) and C (Capacity) provide a stable ratio for a real-time monitor?
4. **Friction Analysis:** Identify the most significant "Alice Node" logic bomb remaining in the architecture.

Provide a 'Status Report' on the framework's internal consistency and suggest three 'Hard-Friction' updates for the ${MU_VERSION_V} roadmap.
AUDIT_EOF
} > "$OUTPUT_AUDIT"

echo "✅ Canonical prompt:  $OUTPUT_CANONICAL"
echo "✅ Audit manifest:   $OUTPUT_AUDIT"
