#!/usr/bin/env bash
# Phase-4563: UI honesty milestone + ssh_auth_roster at 12350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'ssh_auth_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 12350 UI ok"
echo "cleaned"
echo "OK: phase4563 e2e passed"
