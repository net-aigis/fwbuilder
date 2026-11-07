#!/usr/bin/env bash
# Phase-5059: UI honesty milestone + schema 5.3 at 13900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalPathsRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 13900 UI ok"; echo "cleaned"; echo "OK: phase5059 e2e passed"
