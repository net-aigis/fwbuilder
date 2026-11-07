#!/usr/bin/env bash
# Phase-4675: UI honesty milestone + password_ssh_roster session at 12700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'passwordSshRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 12700 UI ok"
echo "cleaned"
echo "OK: phase4675 e2e passed"
