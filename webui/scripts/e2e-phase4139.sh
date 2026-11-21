#!/usr/bin/env bash
# Phase-4139: client stack_switch_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_stack_switch_roster?:' webui/frontend/src/api/client.ts
echo "client stack-switch roster type ok"
echo "cleaned"
echo "OK: phase4139 e2e passed"
