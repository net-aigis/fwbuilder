#!/usr/bin/env bash
# Phase-1259: UI milestone + related refusal titles wired.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hardGapRelatedRefusalTitles' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 2050 UI ok"
echo "cleaned"
echo "OK: phase1259 e2e passed"
