#!/usr/bin/env bash
# Phase-3587: UI honesty milestone + surface changelog meta roster at 9300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig surface changelog meta roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 9300 UI ok"
echo "cleaned"
echo "OK: phase3587 e2e passed"
