#!/usr/bin/env bash
# Phase-4154: UI honesty bundle includes stack_switch_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'stack_switch_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_stack_switch_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI stack_switch_roster bundle section ok"
echo "cleaned"
echo "OK: phase4154 e2e passed"
