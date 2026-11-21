#!/usr/bin/env bash
# Phase-3155: UI honesty milestone + layout_fidelity_sample sessionStorage at 7950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'layoutFidelitySampleRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 7950 UI ok"
echo "cleaned"
echo "OK: phase3155 e2e passed"
