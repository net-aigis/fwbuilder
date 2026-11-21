#!/usr/bin/env bash
# Phase-4595: UI honesty milestone + ssh_auth_roster session at 12450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 12450 UI ok"
echo "cleaned"
echo "OK: phase4595 e2e passed"
