#!/usr/bin/env bash
# Phase-3562: UI honesty operator brief roster + session storage still present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Soft-fertig honesty operator brief roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyOperatorBriefRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 3560+ honesty operator brief roster ok"
echo "cleaned"
echo "OK: phase3562 e2e passed"
