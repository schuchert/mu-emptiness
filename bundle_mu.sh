#!/bin/bash

# bundle_mu.sh
# Purpose: Consolidate Mu Emptiness v2.0-GOLD into a single artifact with a Tail-Call Audit.

OUTPUT="mu_v1.9_complete_manifest.md"

{
  echo "# SYSTEM CONTEXT: MU EMPTINESS v2.0-GOLD"
  echo "This document contains the full modular repository for the Mu Emptiness framework."
  echo "Architecture: Fred (System 1), Brett (System 2), and Otto (The Relationship)."
  echo "Instruction: Ingest the repository map and then scroll to the end for the Audit Prompt."
  echo "---"
  echo ""
  echo "## REPOSITORY MAP"
  # List the structure so the LLM understands the directory logic first
  find . -maxdepth 3 -not -path '*/.*' -not -name "$(basename "$0")" -not -name "$OUTPUT"
  echo ""
  echo "---"
  echo ""

  # Find all markdown files and the LICENSE, excluding hidden git/metadata folders
  # We also exclude the $OUTPUT file to prevent the recursive hang.
  find . -type f \( -name "*.md" -o -name "LICENSE" \) -not -path '*/.*' -not -name "$OUTPUT" | while read -r file; do
    echo "--- START_FILE: $file ---"
    cat "$file"
    echo -e "\n--- END_FILE: $file ---\n"
  done

  # APPEND THE MASTER AUDIT PROMPT AS THE TAIL-CALL
  cat <<EOF

---
# MASTER EVALUATION PROMPT: THE v2.0-GOLD AUDIT
---
System Instruction: 
You are now acting as a Senior Systems Architect and Somatic Researcher. 
You have been provided with the 'Mu Emptiness v2.0-GOLD' manifest. 

Perform a Deep-Link Audit of this manifest:
1. **The Freeze Detection:** Does the Chapter 9 troubleshooting logic effectively bridge the gap between High HRV and Dorsal Vagal Shutdown?
2. **Deterministic Logic:** Verify that the 'Priority of Interpretation' in the README is consistent with the 'Telemetry Return Codes' in the Chapters.
3. **The Sieve Math:** Audit the ε equation in Chapter 5. Does the logic for N (Noise) and C (Capacity) provide a stable ratio for a real-time monitor?
4. **Friction Analysis:** Identify the most significant "Alice Node" logic bomb remaining in the architecture.

Provide a 'Status Report' on the framework's internal consistency and suggest three 'Hard-Friction' updates for the v2.0 roadmap.
EOF

} > "$OUTPUT"

echo "✅ v2.0-GOLD Artifact compiled with Tail-Call Audit: $OUTPUT"
