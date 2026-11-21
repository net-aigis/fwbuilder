#!/usr/bin/env bash
# Phase-4474: UI honesty bundle includes expect_steps_refusals_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'expect_steps_refusals_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_expect_steps_refusals_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI expect_steps_refusals_roster bundle section ok"
echo "cleaned"
echo "OK: phase4474 e2e passed"
