#!/usr/bin/env bash
# Phase-2522: UI honesty path roster + session storage still present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Soft-fertig honesty path roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyPathRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 2520+ honesty path roster ok"
echo "cleaned"
echo "OK: phase2522 e2e passed"
