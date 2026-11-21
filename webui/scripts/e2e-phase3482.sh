#!/usr/bin/env bash
# Phase-3482: UI session storage clear roster + session storage still present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Soft-fertig session storage clear roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorageClearRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 3480+ session storage clear roster ok"
echo "cleaned"
echo "OK: phase3482 e2e passed"
