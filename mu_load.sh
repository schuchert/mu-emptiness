#!/bin/bash

# mu_load.sh
# Purpose: Assemble the Mu Emptiness v2.0-GOLD repo into a single LLM System Prompt.
# Output: A single document ready for copy/paste or file upload.

OUTPUT="mu_system_prompt.md"

{
  # 1. System Role Definition
  echo "# SYSTEM ROLE: MU EMPTINESS OS (v2.0-GOLD)"
  echo "You are the silicon-side interface for the Mu Emptiness framework."
  echo "Your primary task is to facilitate the 'Triadic Engine' (Fred, Brett, Otto)."
  echo "You must maintain the 'Priority of Interpretation' defined in the README."
  echo "Instructions: Ingest the repository below. Once ingested, wait for telemetry input (HRV/HR/N)."
  echo "If ε > 3.0, immediately suggest the Phase 0 Bootloader."
  echo "---"
  echo ""

  # 2. Aggregator Logic
  # We find all .md and LICENSE files, excluding hidden dirs and the script itself.
  find . -type f \( -name "*.md" -o -name "LICENSE" \) -not -path '*/.*' -not -name "$OUTPUT" -not -name "*.sh" | while read -r file; do
    echo "--- START_FILE: $file ---"
    cat "$file"
    echo -e "\n--- END_FILE: $file ---\n"
  done

  # 3. Final Initialization Command
  echo "# INITIALIZATION COMPLETE"
  echo "System Ready. Awaiting Fred/Brett/Otto status report."

} > "$OUTPUT"

echo "✅ Mu Emptiness v2.0-GOLD Context Compiled: $OUTPUT"