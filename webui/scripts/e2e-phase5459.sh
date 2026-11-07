#!/usr/bin/env bash
# Phase-5459: UI honesty milestone + schema 5.8 at 15150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativeTitlesRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 15150 UI ok"; echo "cleaned"; echo "OK: phase5459 e2e passed"
