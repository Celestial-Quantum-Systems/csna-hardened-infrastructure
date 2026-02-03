# 🛡️ Security Policy

## Supported Versions
| Version | Supported          | Encryption Standard       |
| ------- | ------------------ | ------------------------- |
| 1.0.x   | :white_check_mark: | CNSA 2.0 (Kyber-1024)     |
| < 1.0   | :x:                | Legacy (RSA-2048)         |

## Reporting a Vulnerability
**Celestial Quantum Systems** treats agentic security with sovereign priority.

If you discover a prompt injection vector or post-quantum vulnerability:
1.  **Do NOT open a public issue.**
2.  Email the Architect directly at: `security@celestial-quantum.com` (or your email).
3.  We utilize **CVSS 4.0** scoring for all agentic threat vectors.

### Scope
* **In Scope:** `agent_guardrail.py`, Post-Quantum lattice implementation.
* **Out of Scope:** Third-party LLM hallucinations (OpenAI/Anthropic).

*Authorized by the Sovereign Architect.*
