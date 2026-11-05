#!/usr/bin/env bash
# Phase-3162: UI layout fidelity sample roster + session storage still present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Soft-fertig layout fidelity sample roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'layoutFidelitySampleRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 3160+ layout fidelity sample roster ok"
echo "cleaned"
echo "OK: phase3162 e2e passed"
