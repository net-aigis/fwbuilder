#!/usr/bin/env bash
# Phase-3674: UI honesty bundle includes hard_gaps_summary_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hard_gaps_summary_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_hard_gaps_summary_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI hard_gaps_summary_roster bundle section ok"
echo "cleaned"
echo "OK: phase3674 e2e passed"
