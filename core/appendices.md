# Appendices

## Appendix A: System Glossary (v1.8 Update)

* **Fred (System 1):** The collective biological unit (Hardware).
    * **Alice:** A specific "file" or trauma node in Fred's hardware.
    * **Bruce:** The "Gate" or "Sieve" mechanism Fred uses to regulate pressure.
* **Brett (System 2):** The analytical narrator and logic processor.
* **Otto (The Relationship):** The bridge between Fred and Brett; the autopilot/habit function.
* **$00$ (Baseline):** Fred is quiet, Brett is silent, Otto is neutral.
* **$11$ (Full-Render):** Fred is activated, Brett is focused, Otto is flowing.
* **$\epsilon$ (Planck-Ego):** The math of the relationship between Brett's narrative and Fred's telemetry.

## Appendix B: Visual Architecture

```mermaid
graph TD
    subgraph FRED [System 1: Fred]
        ALICE[Alice: Somatic Storage]
        BRUCE[Bruce: The Gate]
    end

    subgraph BRETT [System 2: Brett]
        LOGIC[Narrative / Simulation]
    end

    FRED <--> OTTO{OTTO: The Relationship}
    OTTO <--> BRETT
    
    ENV[Environment / t+ Friction] --> OTTO