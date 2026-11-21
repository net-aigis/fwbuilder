#!/usr/bin/env bash
# Phase-3082: UI layout fidelity signal roster + session storage still present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Soft-fertig layout fidelity signal roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'layoutFidelitySignalRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 3080+ layout fidelity signal roster ok"
echo "cleaned"
echo "OK: phase3082 e2e passed"
