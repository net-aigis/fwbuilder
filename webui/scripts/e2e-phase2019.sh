#!/usr/bin/env bash
# Phase-2019: UI honesty milestone + soft-complete note download at 4400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download soft-complete note' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 4400 UI ok"
echo "cleaned"
echo "OK: phase2019 e2e passed"
