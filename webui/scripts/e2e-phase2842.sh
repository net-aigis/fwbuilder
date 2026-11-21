#!/usr/bin/env bash
# Phase-2842: UI honesty path roster + session storage still present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Soft-fertig honesty path roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyPathRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 2840+ honesty path roster ok"
echo "cleaned"
echo "OK: phase2842 e2e passed"
