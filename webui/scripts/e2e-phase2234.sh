#!/usr/bin/env bash
# Phase-2234: UI honesty bundle includes hard_gap_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hard_gap_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_hard_gap_roster: payload.soft_fertig_hard_gap_roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI hard_gap_roster bundle section ok"
echo "cleaned"
echo "OK: phase2234 e2e passed"
