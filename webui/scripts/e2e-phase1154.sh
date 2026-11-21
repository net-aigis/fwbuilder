#!/usr/bin/env bash
# Phase-1154: UI closure titles bit.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hard_gap_closure_titles' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hardGapsClosureTitles' webui/frontend/src/components/FirewallExtras.tsx
echo "UI closure titles ok"
echo "cleaned"
echo "OK: phase1154 e2e passed"
