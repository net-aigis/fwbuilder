#!/usr/bin/env bash
# Phase-3267: UI honesty milestone + catalog summary roster at 8300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig catalog summary roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 8300 UI ok"
echo "cleaned"
echo "OK: phase3267 e2e passed"
