#!/usr/bin/env bash
# Phase-4394: UI honesty bundle includes expect_steps_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'expect_steps_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_expect_steps_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI expect_steps_roster bundle section ok"
echo "cleaned"
echo "OK: phase4394 e2e passed"
