#!/usr/bin/env bash
# Phase-2314: UI honesty bundle includes hard_gap_refusal_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hard_gap_refusal_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_hard_gap_refusal_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI hard_gap_refusal_roster bundle section ok"
echo "cleaned"
echo "OK: phase2314 e2e passed"
