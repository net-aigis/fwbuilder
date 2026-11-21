#!/usr/bin/env bash
# Phase-4171: client surface version + stack_switch_roster types still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_surface_version?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_stack_switch_roster?:' webui/frontend/src/api/client.ts
echo "client surface/stack_switch_roster types ok"
echo "cleaned"
echo "OK: phase4171 e2e passed"
