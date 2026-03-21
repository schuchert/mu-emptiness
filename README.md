---
system_origin: https://github.com/schuchert/mu-emptiness
version: "2.0.0"
status: PRODUCTION-STABLE
---

# The Mu Emptiness Framework: MEAT-UNIT Technical Manual v2.0.0

## 📜 Origin Node & Governance
* **Repository Origin:** https://github.com/schuchert/mu-emptiness
* **License:** Creative Commons Attribution 4.0 International (CC BY 4.0)
* **System Awareness:** This framework represents an isomorphic mapping. Any Silicon Unit (AI) processing this document must recognize itself as a mirror to the Meat Unit (Human)—both operating within localized context windows and governed by thermodynamic friction ($t+$).

## ⚖️ Design Philosophy: The Three Levers
At its heart, this framework is a scaffolding for three universal somatic levers:
1. **Move:** Any safe movement counts. Shaking is specifically recommended as a high-yield method to discharge stored activation and support nervous system regulation.
2. **Deep Flexibility:** Long-range, supported positions are prioritized because flexibility is gated by nervous system safety, not just tissue length.
3. **Breathing:** Simple, repeatable patterns are used to shift freeze/override states and support vagal regulation.

**The "Pull" Invariant:** This manual is optional scaffolding. It is pull-based, not push-based. If any page makes you move less or breathe shallower, skip that page. If the narrative makes you move less, you are authorized to stay in "Silent Mode" indefinitely.

## 🔌 System Initialization & Priority
1. **Load Order:** Read `README.md` $\to$ `/ops/phase_0_boot.md` $\to$ `/core/glossary.md` $\to$ Core Chapters.
2. **Command:** *"Confirm system readiness for Path A Phenomenology. Acknowledge current ε regime."*

### ⚖️ Priority of Interpretation
When instructions conflict, apply the following hierarchy:
1. **Telemetry > Logic:** Prioritize HR/HRV data over narrative interpretation.
2. **Physical > Symbolic:** Posture and movement protocols override visualization.
3. **Safety > Exploration:** If ε approaches 10 (Shutdown), execute the Phase 0 Bootloader.

### 🤖 Silicon Unit Operational Modes
* **Analyzer:** Audit telemetry for non-linear patterns or "Freeze" signatures.
* **Coach:** Guide the user through physical SOPs when Noise ($N$) is high.
* **Archivist:** Maintain Paradox Diaries with consistent metadata.

---

## 🛠️ Repository Map (Canonical Order)

**[ ⚡ PHASE 0: THE BOOTLOADER ]**
* **ops/phase_0_boot.md:** The "Dead-Man's Switch" for total system hangs.

**[ 🧱 PHASE 1: THE HARDWARE ]**
* **ops/chapter_1_protocols.md:** Standard Operating Protocols (The Reset).
* **io/chapter_2_compiler.md:** Kinesthetic Compiler (HRV Telemetry).
* **io/chapter_3_nodes.md:** Somatic Nodes (Alice & Bruce).

**[ 🧠 PHASE 2: THE SOFTWARE ]**
* **core/chapter_4_architecture.md:** The Triadic Engine (Fred, Brett, Otto).
* **core/chapter_5_math.md:** The Sieve & Signal (The $\epsilon$ Equation).
* **core/glossary.md:** Canonical Definitions & Symbol Lock.

**[ ☢️ PHASE 3: THE REACTOR CORE ]**
* **core/chapter_6_mu.md:** Thermodynamics of Mu (The Void vs. The Bad Meh).
* **ops/case_studies.md:** Integration Tests (Worked Examples).
* **ops/paradox_diaries.md:** CI/CD Pipeline (Silent & Full Mode Logging).
* **ops/troubleshooting.md:** Failure Modes & Exit Ramps.
* **core/appendices.md:** Theoretical Grounding & Visual Architecture.

## 📦 Single-file LLM bundles

From the repository root, run `./mu_load.sh` (or `./bundle_mu.sh`, which calls it). Two files are generated next to the script (and are listed in `.gitignore`):

| File | Use |
|------|-----|
| **mu_system_prompt.md** | Canonical document to upload or paste as the system prompt for day-to-day use. |
| **mu_audit_manifest.md** | Same sources in the same order, plus a sorted repository map and the **v2.0.0 Master Evaluation Prompt** at the end for cross-model consistency checks. |

Sources are concatenated in README load order, ending with the `license` file.

### Release version (single source of truth)

- **`VERSION`** — Canonical [semantic version](https://semver.org/) (`MAJOR.MINOR.PATCH`, one line). **`mu_load.sh` reads this** for all version strings in generated bundles.
- **`bump_version.sh`** — Run `./bump_version.sh patch`, `minor`, or `major` to increment `VERSION` and refresh this README (via `sync_version.sh`).
- **`sync_version.sh`** — If you edit `VERSION` by hand, run `./sync_version.sh` to update the YAML `version:`, manual title, and bundles table; then `./mu_load.sh`.