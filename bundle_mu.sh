#!/bin/bash

# bundle_mu.sh
# Purpose: Consolidate the Mu Emptiness v1.8 repo into a single artifact for LLM review.

OUTPUT="mu_v1.8_complete_manifest.md"

{
  echo "# SYSTEM CONTEXT: MU EMPTINESS V1.8"
  echo "This document contains the full modular repository for the Mu Emptiness framework."
  echo "Architecture: Fred (System 1), Brett (System 2), and Otto (The Relationship)."
  echo "Instruction: Analyze the somatic-to-telemetry mapping and the thermodynamic logic."
  echo "---"
  echo ""
  echo "## REPOSITORY MAP"
  # List the structure so the LLM understands the directory logic first
  find . -maxdepth 3 -not -path '*/.*' -not -name "$(basename "$0")" -not -name "$OUTPUT"
  echo ""
  echo "---"
  echo ""

  # Find all markdown files and the LICENSE, excluding hidden git/metadata folders
  find . -type f \( -name "*.md" -o -name "LICENSE" \) -not -path '*/.*' | while read -r file; do
    echo "--- START_FILE: $file ---"
    cat "$file"
    echo -e "\n--- END_FILE: $file ---\n"
  done

} > "$OUTPUT"

echo "✅ Artifact compiled: $OUTPUT"