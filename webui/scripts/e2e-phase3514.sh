#!/usr/bin/env bash
# Phase-3514: UI honesty bundle includes honesty_operator_brief_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honesty_operator_brief_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_honesty_operator_brief_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI honesty_operator_brief_roster bundle section ok"
echo "cleaned"
echo "OK: phase3514 e2e passed"
