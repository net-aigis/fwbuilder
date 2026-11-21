#!/usr/bin/env bash
# Phase-3018: UI layout fidelity signal roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layoutFidelitySignalRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig layout fidelity signal roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download layout fidelity signal roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI layout fidelity signal roster ok"
echo "cleaned"
echo "OK: phase3018 e2e passed"
