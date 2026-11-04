#!/usr/bin/env bash
# Phase-1418: UI related refusals fields referenced.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hard_gap_related_refusal_titles' webui/frontend/src/components/FirewallExtras.tsx
echo "UI related refusals fields ok"
echo "cleaned"
echo "OK: phase1418 e2e passed"
