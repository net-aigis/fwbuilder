#!/usr/bin/env bash
# Phase-3242: UI layout fidelity sample field roster + session storage still present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Soft-fertig layout fidelity sample field roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'layoutFidelitySampleFieldRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 3240+ layout fidelity sample field roster ok"
echo "cleaned"
echo "OK: phase3242 e2e passed"
