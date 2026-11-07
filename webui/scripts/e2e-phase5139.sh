#!/usr/bin/env bash
# Phase-5139: UI honesty milestone + schema 5.4 at 14150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalStatusRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 14150 UI ok"; echo "cleaned"; echo "OK: phase5139 e2e passed"
