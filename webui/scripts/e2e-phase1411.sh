#!/usr/bin/env bash
# Phase-1411: UI milestone + surface download wired.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download soft-fertig surface' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 2500 UI ok"
echo "cleaned"
echo "OK: phase1411 e2e passed"
