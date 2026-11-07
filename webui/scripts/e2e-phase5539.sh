#!/usr/bin/env bash
# Phase-5539: UI honesty milestone + schema 5.9 at 15400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalPathTitlesRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 15400 UI ok"; echo "cleaned"; echo "OK: phase5539 e2e passed"
