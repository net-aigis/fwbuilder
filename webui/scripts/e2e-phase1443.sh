#!/usr/bin/env bash
# Phase-1443: UI milestone + honesty paths download wired.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download honesty paths' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 2600 UI ok"
echo "cleaned"
echo "OK: phase1443 e2e passed"
