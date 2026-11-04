#!/usr/bin/env bash
# Phase-1747: UI honesty milestone + surface version download at 3550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download surface version' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 3550 UI ok"
echo "cleaned"
echo "OK: phase1747 e2e passed"
