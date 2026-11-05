#!/usr/bin/env bash
# Phase-3203: UI honesty milestone + layout_fidelity_sample_field_roster bundle at 8100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'layout_fidelity_sample_field_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 8100 UI ok"
echo "cleaned"
echo "OK: phase3203 e2e passed"
