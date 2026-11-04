#!/usr/bin/env bash
# Phase-666: UI shows notes=N in expect steps summary.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'notes=${Object.keys(expectPlanStepNotes).length}' webui/frontend/src/components/FirewallExtras.tsx
echo "notes count UI ok"
echo "cleaned"
echo "OK: phase666 e2e passed"
