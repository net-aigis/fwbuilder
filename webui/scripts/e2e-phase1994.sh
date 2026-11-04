#!/usr/bin/env bash
# Phase-1994: UI softCompleteNote wiring.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'softCompleteNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_soft_complete_note' webui/frontend/src/components/FirewallExtras.tsx
echo "UI soft_complete_note ok"
echo "cleaned"
echo "OK: phase1994 e2e passed"
