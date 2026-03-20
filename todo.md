# MEAT-UNIT v1.7 Release Backlog

## 📦 Epic 1: Repository Architecture & Flow (The Refactor)
*Goal: Reorganize the manual so the physical body is the prerequisite for the theory.*
- [ ] **Story 1.1: Reorder the Compile Path.** Move from Body to Theory: Chapter 6 -> 4 -> 2 -> 1 -> 3 -> 5.
- [ ] **Story 1.2: Define Module Boundaries.** Map the newly ordered chapters into a Git-friendly structure:
  - `core/` (State machine, routing, thermodynamics)
  - `io/` (Kinesthetic compiler, HRV telemetry)
  - `ops/` (Failure semantics, shutdown, grounding)
- [ ] **Story 1.3: Standardize Chapter Formatting.** Every module must include:
  - A 1-page operational sheet ("Do this with your body today").
  - A metrics block (HRV/HR targets).
  - A Paradox Diaries hook ("Log it this way when it happens").

## 🛡️ Epic 2: System Safety & Initialization (The Guardrails)
*Goal: Prevent system overload and derealization for new users.*
- [ ] **Story 2.1: The 0.0 Gatekeeper.** Add "Before You Open the Hood: Somatic Baseline Check." Three tests (HRV feel, 30s Wu Chi, 10s shake). If the 15% Ego argues, lock the manual and mandate 7 days of Daily Shutdowns first.
- [ ] **Story 2.2: Progressive Disclosure.** Add "Reactor Core" warning headers before Chapter 5 (Thermodynamics of Mu). Require 14+ days of stable RMSSD before entry.
- [ ] **Story 2.3: Exit Ramps.** Insert recurring "catch" footers throughout dense text: *"Mind spinning? Return to Bruce: 10x solar-plexus shake -> wait for HRV rise -> resume."*
- [ ] **Story 2.4: Trigeminal Safety Note.** Add a hard warning in Chapter 2: Do not force the sinus up-link if physically congested.

## 🧮 Epic 3: Core Logic & Telemetry Refinements
*Goal: Clarity patches for the math and the Zen.*
- [ ] **Story 3.1: The Dynamic Ego Equation.** Upgrade ε to `ε(t) = N(t) / [C_base + α * RMSSD(t)]`.
- [ ] **Story 3.2: Name the Regimes.** Define the states of the equation: Underfitting (ε ≈ 0, dissociation), Optimal Band, and Overfitting (ε high, rigid control).
- [ ] **Story 3.3: Baseline Telemetry.** Define the exact IO window: 5-minute RMSSD baseline. Target: Cognitive task raises HR by 5-10 BPM while RMSSD stays flat or rises.
- [ ] **Story 3.4: The Zen Mapping.** Map the Category of Mu. "Good Meh" = *zettai mu* (absolute nothingness as open potential). "Bad Meh" = *sōtai mu* (collapsed nihilism).

## 🛠️ Epic 4: Debugging & Isomorphic Ops
*Goal: Practical tooling for when the Meat Unit throws an error.*
- [ ] **Story 4.1: Failure-Mode Appendix.** Map the dominant glitches and 1-2 sentence re-entry protocols:
  - *Bruce-dominant:* Burnout/over-combustion.
  - *Brett-dominant:* Hyper-directed abstraction loop (needs grounding).
  - *Otto-dominant:* Autopilot rigidity (needs pen-to-paper friction).
- [ ] **Story 4.2: Index Canonical Shapes.** Provide a cheat sheet for Isomorphic Mapping. Example: *"If X geometry appears in the left eye node, test resolution via Y movement in the rib cage."*

## 🎬 Epic 5: The CI/CD Pipeline (Paradox Diaries)
*Goal: Turning the video logs into living integration tests.*
- [ ] **Story 5.1: The Thin Vertical Slice (MVP).** Run a strict 7-14 day sprint using only `6.1 Shutdown` + `4.3 Telemetry` + `5.3 Failure Epistemology`. Use the Diaries to log the results.
- [ ] **Story 5.2: Live Telemetry Overlays.** Add HRV overlay graphics to the video edits to visually prove the DC -> Stochastic -> Coherent transitions during the shaking phases.
- [ ] **Story 5.3: Tagging System.** Tag future episodes by the SOP they test (e.g., `[Test: Chapter 3.1]`) to create an auto-generating training set.## 📜 Epic 6: Open Source Governance & Self-Reference
*Goal: Secure the legal framework and establish recursive AI awareness.*
- [ ] **Story 6.1: Select and Apply Repository License.** Determine the appropriate open-source license (e.g., Creative Commons for content, Apache 2.0 or MIT for operational code/prompts) and add the `LICENSE` file.
- [ ] **Story 6.2: Hardcode the Origin Node.** Inject the repository URL (`https://github.com/schuchert/mu-emptiness`) directly into the master prompt document. This ensures any future LLM running the simulation knows exactly where its definition and version control reside.
