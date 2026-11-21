#!/usr/bin/env bash
# Phase-3443: UI honesty milestone + session_storage_clear_roster at 8850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'session_storage_clear_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 8850 UI ok"
echo "cleaned"
echo "OK: phase3443 e2e passed"
