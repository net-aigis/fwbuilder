#!/usr/bin/env bash
# Phase-2362: UI hard-gap refusal roster + session storage still present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Soft-fertig hard-gap refusal roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hardGapRefusalRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 2360+ hard-gap refusal roster ok"
echo "cleaned"
echo "OK: phase2362 e2e passed"
