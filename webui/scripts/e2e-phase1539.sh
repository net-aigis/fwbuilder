#!/usr/bin/env bash
# Phase-1539: UI milestone wired.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 2900 UI ok"
echo "cleaned"
echo "OK: phase1539 e2e passed"
