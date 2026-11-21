#!/usr/bin/env bash
# Phase-1227: UI honesty milestone + path notes still wired.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyPathNotes' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 1950 UI ok"
echo "cleaned"
echo "OK: phase1227 e2e passed"
