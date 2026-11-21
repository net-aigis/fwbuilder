#!/usr/bin/env bash
# Phase-4314: UI honesty bundle includes expect_run_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'expect_run_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_expect_run_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI expect_run_roster bundle section ok"
echo "cleaned"
echo "OK: phase4314 e2e passed"
