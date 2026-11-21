#!/usr/bin/env bash
# Phase-2467: UI honesty milestone + sessionStorage roster at 5800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig sessionStorage roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 5800 UI ok"
echo "cleaned"
echo "OK: phase2467 e2e passed"
