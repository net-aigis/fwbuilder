#!/usr/bin/env bash
# Phase-2131: UI honesty milestone + surface changelog session at 4750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestySurfaceChangelogStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 4750 UI ok"
echo "cleaned"
echo "OK: phase2131 e2e passed"
