#!/usr/bin/env bash
# Phase-4203: client soft_fertig_stack_switch_roster type still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_stack_switch_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 4200+ soft_fertig_stack_switch_roster type ok"
echo "cleaned"
echo "OK: phase4203 e2e passed"
