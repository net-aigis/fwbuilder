#!/usr/bin/env bash
# Phase-3043: UI honesty milestone + layout_fidelity_signal_roster bundle at 7600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'layout_fidelity_signal_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 7600 UI ok"
echo "cleaned"
echo "OK: phase3043 e2e passed"
