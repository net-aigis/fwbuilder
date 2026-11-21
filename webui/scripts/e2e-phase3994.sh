#!/usr/bin/env bash
# Phase-3994: UI honesty bundle includes hard_gaps_field_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hard_gaps_field_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_hard_gaps_field_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI hard_gaps_field_roster bundle section ok"
echo "cleaned"
echo "OK: phase3994 e2e passed"
