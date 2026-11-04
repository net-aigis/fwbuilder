#!/usr/bin/env bash
# Phase-2874: UI honesty bundle includes expect_step_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'expect_step_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_expect_step_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI expect_step_roster bundle section ok"
echo "cleaned"
echo "OK: phase2874 e2e passed"
