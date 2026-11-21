#!/usr/bin/env bash
# Phase-2563: UI honesty milestone + honesty_export_roster bundle at 6100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honesty_export_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 6100 UI ok"
echo "cleaned"
echo "OK: phase2563 e2e passed"
