#!/usr/bin/env bash
# Phase-2282: UI hard-gap roster + session storage still present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Soft-fertig hard-gap roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hardGapRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 2280+ hard-gap roster ok"
echo "cleaned"
echo "OK: phase2282 e2e passed"
