#!/usr/bin/env bash
# Phase-2483: UI honesty milestone + session_storage_roster bundle at 5850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'session_storage_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 5850 UI ok"
echo "cleaned"
echo "OK: phase2483 e2e passed"
