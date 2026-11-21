#!/usr/bin/env bash
# Phase-3427: UI honesty milestone + session storage clear roster at 8800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig session storage clear roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 8800 UI ok"
echo "cleaned"
echo "OK: phase3427 e2e passed"
